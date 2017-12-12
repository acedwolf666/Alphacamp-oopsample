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

    if enemy.hp < 1                                 # 生命值小於 1，代表死亡(戰敗)
      enemy.die                                     # 敵人死亡
    end
  end

  def die                                           # 代表死亡(戰敗)
    @alive = false
  end
end

# 以下是執行步驟

monster = Monster.new("Bone", 100, 30)           # 用 Monster class 創造一個 name 為 Bone 的物件，放入 monster 這個變數裡