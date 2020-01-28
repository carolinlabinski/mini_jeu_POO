class Player
    attr_accessor :name, :life_points

    def initialize(name)
        @name = name 
        @life_points = 10
    end

    def show_state 
        print "#{@name} a #{@life_points} points de vie"
    end

    def gets_damage(damage)
        @life_points = @life_points - damage
       if  @life_points <= 0
        puts "Le joueur #{@name} a été tué!"
       end
    end

    def attacks (ennemy)
        puts "Le joueur #{name} attaque le joueur #{ennemy.name}."
        damage = compute_damage
        puts "Il lui inflige #{damage} points de dommages."
        ennemy.gets_damage(damage)
    end

    def compute_damage
        return rand(1..6)
    end

end

class HumanPlayer < Player
    attr_accessor :weapon_level

    def initialize(name)
        super(name)
        @weapon_level = 1
        @life_points = 100
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end

    def show_state_user
        puts "#{name} a #{life_points} points de vie et une arme de niveau #{@weapon_level}"
    end

    def search_weapon
       weapon_level2 = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{weapon_level2}, ton arme actuelle a le niveau #{@weapon_level}!"
        if weapon_level2 > @weapon_level
            @weapon_level = weapon_level2
            puts "Youhou ! Elle est meilleure que ton arme actuelle : tu la prends."
        else weapon_level2 <= @weapon_level
            puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
        end
    end

    def search_health_pack
         resultat_de = rand(1..6)
        if resultat_de == 1
            puts "Dommage, tu n'as rien trouvé!"
        elsif resultat_de >= 2 && resultat_de <= 5
            life_points =+ 50
            puts "Bravo, tu as trouvé un pack de +50 points de vie !"
        else resultat_de == 6
            life_points += 80
            puts "Waow, tu as trouvé un pack de +80 points de vie !"
        end
    end

end