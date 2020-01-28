require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "------------------------------------------------"

puts "Quel est ton prénom?"
print ">"
name = gets.chomp 
user = HumanPlayer.new(name)

player1 = Player.new("Josiane")
player2 = Player.new("José")
enemies = []
enemies << player1
enemies << player2

while user.life_points > 0 && player1.life_points > 0 ||  player2.life_points > 0 do

    puts "Tu as #{user.life_points} life points."
    puts "----------------------------------"
    puts "Quelle action veux-tu effectuer ?"
    puts "---------------------------------"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    

    puts "attaquer un joueur en vue :"
    puts "---------------------------"
    if player1.life_points > 0 
        puts "0 - #{player1.name} a #{player1.life_points} life points"
    end
    if player2.life_points > 0 
        puts "1 - #{player2.name} a #{player2.life_points} life points"
    end
    puts "_________________________"
    puts "Merci de sélectionner un des choix suivants: a,s,0,1."
    print ">"
    selection = gets.chomp 
    if selection == "a"
        user.search_weapon
    elsif selection == "s"
        user.search_health_pack
    elsif selection == "0"
        user.attacks(player1)
    else selection == "1"
        user.attacks(player2)
    end

    enemies.each do |ennemy|
        if ennemy.life_points <= 0 
            break
        else  
            puts "Les autres joueurs t'attaquent !"
            ennemy.attacks(user)
        end
    end 

end
puts "La partie est finie"
    if user.life_points <= 0
        puts "Loser ! Tu as perdu !"
    else
        puts "BRAVO ! TU AS GAGNE !" 
    end

