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

@menu = {main_dishes: {'1'=> {name:'Spaghetti', price: '7'},
                       '2'=> {name:'Beef Burgundy', price: '14.00'},
                       '3'=> {name: 'Chicken Noodle Soup', price: '4.50'},
                       '4'=> {name: "Chef's Salad", price: '6.75'} 
                       }, 
       side_dishes: {'1'=> {name: 'Garden Salad', price: '4.00'}, 
                     '2'=> {name: 'Sourdough Bread Slice', price: '2.00'}, 
                     '3'=> {name: 'Roasted Potatoes', price: '3.00'}, 
                     '4'=> {name: 'Green Beans', price: '3.50'} }
      }

@final_order = {}
@number = 0
@sum = 0

def error_message(menu)
  this_menu = menu
  puts 'We do not have that dish today.'
  puts 'Please choose another:'
  this_order = gets.strip
  order(this_order, this_menu)
end

# refactor this into multiple methods
def order(input_order, input_menu)
  this_menu = input_menu
  this_order = input_order
  case this_order
  when '1', '2', '3', '4'
    check_wallet(this_menu, this_order)
  else
    puts error_message(this_menu)
  end
end

def check_wallet(input_menu, input_order)
  this_menu = input_menu
  this_order = input_order
  @sum += @menu[this_menu][this_order][:price].to_f
  if @sum > @money
    puts 'It seems that you do not have enough money to order that dish.'
    @sum -= @menu[this_menu][this_order][:price].to_f
  else
    @number +=1
    @final_order[@number] = @menu[this_menu][this_order]
    puts 'Adding that to your order.'
  end
end

def main_dish_order
  this_menu = :main_dishes
  puts "Today's Main Dishes:"
  @menu[:main_dishes].each { |num, value| puts "#{num}: #{value[:name]} $#{value[:price]}"}
  puts "What would you like for your main dish"
  this_order = gets.strip
  order(this_order, this_menu)
end

def side_orders
  answer = ''
  this_menu = :side_dishes
  while answer != 'no'
    puts "Today's Side Dishes:"
    @menu[:side_dishes].each { |num, value| puts "#{num}: #{value[:name]} $#{value[:price]}"}
    puts "What would you like for your next dish?"
    this_order = gets.strip
    order(this_order, this_menu)
    puts "Order another side? yes/no"
    answer = gets.strip.downcase
    puts `clear`
  end
end

def clear_order
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


def wallet_maximum
  puts 'You cannot order more than you can pay for.'
  puts 'Please enter how much money you have in your wallet in $ amounts:'
  @money = gets.to_i
  puts "You're wallet contains $#{@money}."
end


def lunch_lady
  puts 'Welcome to Lunch Lady.'
  @clear = ''
  @answer = ''
  wallet_maximum
  while @clear != 'no' && @answer != 'yes'
    main_dish_order
    side_orders
    puts "Your current order includes:"
    (1..@final_order.length).each { |num| puts @final_order[num][:name]}
    clear_order
  end
  puts "Which comes to: $#{@sum}"
end


lunch_lady


### @main_dish.key(value) pulls out the key associated with that value

