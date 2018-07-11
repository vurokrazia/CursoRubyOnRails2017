load 'operaciones.rb'

puts "¿Como te llamas?"
nombre = gets.chomp
c = Operaciones.new(nombre)
while true
	puts "Hola #{c.nombre}"
	puts "¿Que deseas hacer?"
	puts "1.- Suma\t2.-Resta\t3.-Division\t4.-Multiplicacion\t0.- Adios"
	opcion = gets.chomp.to_i
	seleccion = case opcion
		when 0 then "Adios..."
		when 1 then "Suma"
		when 2 then "Resta"
		when 3 then "Division"
		when 4 then "Multiplicacion"
		else "No ingreso ninguna opcion valida"
	end
	if opcion != 0
		puts "Cual es el primer valor"
		a = gets.chomp.to_i
		puts "Cual es el segundo valor"
		b = gets.chomp.to_i
		if opcion == 1
			r = c.suma(a,b)
		elsif opcion == 2
			r = c.resta(a,b)
		elsif opcion == 3
			r = c.division(a,b)
		elsif opcion == 4
			r = c.multiplicacion(a,b)
		else
			puts "No ingreso ninguna opcion valida"
		end
		puts "El valor de #{seleccion} es #{r} "
	else
		puts seleccion
		break
	end
end