# Lunch Lady Pseudocode: Basic Objectives:
# ­ user chooses from a list of main dishes
# ­ user chooses 2 side dish items
# ­ computer repeats users order
# ­ computer totals lunch items and displays total
# Bonus Objectives:
# ­ user can choose as many "add­on" items as they want before getting total
# ­ user can clear their choices and start over
# ­ user has a wallet total they start with and their choices cannot exceed what they can pay for

@menu = {main_dishes: {'1'=> {name:'Spaghetti', price: 7.00},
                       '2'=> {name:'Beef Burgundy', price: 14.00},
                       '3'=> {name: 'Chicken Noodle Soup', price: 4.50},
                       '4'=> {name: "Chef's Salad", price: 6.75} 
                       }, 
       side_dishes: {'1'=> {name: 'Garden Salad', price: 4.00}, 
                     '2'=> {name: 'Sourdough Bread Slice', price: 2.00}, 
                     '3'=> {name: 'Roasted Potatoes', price: 3.00}, 
                     '4'=> {name: 'Green Beans', price: 3.50} }
      }

@order = {}

def main_dish
  puts "Today's Main Dishes:"
  @menu[:main_dishes].each { |num, value| puts "#{num}: #{value[:name]} $#{value[:price]}"}
  puts "What would you like for your main dish"
  main_order = gets.strip
  case main_order
  when '1', '2', '3', '4'
    @order[:main_order] = @menu[:main_dishes][main_order]
  # when 'Spaghetti', 'Beef Burgundy', 'Chicken Noodle Soup', "Chef's Salad"
  #   @order[:main_order] = 
  else
    puts 'We do not have that dish today.'
  end
end


def side_dish_1
  puts "Today's Side Dishes:"
  @menu[:side_dishes].each { |num, value| puts "#{num}: #{value[:name]} $#{value[:price]}"}
  puts "What would you like for your 1st side dish?"
  side_order_1 = gets.strip
  case side_order_1
  when '1', '2', '3', '4'
    @order[:side_order_1] = @menu[:side_dishes][side_order_1]
  # when 'Spaghetti', 'Beef Burgundy', 'Chicken Noodle Soup', "Chef's Salad"
  #   @order[:main_order] = 
  else
    puts 'We do not have that dish today.'
  end
end

def side_dish_2
  puts "What would you like for your 2nd side dish?"
  side_order_2 = gets.strip
  case side_order_2
  when '1', '2', '3', '4'
    @order[:side_order_2] = @menu[:side_dishes][side_order_2]
  # when 'Spaghetti', 'Beef Burgundy', 'Chicken Noodle Soup', "Chef's Salad"
  #   @order[:main_order] = 
  else
    puts 'We do not have that dish today.'
  end
end

def order
  main_dish
  side_dish_1
  side_dish_2
  puts "One #{@order[:main_order[:name]]} 
  with a side of #{@order[:side_order_1][:name]} and #{@order[:side_order_2][:name]}"
  puts "Which comes to:" 
  puts @order[:main_order][:price] + @order[:side_order_1][:price] + @order[:side_order_2][:price]
end

order




