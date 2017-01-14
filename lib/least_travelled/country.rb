require_relative '../lib/least_travelled'

class Country

  attr_accessor :name, :info, :doc

  @@all = []

  def self.new_from_index_page(country_names)
    # r is each name in the scraper class
    binding.pry
    # self.new(
    #   r.css("h2").text, #name of the chief
    #   "http://www.theworlds50best.com#{r.css("a").attribute("href").text}", #website of the chef
    #   r.css("h3").text, #name of his restaurant
    #   r.css(".position").text #the position of his restaurant /50. for example no 1 or no 2
    #   )
  end

  def initialize(name=nil, info=nil, doc=nil)
    @name = name
    @info = info
    @doc = doc
    @@all << self
    # when an instance of country is created every one of this instances will have a name & info
    # and all these attributes will be pushed into @@all the class variable.
  end

  def self.all
    @@all
    # you can find all the restaurants objects with their attributes attched to them
  end

  def self.find(id)
    self.all[id-1]
  end


  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end
end



LeastTravelled::Scraper.new_from_index_page(country_names)
country = LeastTravelled::Country.new
LeastTravelled::Country.all
LeastTravelled::Country.find(2)
