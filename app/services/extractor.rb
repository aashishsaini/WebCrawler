class Extractor
  attr_accessor :eval_page
  attr_accessor :page

  def initialize(url)
    @page = HTTParty.get(url).body
  end

  def eval_page
    @eval_page ||= Nokogiri::HTML(page)
  end

  def call
    collection = {}
    %w(a h1 h2 h3).each_with_index do |element, i|
      collection[element] = []
      eval_page.css(element).each do |item|
        collection[element].push(i == 0 ? item[:href] : item.text)
      end
    end
    collection
  end
end
