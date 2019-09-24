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
		
	end

end
 algoritmo = Livro.new("Agile Web Development with Rails",100.00,1998,false)
 arquitetura= Livro.new("Introdução À Arquitetura e Design de Software", 70.00,  2011, true)

 livros = [algoritmo,arquitetura]


puts "Newsletter Titulo: #{algoritmo.titulo}\nValor: #{algoritmo.preco}\nAno: #{algoritmo.ano_lacamento}"