class CliInterface

  def call
    puts "loading........"
    Scraper.create_countries
    puts "Hi. Welcome to the Least Travelled Countries in the World"
    print_countries
    start
  end

  def start
    puts ""
    puts "Which country would you like more information on? Please key in any number from 1 - 15"

    input = gets.strip.downcase
  
    country = Country.find(input.to_i)
    
    if country
      print_country(country)
    else
      puts "Please enter only numbers 1-15"
      start
    end



    puts ""
    puts "Would you like to see another country? Enter Y or N"

    input = gets.strip.downcase
    if input == "y"
      start
    else
      puts ""
      puts "Thank you!"
      exit
    end
   end

  def print_country(country)
    puts ""
    puts "================ #{country.name.upcase} ================="
    puts ""
    puts "Tourists per year: #{country.tourists}"
    puts ""


    puts "---------- Why so few? ----------"
    puts ""
    puts "#{country.why_so_few}"
    puts ""
    puts "----------- What else -----------"
    puts ""
    puts "#{country.more_info}"
    puts ""
    puts ""
  end

  def print_countries
    puts ""
    puts "---------- Countries ----------"
    puts ""
    Country.all.each.with_index(1) do |country, index|
      puts "#{index}. #{country.name}"

    end
  end


end
