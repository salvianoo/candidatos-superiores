require_relative 'dados_dos_deputados'

dados = DadosDosDeputados.new

File.open('federais.txt', 'w') do |f|
  dados.federais_com_superior_completo.each { |line| f.puts line }
end

File.open('estaduais.txt', 'w') do |f|
  dados.estaduais_com_superior_completo.each { |line| f.puts line }
end
