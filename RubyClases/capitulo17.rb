# define la clase Perro  
class Perro  
 
  # método inicializar clase
  def initialize(raza, nombre)  
    # atributos   
    @raza = raza  
    @nombre = nombre  
    @edad = 13
  end  
 
  # método ladrar
  def ladrar
    puts 'Guau! Guau!'  
  end  
 
  # método saludar
  def saludar
    puts "Soy un perro de la raza #{@raza} y mi nombre es #{@nombre}"  
  end # método saludar
  def saludar2
    puts "Soy un perro"  
  end

  def nombre
    puts "el Nombre del perro es #{@nombre}"
  end  
  def edad
    puts "#{@nombre} tiene #{@edad} años"
  end  
end  
 
# para hacer nuevos objetos,
# se usa el método new
d = Perro.new('Labrador', 'Benzy')  

d.ladrar
d.saludar  
 
# con esta variable, apuntamos al mismo objeto  
d1 = d  
d1.saludar
 
d = nil  
d1.nombre
d1.edad

d = Perro.new('Raza 1', 'Benzy 1')  

d.ladrar
d.saludar 
 
# con esta variable, apuntamos al mismo objeto  
d1 = d  
d1.saludar
 
d = nil  
d1.nombre
d1.edad

d = Perro.new('Raza 2', 'Benzy 2')  

d.ladrar
d.saludar  
 
# con esta variable, apuntamos al mismo objeto  
d1 = d  
d1.saludar
 
d = nil  
d1.nombre
d1.edad












