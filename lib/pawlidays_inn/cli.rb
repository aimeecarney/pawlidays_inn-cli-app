#Our CLI Controller
class PawlidaysInn::CLI

  def call
    puts "Welcome to Pawlidays Inn!"
    start
  end

  def start

    puts ""
    puts "Please enter the state (spelled out) you would like to visit with Perro:"
    state = gets.strip
    puts "Please enter the city:"
    city = gets.strip
    puts ""
    puts ""
    url = "http://hotels.petswelcome.com/#{state}/#{city}/"
    results_page = PawlidaysInn::Scraper.get_page(url)
    PawlidaysInn::Scraper.make_listings

    puts "Pet Friendly Hotels in #{city.capitalize}, #{state.capitalize}:"
    puts ""

    PawlidaysInn::Listing.all.each.with_index(1) do |listing, i|
      puts "#{i}. #{listing.name}"
      end

    puts ""
    puts "Which listing would you like more information on? (please enter number)"
    puts ""


      def print_listing(input)
        PawlidaysInn::Scraper.scrape_listing
      end


  end

end
