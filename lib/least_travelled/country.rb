require_relative '../least_travelled'

class Country

  attr_accessor :name, :url, :no_of_tourists, :information, :doc

  @@all = []

  def self.new_from_main_page(c)
     self.new(
       c.css("h3.slide-title").text,
       "http://www.thisisinsider.com/the-least-visited-countries-in-the-world-2015-7"
      )
        # #{c.css(".btn.resize href").text}
        # "http://www.thisisinsider.com/the-least-visited-countries-in-the-world-2015-7#{c.css("a").attribute("href").text}"
         #name alone no numbers no tourists
  end

  def initialize
    @name = name
    @url =  url
    @@all << self
    # when an instance of country is created every one of the instances will have a name
    # and it will be pushed into @@all the class variable.
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

  def no_of_tourists
    binding.pry
doc.css("")

  end

  def information
  end

  def doc

    @doc = Nokogiri::HTML(open(self.url))
    binding.pry

  end

end

country = Country.new
country.doc
# scraper = Scraper.new
