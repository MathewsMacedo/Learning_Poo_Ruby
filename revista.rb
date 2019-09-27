require_relative 'produto'
require_relative 'impresso'

class Revista < Produto
	include Impresso

	def initialize(titulo,preco,ano_lacamento, editora,possui_reimpressao,numero)
		super(titulo,ano_lacamento,preco,editora)
		@possui_reimpressao = possui_reimpressao 
		@numero = numero
		
		
	
	end



  def matches?(query)
    ["revista", "impresso"].include?(query)
  end

end




