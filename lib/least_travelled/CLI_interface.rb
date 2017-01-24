class CliInterface

  def call
    Scraper.create_countries
    puts "Hi. Welcome to the Least Travelled Countries in the World"
    start
  end

  def start
    print_countries

    puts ""
    puts "Which country would you like more information on? Please key in any number from 1 - 15"
    input = gets.strip.downcase

    country = Country.find(input.to_i)

    print_country(country)

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
    puts "----------- what_else -----------"
    puts ""
    puts "#{country.more_info}"
    puts ""
    puts ""
  end

  def print_countries
    puts ""
    puts "---------- Countries ----------"
    puts ""
    Country.all.each_with_index do |country, index|
      puts "#{index + 1}. #{country.name}"

    end
  end


end
