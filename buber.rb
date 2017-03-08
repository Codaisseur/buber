require_relative "spacetaxi.rb"
require_relative "passenger.rb"

class Buber
  attr_accessor :space_taxis

  def initialize(space_taxis = [], passengers = [])
    @space_taxis = space_taxis
    @passengers = passengers
  end

  def run
    puts "Welcome to Space Taxi!"
    for i in (1..20)
      @space_taxis << Spacetaxi.new("red", "round", i)
    end
    register
    list_taxis
    pick_taxi
    pay
  end

  def register
    puts "Because we're a Facebook company, we would like to know who you are. "
    print "What's your first name? "
    first_name = gets.chomp
    print "That's an awesome first name. What's your last name? "
    last_name = gets.chomp
    print "Great! And, how old are you? "
    age = gets.chomp.to_i
    @passengers << Passenger.new(first_name, last_name, age)
  end

  def list_taxis
    @space_taxis.each do |taxi|
      if taxi.available
        puts "Space Taxi #{taxi.taxi_number} is available."
      end
    end
  end

  def pick_taxi
    possible_taxi = false
    puts "Which taxi would you like? Enter the taxi number."
    @preferred_taxi = gets.chomp.to_i
    @space_taxis.each do |taxi|
      if taxi.taxi_number == @preferred_taxi
        if taxi.available
          taxi.available = false
          possible_taxi = true
        end
      end
    end
    if possible_taxi
      print "Great, we'll arrange that taxi for you. Where should it go get you? "
      gets.chomp
      puts "Got it, we're coming for you!"
      sleep(5)
    else
      puts "Sorry, that taxi is currently unavailable."
      list_taxis
      pick_taxi
    end
  end

  def pay
    puts "Thanks for riding a space taxi. We've arrived at your destination. Please, make your payment."
    @space_taxis.each do |taxi|
      if taxi.taxi_number == @preferred_taxi
        taxi.available = true
      end
    end
  end
end
