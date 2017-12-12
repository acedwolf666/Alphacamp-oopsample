class Monster

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

end

# 以下是執行步驟

monster = Monster.new("Bone", 100, 30)           # 用 Monster class 創造一個 name 為 Bone 的物件，放入 monster 這個變數裡