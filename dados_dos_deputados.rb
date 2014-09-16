require "nokogiri"
require "open-uri"

class DadosDosDeputados

  def federais_com_superior_completo
    federais = []

    (1..2).each do |pagina|
      document = Nokogiri::HTML(open("http://www.eleicoes2014.com.br/candidatos-deputado-federal-goias/#{pagina}/"))

      federais.concat candidatos_com_superior_por_pagina(document)
    end
    federais
  end

  def estaduais_com_superior_completo
    estaduais = []

    (1..15).each do |pagina|
      document = Nokogiri::HTML(open("http://www.eleicoes2014.com.br/candidatos-deputado-estadual-goias/#{pagina}/"))

      estaduais.concat candidatos_com_superior_por_pagina(document)
    end
    estaduais
  end

private

  def candidatos_com_superior_por_pagina(doc_html)
    candidatos = []
    pool = []

    doc_html.css('.candidate').each do |link|
      link_candidato = link.attr('href')

      pool << Thread.new {
        if possui_ensino_superior? link_candidato
          candidatos << link_candidato
        end
      }
    end
    pool.each(&:join)

    candidatos
  end

  def possui_ensino_superior?(link_candidato)
    perfil_candidato = Nokogiri::HTML(open("http://www.eleicoes2014.com.br#{link_candidato}"))

    dados_candidato = perfil_candidato.css('#main-content p')[1].text
    link_candidato if dados_candidato.match(/Superior completo/)
  end
end
