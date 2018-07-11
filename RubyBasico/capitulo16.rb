#El método each extrae cada elemento del array dentro de la variable que se le especifique (que irá entra dos barras | |), que se usará en bloque do…end.

lenguajes = %w{ Ruby Python Java }
lenguajes.each do |lenguaje|
  puts '¡Me gusta ' + lenguaje + '!'
  puts '¿A ti no?'
end
 
#El método {{**delete**}} borra un elemento
lenguajes.delete('Python')
lenguajes.each do |lenguaje|
  puts '¡Me gustaba '+lenguaje+'!'
  puts '¿A ti no?'
end

lenguajes = [["java","python"],[1,2,3],[123,222,222,2,222,2222]]
lenguajes.each do |lenguaje|
	puts lenguaje
	puts "lista de listas 0"
  lenguaje.each do |l|
	  puts l.to_s.upcase + " objeto de la lista"
  end
end

lenguajes = [[[1,2,3],[4,5,6]],[[1,2,3],[4,5,6]],[[1,2,3],[4,5,6]]]
lenguajes.each do |lenguaje|
	  lenguaje.each do |l|
		  l.each do |k|
		  	puts (k.to_i * k).to_s + " " + k.to_s
		  end
	  end
end




vec = [34, 12, 1, 38]
puts vec.sort
puts vec


puts vec.length
puts vec.first
puts vec.last

