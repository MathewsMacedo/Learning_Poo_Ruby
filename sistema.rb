require_relative 'livro'
require_relative 'estoque'
require_relative 'Ebook'
require_relative 'Revista'



estoque = Estoque.new

livro = Livro.new("Programming Ruby", 100, 2004, true, "livro", true)
revistona = Revista.new("Revista de Ruby 3", 10, 2012, true, "Revistas", 3)

estoque << livro << revistona


estoque.vende livro
estoque.vende revistona


puts estoque.livro_que_mais_vendeu_por_titulo.titulo
puts estoque.revista_que_mais_vendeu_por_titulo.titulo
puts livro.possui_reimpressao?