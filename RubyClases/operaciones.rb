class Operaciones
	def initialize(nombre)
		@nombre = nombre
	end
	def suma(a,b)
		a + b
	end
	def resta(a,b)
		a - b
	end
	def multiplicacion(a,b)
		a * b
	end
	def division(a,b)
		a / b
	end
	attr_reader :nombre
end