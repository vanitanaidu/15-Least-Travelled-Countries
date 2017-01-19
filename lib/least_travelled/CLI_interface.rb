class CliInterface

  def call
    Scraper.create_countries
    puts "Hi. Welcome to the Least Travelled Countries in the World"
    puts "Please look at the following countries and pick one"
    start
  end

  def start
    print_countries

    puts ""
    puts "Which country would you like more information on? Please key the a number"
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
    puts "--------------- #{country.name} ------------------"
    puts ""
    puts "Every year #{country.name} gets #{country.tourists}"
    puts ""
    puts ""

    puts "------------------#{country.questions} --------------"
    puts ""
    puts "#{country.answers}"
    puts ""
  end

  def print_countries
    puts ""
    puts "---------- Countries ----------"
    puts ""
    Country.all.each_with_index do |country, index|
      puts "#{index + 1}. #{country.name} - #{country.tourists}"
    end
  end

end
