require_relative 'Contador'

class Estoque

	def initialize

		@livros = []
		@vendas = []
		@livros.extend Contador

	end

	def quantidade_de_vendas_por(produto, &campo)
		@vendas.count {	|venda| campo.call(venda) == campo.call(produto) }
	end

	def que_mais_vendeu_por(tipo,&campo)
		@vendas.select {|l| l.tipo == tipo}.sort{|v1,v2| quantidade_de_vendas_por(v1,&campo) <=> quantidade_de_vendas_por(v2,&campo)}.last

	end


  def livro_que_mais_vendeu_por_titulo
      que_mais_vendeu_por("livro", &:titulo)
   end

   def livro_que_mais_vendeu_por_ano
      que_mais_vendeu_por("livro", &:ano_lancamento)
   end

   def livro_que_mais_vendeu_por_editora
      que_mais_vendeu_por("livro", &:editora)
   end

   def revista_que_mais_vendeu_por_titulo
      que_mais_vendeu_por("revista", &:titulo)
   end

   def revista_que_mais_vendeu_por_ano
      que_mais_vendeu_por("revista", &:ano_lancamento)
   end

   def revista_que_mais_vendeu_por_editora
      que_mais_vendeu_por("revista", &:editora)
   end


	def << (livro)
		@livros << livro if livro
	end

	def vende (livro)
		@vendas << livro
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