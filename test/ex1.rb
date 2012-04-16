puts "Ejercicio 1"

prueba = %w(ruby es divertido)

def longitudes arr
  arr.map(&:length)
end

puts pruebaputs "Ejercicio 1"

prueba = %w(ruby es divertido)

def longitudes arr
  arr.map(&:length)
end

puts prueba

puts "Ejercicio 2"

prueba = "Ruby es el mejor lenguaje porque ruby es el MEJOR"

def histograma paragraph
  paragraph.downcase!
  palabras = paragraph.split(/\s+/)
  frecuencias = Hash[ palabras.uniq.zip([0]*palabras.uniq.size) ]

  palabras.each do |palabra|
    frecuencias[palabra] += 1
  end

  frecuencias.each do |palabra, frecuencia|
    puts "#{palabra}: #{ '*' * frecuencia}"
  end
end

puts histograma(prueba)

puts "Ejercicio 3"

class Fixnum
  #from http://mitpress.mit.edu/sicp/full-text/book/book-Z-H-11.html#%_sec_1.2
  def prime?
    #computes the exponential of a number modulo another number:
    expmod = ->(base, exp, m) do
      return 1 if exp.zero?
      if exp.even?
        (expmod[base, exp / 2, m] ** 2) % m
      else
        base * expmod[base, exp - 1, m] % m
      end
    end

    (1..100).collect do
      a = rand(1 .. self - 1)
      a == expmod[a, self, self]
    end.all?
  end
end

puts "Ejercicio 4"

def phone_code(phrase)
  keymap = {
    2 => %w(A B C),
    3 => %w(D E F),
    4 => %w(G H I),
    5 => %w(J K L),
    6 => %w(M N O),
    7 => %w(P Q R S),
    8 => %w(T U V),
    9 => %w(W X Y Z),
    0 => [' ']
  }

  find_in_keymap = ->(char) do
    char.upcase!
    the_key, the_mapping = keymap.find{|key, mapping| mapping.include?(char) }
    the_key.to_s * (the_mapping.index(char) + 1)
  end

  phrase.each_char.map(&find_in_keymap).join(" ")
end

