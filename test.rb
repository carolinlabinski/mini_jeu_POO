require "pry"
class User
  def show_itself
    print "Voici l'instance : "
    puts self
  end

end

binding.pry
puts "end of file"