# Takes an array of stock prices, one for each hypothetical day. Returns a pair of days representing the best day to buy and the best day to sell. Days start at 0.
def stock_picker(stock_prices) 
  lowest_buy_price = stock_prices.at(0) || 0
  lowest_buy_index = 0
  max_profit = 0
  max_profit_indices = []
  stock_prices.each_with_index do |curr_price, curr_index|
    if (curr_price < lowest_buy_price) then
      lowest_buy_price = curr_price
      lowest_buy_index = curr_index
    end
    curr_profit = curr_price - lowest_buy_price
    if (curr_profit >= max_profit) then
      max_profit = curr_profit
      max_profit_indices = [lowest_buy_index, curr_index]
    end
  end
  max_profit > 0 ? max_profit_indices : nil
end