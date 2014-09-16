require_relative 'dados_dos_deputados'

script = DadosDosDeputados.new

File.open('federais.txt', 'w') do |f1|
  script.federais_com_superior_completo.each { |line| f1.puts line }
end

File.open('estaduais.txt', 'w') do |f2|
  script.estaduais_com_superior_completo.each { |line| f2.puts line }
end
