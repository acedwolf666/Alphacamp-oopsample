  class Monster

    attr_accessor :hp, :name                    # 設定物件外部可以直接使用和修改 name 和 hp 的 attributes

    def initialize(name, hp, ap)
      @name = name                              # 設定一個名為 name（名稱）的 attribute
      @hp = hp                                  # 設定一個名為 hp（生命值）的 attribute
      @ap = ap                                  # 設定一個名為 ap（攻擊值）的 attribute
      @alive = true                             # 怪獸剛被創造，所以預設為 true，表示怪獸創造時一定是活著的

      # 印出被創造的怪獸的 attributes
      puts "遇到怪獸 #{@name} 了!"
      puts "生命力(HP)：#{@hp}"
      puts "攻擊力(AP)：#{@ap}"
      puts ""
    end

    def is_alive?
      return @alive
    end

    def attack(enemy)
      damage = rand(@ap/2..@ap)                   # 傷害會隨機取攻擊力的一半（AP／2）至 AP 的數字
      enemy.hp = enemy.hp - damage                # 新的生命力是生命力減去傷害

      # 印出攻擊的過程
      puts "#{@name} 攻擊!"
      puts "#{enemy.name} 受到 #{damage} 點傷害"
      puts "#{enemy.name} 剩下 #{enemy.hp} 點 HP"
      puts ""

      if enemy.hp < 1                                 # 生命值小於 1，代表死亡(戰敗)
        enemy.die                                     # 敵人死亡
      end
    end

    def die                                           # 代表死亡(戰敗)
      @alive = false
      puts "#{@name} 被打倒了"
    end
  end

  class Hero

    attr_accessor :hp, :name                          # 讓外部的 method 也可以抓到這兩個 variables

    def initialize(name, hp, ap)
      @name = name
      @hp = hp
      @ap = ap
      @alive = true                                   # 英雄剛被創造，所以預設為 true，表示英雄被創造時一定是活著的

      # 印出被創造的英雄的 attributes
      puts "你的英雄 #{@name} 已經誕生了！"
      puts "生命力(HP)：#{@hp}"
      puts "攻擊力(AP)：#{@ap}"
      puts ""
    end

    def is_alive?
      return @alive
    end

    def attack(enemy)
      damage = rand(@ap/2..@ap)                       # 傷害會隨機取攻擊力的一半（AP／2）至 AP 中的數字
      enemy.hp = enemy.hp - damage                    # 新的生命力是生命力減去傷害

      # 印出攻擊的過程
      puts "#{@name} 攻擊!"
      puts "#{enemy.name} 受到 #{damage} 點傷害"
      puts "#{enemy.name} 剩下 #{enemy.hp} 點 HP"
      puts ""

      if enemy.hp < 1                                 # 生命值小於 1，代表死亡(戰敗)
        enemy.die                                     # 敵人死亡
      end
    end

    def die                                           # 代表死亡(戰敗)
      @alive = false
      puts "#{@name} 被打倒了"
    end
  end

  class Mage < Hero

    # 新的職業：魔法師 Mage
    # Mage 是繼承 Hero 的 class
    # 他已經具備 Hero 本身的 attributes 與 methods
    # 但他也有只屬於魔法師 attributes 與 methods: mp fireball （火球）

    # Mage class 需要增加一個 attribute: mp
    # 所以要設定一個屬於魔法師 initialize

    def initialize(name, hp, ap, mp)
      super(name, hp, ap)                               # 用繼承的語法 super 來設定屬於 Hero 的 attributes，super 會呼叫 Hero 的同名方法 initialize

      # 新增一個 attribute: mp (魔法力)
      @mp = mp
    end

    # Mage class 也需要增加一個 method: fireball
    # 同時也要修改他的 attack method

    def attack(enemy)
      # 這個遊戲我們設計 Mage 每次用 fireball 都需要 3 點 mp， mp 不足的話無法使用
      if @mp >= 3
        damage = fireball
        enemy.hp = enemy.hp - damage

        puts "#{@name} 噴射火球!"
        puts "#{enemy.name} 受到 #{damage} 點的傷害"
        puts "#{enemy.name} 剩下 #{enemy.hp} 點 HP"
        puts ""

        if enemy.hp < 1                                 # 生命值小於 1，代表死亡(戰敗)
          enemy.die                                     # 敵人死亡
        end
      else
        # 如果 mp 不夠 3 點，就只能用普通的攻擊，super 會呼叫 Hero 的同名方法 attack
        super(enemy)
      end
    end

    def fireball
      @mp = @mp - 3                                # 每次使用 fireball 要扣 3 點 MP
      return rand(@ap/2..@ap) + 50        # fireball 造成的傷害是正常攻擊 +50
    end
  end

  # 以下是執行步驟
  # 遊戲開始

  # 用 mage 這個 variable 設定一個名為 Merlin 的魔法師
  # 再用 monster 來設定一個叫 Bone 的怪獸

  mage = Mage.new("Merlin", 60, 20, 10)             # 用 Mage class 創造一個 name 為 Merlin 的物件，放入 mage 這個 variable 裡
  monster = Monster.new("Bone", 100, 30)            # 用 Monster class 創造一個 name 為 Bone 的物件，放入 monster 這個 variable 裡

  while mage.is_alive? && monster.is_alive?         # 如果雙方都還活著，就繼續互相攻擊
    mage.attack(monster)                            # 魔法師先攻擊
    if !monster.is_alive?                           # 判斷怪獸是否已經身亡
      break
    end

    monster.attack(mage)                            # 怪獸攻擊
  end
