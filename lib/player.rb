class Player # classe avec attribut read et write  
    attr_accessor :name, :life_points
    
  
    def initialize(name) # variables d'instances nom et nombre de points de vie
      @name = name
      @life_points = 10
    end
  
    def show_state # état du joueur
      return "#{@name} a #{@life_points} points de vie"
    end
  
    def gets_damage(damaged_received) # nombre de coups reçus
      @life_points -= damaged_received
  
          if @life_points <= 0
            puts "le joueur #{@name} a été tué !"
          end
    end
  
    def attacks(player) # attaque du joueur 1 sur le joueur 2
      puts "le joueur #{@name} attaque le joueur #{player.name}"
      damage = compute_damage
      puts "il lui inflige #{damage} points de dommages"
      player.gets_damage(damage)
    end
  
    def compute_damage # dégâts random effectués à chaque lancé
      return rand(1..6)
    end
  
  end
  
  
  class HumanPlayer < Player # nouveau type de joueur avec même attribut que le player et un nouvel attribut
      attr_accessor :weapon_level
  
    def initialize(name)
      super(name)
        @life_points = 100
        @weapon_level = 1
      end
  
    def show_state
      return "#{@name} a #{@life_points} points de vie et une arme de niveau #{weapon_level}"
    end
  
    def compute_damage 
      rand(1..6) * @weapon_level
    end
  
    def search_weapon
      weapon_level_new = rand(1..6)
      puts "Tu as trouvé une arme de niveau #{weapon_level_new}"
  
      if weapon_level_new > @weapon_level
        @weapon_level = weapon_level_new
        puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
      else
        puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
      end
    end
  
    def search_health_pack
      health_pack = rand(1..6)
  
      if health_pack == 1
        puts "Tu n'as rien trouvé... "
      elsif health_pack.between?(2, 5)
        @life_points += 50
        puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      elsif
        @life_points += 80
        puts "Waow, tu as trouvé un pack de +80 points de vie !"
      end
  
      if @life_points > 100
        @life_points = 100
      end
    end
  end