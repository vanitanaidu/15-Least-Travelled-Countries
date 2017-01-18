require_relative '../least_travelled'

class Scraper

  def get_page
    Nokogiri::HTML(open("http://www.thisisinsider.com/the-least-visited-countries-in-the-world-2015-7"))
  end

  def scrape_main_page
    sleep 1
    self.get_page.css("div.slide-module")
   end


   def create_countries
    self.scrape_main_page.each do |c|
      Country.new_from_main_page(c)
    end
   end
end

scraper = Scraper.new
scraper.get_page
scraper.scrape_main_page
scraper.create_countries
