require 'nokogiri'
require 'open-uri'

class Parsing
  def import_ingredient(ingredient, difficulty_criteria = "")
    tabres = []
    url = "http://www.letscookfrench.com/recipes/find-recipe.aspx?s=#{ingredient}"
    html_doc = Nokogiri::HTML(open(url), nil, 'utf-8')
    html_doc.search('.m_contenu_resultat').each do |element|
      recipe = {}
      recipe[:titre] = element.search('.m_titre_resultat').text.strip
      recipe[:description] = element.search('.m_texte_resultat').text.strip
      recipe[:time] = element.search('.m_detail_time').text.strip.gsub(/^\S*\s/, "")
      recipe[:difficulty] = (element.search('.m_detail_recette').text.split('-')[2]).delete(' ').to_s
      if difficulty_criteria.to_s != ""
        tabres << recipe if recipe[:difficulty].downcase == difficulty_criteria.to_s.downcase
      else
        tabres << recipe
      end
    end
    tabres
  end
end
