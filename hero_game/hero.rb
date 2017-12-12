
class Hero

  attr_accessor :hp, :name

  @@heroes = []                                   # 用來儲存所有 heroes 的 array                          # 讓外部的 method 也可以抓到這兩個 variables

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