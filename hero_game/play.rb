require "./monster"
require "./hero.rb"
require_relative "holy_knight"
require_relative "mage.rb"

# 建立一個有不同職業 （包括英雄、神聖武士與魔法師）的團隊
hero = Hero.new("Robinhood", 100, 20)
holy_knight = HolyKnight.new("Howard", 100, 30)
mage = Mage.new("Merlin",60, 20, 10)

# 列印英雄隊伍
team = Hero.all

puts "You have #{Hero.count} heroes in your team:"

team.each do |hero|
  puts "#{hero.name} - Class:#{hero.class}, HP:#{hero.hp} "
end