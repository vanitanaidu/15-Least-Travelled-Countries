require 'open-uri'
require 'nokogiri'
require 'pry'
require_relative "../lib/country.rb"

# class Scraper
#
#   def get_page
#     doc = Nokogiri::HTML(open("http://www.thisisinsider.com/the-least-visited-countries-in-the-world-2015-7?op=1/#-tie-saint-vincent-and-the-grenadines-71000-tourists-4"))
#   end
#
#
#   def self.scrape_title
#     self.get_page.css("h3").css(".slide-title").each do |title|
#     # new = title.text.slice(/[A-Z]([a-z])+/)
#     end
#   end
#
#
#   def self.scrape_profile_page
#     page = Nokogiri::HTML(open("http://www.thisisinsider.com/the-least-visited-countries-in-the-world-2015-7?op=1/#-tie-saint-vincent-and-the-grenadines-71000-tourists-4"))
#     page.css(".slide-module").css("p").css("strong")[0].text #(this give yous: Why so few? Why still visit? What else?)
#
#
#     binding.pry
#   end
#
#
# end
#
#
# Scraper.scrape_title
# Scraper.scrape_profile_page


class Scraper

  def get_page
    Nokogiri::HTML(open("http://www.thisisinsider.com/the-least-visited-countries-in-the-world-2015-7?op=1/#-tie-saint-vincent-and-the-grenadines-71000-tourists-4"))
  end

  def scrape_country_names
    #  names of the least travelled countries; include numbers)
    self.get_page.css("h3").css(".slide-title")
  end

  def create_countries
    scrape_country_names.each do |country_names|
      # country_names =  names of countries ('scrape_country_names')

    Country.new_from_index_page(country_names)
      # binding.pry
      #the programmer is now using a method from the the restaurant.rb file and assigning 'r' (each of the names)
    end
  end
end

scraper = Scraper.new
scraper.scrape_country_names

scraper = Scraper.new
scraper.create_countries
