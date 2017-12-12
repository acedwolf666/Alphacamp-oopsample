class Monster

  MAX_HP = 150
  MAX_AP = 50

  attr_accessor :hp, :name                    # 設定物件外部可以直接使用和修改 name 和 hp 的 attributes

  def initialize(name, hp, ap)
    @name = name                              # 設定一個名為 name（名稱）的 attribute

    if MAX_HP < hp
      @hp = MAX_HP
    else
      @hp = hp
    end

    if MAX_AP < ap
      @ap = MAX_AP
    else
      @ap = ap
    end                                       # 設定一個名為 hp（生命值）的 attribute

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

  MAX_HP = 200
  MAX_AP = 80

  attr_accessor :hp, :name

  @@heroes = []                                   # 用來儲存所有 heroes 的 array                          # 讓外部的 method 也可以抓到這兩個 variables

  def initialize(name, hp, ap)
    @name = name
    
    if MAX_HP < hp
      @hp = MAX_HP
    else
      @hp = hp
    end

    if MAX_AP < ap
      @ap = MAX_AP
    else
      @ap = ap
    end                                       # 設定一個名為 hp（生命值）的 attribute

    @alive = true                                   # 英雄剛被創造，所以預設為 true，表示英雄被創造時一定是活著的

    # 印出被創造的英雄的 attributes
    puts "你的英雄 #{@name} 已經誕生了！"
    puts "生命力(HP)：#{@hp}"
    puts "攻擊力(AP)：#{@ap}"
    puts ""

    @@heroes << self                                # 把新建立的這個 hero 加入 array 裡
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

  def self.count
    return @@heroes.length                          # 回傳英雄們的數量
  end

  def self.all
    return @@heroes                                 # 回傳包含所有 hero 的 array
  end
end

class Mage < Hero

  # 新的職業：魔法師 Mage
  # Mage 是繼承 Hero 的 class
  # 他已經具備 Hero 本身的 attributes 與 methods
  # 但他也有只屬於魔法師 attributes 與 methods: mp fireball （火球）

  # Mage class 需要增加一個 attribute: mp
  # 所以要設定一個屬於魔法師 initialize

  def initialize(name, hp , ap, mp)
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

      if enemy.hp < 1
        enemy.die
      end
    else
      # 如果 mp 不夠 3 點，就只能用普通的攻擊，super 會呼叫 Hero 的同名方法 attack
      super(enemy)
    end
  end

  def fireball
    @mp = @mp - 3                                # 每次使用 fireball 要扣 3 點 MP
    return rand(@ap/2..@ap) + 50                 # fireball 造成的傷害是正常攻擊 +50
  end
end

class HolyKnight < Hero

  # 新的職業：神聖武士 HolyKnight
  # HolyKnight 是繼承 Hero 的 class
  # 他已經具備 Hero 本身的 attributes 與 methods
  # 在這裡我們把他的 attack method 修改，讓威力更大！

  def attack(enemy)

    # 新的職業：神聖武士 Holy Knight
    # 攻擊能力：聖光，傷害會隨機取攻擊力（AP）至兩倍 AP 中的數字

    damage = rand(@ap..@ap*2)
    enemy.hp = enemy.hp - damage

    puts "#{@name} 發出聖光!"
    puts "#{enemy.name} 受到 #{damage} 點的傷害"
    puts "#{enemy.name} 剩下 #{enemy.hp} 點 HP"
    puts ""

    if enemy.hp < 1                                 # 生命值小於 1，代表死亡(戰敗)
      enemy.die                                     # 敵人死亡
    end
  end
end


puts "Hero 的 MAX HP 是： #{Hero::MAX_HP}"
puts "Hero 的 MAX AP 是： #{Hero::MAX_AP}"

# 測試是否限制了英雄的 HP 和 AP
hero = Hero.new("Robinhood", 100000, 2000)          # hp 和 ap 沒有超過 MAX_HP 和 MAX_AP 就是限制了