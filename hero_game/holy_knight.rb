require_relative "hero"

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