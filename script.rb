require_relative 'dados_dos_deputados'

include DadosDosDeputados

File.open('federais.txt', 'w') do |f|
  federais_com_superior_completo.each { |line| f.puts line }
end

File.open('estaduais.txt', 'w') do |f|
  estaduais_com_superior_completo.each { |line| f.puts line }
end
