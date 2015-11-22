# Lunch Lady Pseudocode: Basic Objectives:
# ­ user chooses from a list of main dishes
# ­ user chooses 2 side dish items
# ­ computer repeats users order
# ­ computer totals lunch items and displays total
# Bonus Objectives:
# ­ user can choose as many "add­on" items as they want before getting total
# ­ user can clear their choices and start over
# ­ user has a wallet total they start with and their choices cannot exceed what they can pay for
require 'pry'

class Lunch_Lady
  attr_accessor :number, :name, :price

  def initialize (number, name, price)
    @number = number
    @name = name
    @price = price
  end

  spaghetti = Lunch_Lady.new(1, 'Spaghetti', 7)
  beef_burgunday = Lunch_Lady.new(2, 'Beef Burgundy', 14)
  chicken_noodle = Lunch_Lady.new(3, 'Chicken Noodle Soup', 4.5)
  chef_salad = Lunch_Lady.new(4, "Chef's Salad", 6.75)
  @main_menu = [spaghetti, beef_burgunday, chicken_noodle, chef_salad]

  garden_salad = Lunch_Lady.new(1, 'Garden Salad', 4.0)
  sourdough = Lunch_Lady.new(2, 'Sourdough Bread Slice', 2.0)
  potatoes = Lunch_Lady.new(3, 'Roasted Potatoes', 3.0)
  green_beans = Lunch_Lady.new(4, 'Green Beans', 3.5)
  @side_menu = [garden_salad, sourdough, potatoes, green_beans]

  @final_order = {}
  @number = 0
  @sum = 0

  def self.main_dish_order
    this_menu = @main_menu
    puts "Today's Main Dishes:"
    @main_menu.each { |item| puts "#{item.number}: #{item.name} $#{item.price}" }
    puts "What would you like for your main dish?"
    this_order = gets.strip
    order(this_order, this_menu)
  end

  def self.side_orders
    answer = ''
    this_menu = @side_menu
    while answer != 'no'
      puts "Today's Side Dishes:"
      @side_menu.each { |item| puts "#{item.number}: #{item.name} $#{item.price}" }
      puts "What would you like for your next dish?"
      this_order = gets.strip
      order(this_order, this_menu)
      puts "Order another side? yes/no"
      answer = gets.strip.downcase
    end
  end

  def self.order(input_order, input_menu)
    this_menu = input_menu
    this_order = input_order
    case this_order
    when '1', '2', '3', '4'
      check_wallet(this_menu, this_order)
    else
      puts error_message(this_menu)
    end
  end

  def self.check_wallet(input_menu, input_order)
    this_menu = input_menu
    this_order = input_order
    @sum += this_menu[this_order.to_i-1].price.to_f
    if @sum > @money
      puts 'It seems that you do not have enough money to order that dish.'
      @sum -= this_menu[this_order.to_i-1].price.to_f
    else
      @number +=1
      @final_order[@number] = this_menu[this_order.to_i-1.to_i]
      puts 'Adding that to your order.'
    end
  end

  def self.clear_order
    puts 'Is this correct?'
    @answer = gets.strip.downcase
    case @answer
    when 'no'
      puts 'Clear order and start over?'
      @clear = gets.strip.downcase
      case 
        @clear
      when 'yes'
        @final_order = {}
        @number = 0
        @sum = 0
      else
        puts 'Please pay your bill total'
      end
    else
      puts 'Please pay your bill total'
    end
  end

  def self.error_message(menu)
    this_menu = menu
    puts 'We do not have that dish today.'
    puts 'Please choose another:'
    this_order = gets.strip
    order(this_order, this_menu)
  end

  def self.wallet_maximum
    puts 'You cannot order more than you can pay for.'
    puts 'Please enter how much money you have in your wallet in $ amounts:'
    @money = gets.to_i
    puts "You're wallet contains $#{@money}."
  end


  def self.lunch_lady
    puts 'Welcome to Lunch Lady.'
    @clear = ''
    @answer = ''
    wallet_maximum
    while @clear != 'no' && @answer != 'yes'
      main_dish_order
      side_orders
      puts "Your current order includes:"
      (1..@final_order.length).each { |item| puts @final_order[item].name}
      clear_order
    end
    puts "Which comes to: $#{@sum}"
  end
end


Lunch_Lady.lunch_lady


