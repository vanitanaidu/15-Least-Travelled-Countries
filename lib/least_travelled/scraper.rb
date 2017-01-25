require_relative '../least_travelled'

class Scraper

  def self.get_page
    Nokogiri::HTML(open("http://www.thisisinsider.com/the-least-visited-countries-in-the-world-2015-7"))
  end

  def self.scrape_main_page
    sleep 3
    get_page.css("div.slide-module")
  end

   def self.create_countries
     scrape_main_page.each do |c|

        name = c.css("h3.slide-title").text.gsub(/\(.*?\)/, "").split(/[.:]/).drop(1).reverse.drop(1).join.strip
        tourists = c.css("h3.slide-title").text.split(" ").last(2).join(" ")
        why_so_few = c.css("p:nth-child(4)").text.gsub(/[\u0080-\u00ff]/, " ").gsub(/[\\]/, " ").gsub(/(Why still visit?)[?]/, " ")

            one = c.css("p:nth-child(5)").text.gsub(/[\u0080-\u00ff]/, " ").gsub(/[\\]/, " ").gsub(/(What else)[?]/, "").gsub(/(Why still visit?)[?]/, "")
            two = c.css("p:nth-child(6)").text.gsub(/[\u0080-\u00ff]/, " ").gsub(/[\\]/, " ").gsub(/(What else)[?]/, "").gsub(/(Why still visit?)[?]/, "")
            three = c.css("p:nth-child(7)").text.gsub(/[\u0080-\u00ff]/, " ").gsub(/[\\]/, " ").gsub(/(What else)[?]/, "").gsub(/(Why still visit?)[?]/, "")
        more_info = "#{one} " + "#{two} " + "#{three} "

          Country.new(name, tourists, why_so_few, more_info)
     end
   end

end


Scraper.get_page
Scraper.scrape_main_page
Scraper.create_countries
