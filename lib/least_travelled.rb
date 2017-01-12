require 'pry'

class Least_travelled

  attr_accessor :name, :position, :location, :url, :head_chef, :website_url, :food_style, :best_dish, :contact, :description

  @@all = []

  def self.new_from_index_page(r)
    # r is each name in the scraper class
    self.new(
      r.css("h2").text, #name of the chief
      "http://www.theworlds50best.com#{r.css("a").attribute("href").text}", #website of the chef
      r.css("h3").text, #name of his restaurant
      r.css(".position").text #the position of his restaurant /50. for example no 1 or no 2
      )
  end

  def initialize(name=nil, url=nil, location=nil, position=nil)
    @name = name
    @url = url
    @location = location
    @position = position
    @@all << self
    # when an instance of restaurant is created every one of this instances will have a name, url, location & position
    # and all these attributes will be pushed into @@all the class variable.
  end

  def self.all
    @@all
    # you can find all the restaurants objects with their attributes attched to them
  end

  def self.find(id)
    self.all[id-1]
    binding.pry
  end

  def best_dish
    @best_dish ||= doc.xpath("//div[@class='c-4 nr nt']/ul[3]/li").text
  end

  def food_style
    @food_style ||= doc.xpath("//div[@class='c-4 nr nt']/ul[2]/li").text
  end

  def contact
    @contact ||= doc.xpath("//div[@class='c-4 nr nt']/ul[4]/li[1]").text.split("+").join(". Tel: +")
  end

  def head_chef
    @head_chef ||= doc.xpath("//div[@class='c-4 nr nt']/ul[1]/li").text.split(" (pictured)").join("")
  end

  def website_url
    @website_url ||= doc.xpath("//div[@class='c-4 nr nt']/ul[4]/li[2]/a").text
  end

  def description
    @description ||= doc.xpath("//div[@class='c-8 nl nt']/p[3]").text
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end
end


restaurant = Restaurant.new
Restaurant.all
Restaurant.find(2)
restaurant.best_dishes
restaurant.food_style
restaurant.contact
