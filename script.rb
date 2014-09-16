require_relative 'dados_dos_deputados'

dados = DadosDosDeputados.new

File.open('federais.txt', 'w') do |f1|
  dados.federais_com_superior_completo.each { |line| f1.puts line }
end

File.open('estaduais.txt', 'w') do |f2|
  dados.estaduais_com_superior_completo.each { |line| f2.puts line }
end
