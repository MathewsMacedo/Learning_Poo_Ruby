class Livro

	attr_reader :titulo,:preco, :ano_lacamento

	def initialize(titulo,preco,ano_lacamento, possui_reimpressao)
		@titulo = titulo
		@possui_reimpressao = possui_reimpressao 
		@ano_lacamento = ano_lacamento
		@preco = calcula_desconto(preco)
		
	end

	def possui_reimpressao?
		@possui_reimpressao
	end

	def calcula_desconto(preco)

		if @ano_lacamento < 2006 && !possui_reimpressao?
			return preco*0.95
		elsif @ano_lacamento < 2006 && possui_reimpressao?
			return preco*0.90
		elsif @ano_lacamento <= 2010		
			return preco*0.96
		end
		preco
	end

	def to_csv
      	puts "#{@titulo},#{@ano_lacamento},#{@preco}"
	end


end


module Contador

	def <<(livro)
		push(livro)
	 if @maximo_necessario.nil? || @maximo_necessario < size
		@maximo_necessario = size
	 end
		self

	end
	def maximo_necessario
		@maximo_necessario
	end


end


class Estoque




	def initialize

		@livros = []
		@livros.extend Contador

	end


	def << (livro)
		@livros << livro if livro
	end

	def remove (livro)
		@livros.delete livro
	end

	def maximo_necessario
		@livros.maximo_necessario
	end


	def total
		@livros.size
	end


	def mais_barato_que(valor)
  
		@livros.select do |livro| 
			livro.preco < valor
		end

	end

	def exporta_csv

		@livros.each do |livro|
			livro.to_csv
		end
	end

end

	estoque = Estoque.new

	 
algoritmo = Livro.new("Agile Web Development with Rails",100.00,1998,false)
arquitetura= Livro.new("Introdução À Arquitetura e Design de Software", 70.00,  2011, true)
 
 estoque << algoritmo
 puts estoque.maximo_necessario
 estoque << arquitetura
 puts estoque.maximo_necessario
estoque.remove algoritmo
 
puts estoque.maximo_necessario

puts estoque.total
puts estoque.mais_barato_que 80
estoque.exporta_csv
