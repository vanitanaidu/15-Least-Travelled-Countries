require_relative '../least_travelled'

class Scraper

  def self.get_page
    Nokogiri::HTML(open("http://www.thisisinsider.com/the-least-visited-countries-in-the-world-2015-7"))

  end

  def self.scrape_main_page
    sleep 1
    get_page.css("div.slide-module")
   end

  #  def self.scrape_country_info(keep getting a digit 0 at the end of the method; ask corinna)
   #
  #    info = scrape_main_page.css("p span")
  #    info.each do |each_info|
  #      each_info.text

  # questions = c.css("p strong")[0].text.chop(gives u all three question; why still visit, what else.. etc)

  #    end
  #  end



   def self.create_countries
     scrape_main_page.each do |c|

        name = c.css("h3.slide-title").text.gsub(/\(.*?\)/, "").split(/[.:]/).drop(1).reverse.drop(1).join.strip
        tourists = c.css("h3.slide-title").text.split(" ").last(2).join(" ")
        info = c.css("p span").text.gsub(/[\u0080-\u00ff]/, " ")
        # #-tie-saint-vincent-and-the-grenadines-71000-tourists-4 > p:nth-child(3) > strong
        # info = c.css("p span")
      # why_qns.each {|each_qn| "#{each_qn}?"}
          Country.new(name, tourists, info)

# info.gsub(/[\u0080-\u00ff]/, " ") (to get rid of all the unicodes)
# I still want to get rid of `\"` `why so few?`` and `Source: UNWTO, 2013`

    end
   end


end


Scraper.get_page
Scraper.scrape_main_page
Scraper.create_countries
# Scraper.scrape_country_info
