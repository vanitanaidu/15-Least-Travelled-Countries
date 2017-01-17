require_relative '../least_travelled'

class Scraper

  def get_page
    Nokogiri::HTML(open("http://www.thisisinsider.com/the-least-visited-countries-in-the-world-2015-7?op=0#25-tie-east-timor-78000-tourists-2"))
  end

  def scrape_main_page
    #  names of the least travelled countries; include numbers)
    binding.pry
     self.get_page.css("div.slideshow-content").text
     self.get_page.css("clearfix")
    #\32 5-tie-dominica-78000-tourists-1 > h3
    #\32 5-tie-dominica-78000-tourists-1 > p:nth-child(3) > span > strong

    binding.pry
   end


   def create_countries
    self.scrape_main_page.each do |c|
      Country.new_from_main_page(c)
    end
   end
end
#
scraper = Scraper.new
scraper.get_page
scraper.scrape_main_page
scraper.create_countries
