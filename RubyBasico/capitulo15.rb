
#Un array puede ser un conjunto de elementos distintos:
=begin
  un array cuyos elementos 
  apuntan a otros tres objetos:
  un decimal, un string y un array
=end
sabor = 'fresa'  
puts [123,123]
vec4 = [80.5, sabor, [true, false]]  
puts vec4[2]


#Algunas veces, crear arrays de palabras puede ser tedioso debido a tantas comillas y comas. Afortunadamente, Ruby tiene una forma más cómoda para hacerlo:
nombres1 = [ 'ann', 'richard', 'william', 'susan', 'pat' ]  
puts nombres1[0] # ann  
puts nombres1[3] # susan  
 
# esto es más sencillo y más rápido:  
nombres2 = %w{ Ann richard william susan pat jesus alberto }  
puts nombres2


# esto es más sencillo y más rápido:  
puts "Ejemplo"
nombres2 = %w{ Ann 23 william susan 44 jesus 5.2 }
puts nombres2


    %r() Para expresiones regulares
    %q() Para strings con salto de linea
    %Q() numeros double
    %x() comandos de terminal

nombres2.each do |a|
  puts a.class
end
nombres2 = %Q{ 2 3 4 5 }
nombres2.each do |a|
  puts a.class
end