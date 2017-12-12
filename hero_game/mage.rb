require_relative "hero"

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