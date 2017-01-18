class WorldsBestRestaurants::CLI

  def call
    Scraper.new.make_restaurants
    puts "Welcome to the Least Travelled Countries in the World"
    start
  end

  def start
    puts ""
    puts "What number restaurants would you like to see? 1-5, 5-10, 10-15, 15-20 or 20-25?"
    input = gets.strip.to_i

    print_restaurants(input)

    puts ""
    puts "Which country would you like more information on?"
    input = gets.strip

    country = WorldsBestRestaurants::Restaurant.find(input.to_i)

    print_restaurant(country)

    puts ""
    puts "Would you like to see another restaurant? Enter Y or N"

    input = gets.strip.downcase
    if input == "y"
      start
    else
      puts ""
      puts "Thankyou! Have a great day!"
      exit
    end
  end

  def print_restaurant(country)
    puts ""
    puts "----------- #{country.name} - #{restaurant.position} -----------"
    puts ""
    puts "Location:           #{restaurant.location}"
    puts "Head Chef:          #{restaurant.head_chef}"
    puts "Style of Food:      #{restaurant.food_style}"
    puts "Standout Dish:      #{restaurant.best_dish}"
    puts "Contact:            #{restaurant.contact}"
    puts "Website:            #{restaurant.website_url}"
    puts ""
    puts "---------------Description--------------"
    puts ""
    puts "#{restaurant.description}"
    puts ""
  end

  def print_restaurants(from_number)
    puts ""
    puts "---------- Restaurants #{from_number} - #{from_number+9} ----------"
    puts ""
    WorldsBestRestaurants::Restaurant.all[from_number-1, 10].each.with_index(from_number) do |restaurant, index|
      puts "#{index}. #{restaurant.name} - #{restaurant.location}"
    end
  end

end
