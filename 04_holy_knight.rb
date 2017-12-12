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
    puts "#{@name} 被打倒了"
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

class HolyKnight < Hero

  # 新的職業：神聖武士 HolyKnight
  # HolyKnight 是繼承 Hero 的 class
  # 他已經具備 Hero 本身的 attributes 與 methods
  # 在這裡我們把他的 attack method 修改，讓威力更大！

  def attack(enemy)

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

# 以下是執行步驟
# 遊戲開始

holy_knight = HolyKnight.new("Howard", 100, 30)          # 用 Holyknight class 創造一個 name 為 Howard 的物件，放入 holy_knight 這個 variable 裡
monster = Monster.new("Bone", 100, 30)                   # 用 Monster class 創造一個 name 為 Bone 的物件，放入 monster 這個 variable 裡

while holy_knight.is_alive? && monster.is_alive?         # 如果雙方都還活著，就繼續互相攻擊對方
  holy_knight.attack(monster)                            # 神聖武士先攻擊
  if !monster.is_alive?                                  # 判斷怪獸是否被英雄打倒
    break
  end

  monster.attack(holy_knight)                            # 怪獸攻擊
end
