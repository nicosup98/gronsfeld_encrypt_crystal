module Gronsfeld
  extend self

  def codificar(texto_plano : String, clave : String) : String
    alfabeto = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    resultado = ""
    clave_index = 0
    texto_plano.upcase.each_char do |letra|
      letra_index = alfabeto.index(letra)
      if letra_index
        clave_letra = clave[clave_index].to_i
        clave_index = (clave_index + 1) % clave.size
        nuevo_index = (letra_index + clave_letra) % alfabeto.size
        resultado += alfabeto[nuevo_index]
      else
        resultado += letra
      end
    end
    return resultado
  end

  def decodificar(texto_codificado : String, clave : String) : String
    alfabeto = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    resultado = ""
    clave_index = 0
    texto_codificado.upcase.each_char do |letra|
      letra_index = alfabeto.index(letra)
      if letra_index
        clave_letra = clave[clave_index].to_i
        clave_index = (clave_index + 1) % clave.size
        nuevo_index = (letra_index - clave_letra) % alfabeto.size
        resultado += alfabeto[nuevo_index]
      else
        resultado += letra
      end
    end
    return resultado
  end

#   texto_plano = "HOLA MUNDO"
#   clave = "1111"
#   texto_codificado = codificar(texto_plano, clave)
#   texto_decodificado = decodificar(texto_codificado, clave)
#   puts texto_codificado   # Imprime "JQNC NUPFR"
#   puts texto_decodificado # Imprime "HOLA MUNDO"
end
