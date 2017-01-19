require_relative '../least_travelled'

class Scraper

  def self.get_page
    Nokogiri::HTML(open("http://www.thisisinsider.com/the-least-visited-countries-in-the-world-2015-7"))

  end

  def self.scrape_main_page
    sleep 1
    get_page.css("div.slide-module")
   end

   def self.scrape_country_info

     info = scrape_main_page.css("p span")
     info.each do |each_info|
       each_info.text
     end
   end



   def self.create_countries
    scrape_main_page.each do |c|

      name = c.css("h3.slide-title").text.split(/[:]/).delete_at(0).split.last #(doesn't work ask Corinna)  

      binding.pry
      tourists = c.css("h3.slide-title").text.split(" ").last(2).join(" ")
      info = c.css("p").text.split("?")
      info = c.css("p span")
      # why_qns.each {|each_qn| "#{each_qn}?"}
      Country.new(name, tourists, info)

    end
   end


end


Scraper.get_page
Scraper.scrape_main_page
Scraper.create_countries
Scraper.scrape_country_info
