class Livro

	attr_reader :titulo,:preco, :ano_lacamento, :editora, :tipo

	def initialize(titulo,preco,ano_lacamento, possui_reimpressao,editora,tipo)
		@titulo = titulo
		@possui_reimpressao = possui_reimpressao 
		@ano_lacamento = ano_lacamento
		@preco = calcula_desconto(preco)
		@editora = editora
		@tipo = tipo
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


