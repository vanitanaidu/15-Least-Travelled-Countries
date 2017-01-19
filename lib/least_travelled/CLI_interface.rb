# class CLI
#
#   def call
#     Scraper.new.make_restaurants
#     puts "Welcome to the Least Travelled Countries in the World"
#     start
#   end
#
#   def start
#     puts ""
#     puts "Whaich continent are you interested in? Europe, Asia, South-America, North-America, Africa"
#     input = gets.strip.downcase
#
#     print_restaurants(input)
#
#     puts ""
#     puts "Which country would you like more information on?"
#     input = gets.strip
#
#     country = WorldsBestRestaurants::Restaurant.find(input.to_i)
#
#     print_restaurant(country)
#
#     puts ""
#     puts "Would you like to see another country? Enter Y or N"
#
#     input = gets.strip.downcase
#     if input == "y"
#       start
#     else
#       puts ""
#       puts "Thankyou! Have a great day!"
#       exit
#     end
#   end
#
#   def print_restaurant(country)
#     puts ""
#     puts "----------- #{country.name} -----------"
#     puts ""
#     puts "No. of Tourists every year:           #{restaurant.tourist}"
#     puts "Information:          #{country.information}"
#
#     puts "---------------Description--------------"
#     puts ""
#     puts "#{restaurant.description}"
#     puts ""
#   end
#
#   def print_restaurants(from_number)
#     puts ""
#     puts "---------- Restaurants #{from_number} - #{from_number+9} ----------"
#     puts ""
#     WorldsBestRestaurants::Restaurant.all[from_number-1, 10].each.with_index(from_number) do |restaurant, index|
#       puts "#{index}. #{country.name} - #{country.tourists}"
#     end
#   end
#
# end
