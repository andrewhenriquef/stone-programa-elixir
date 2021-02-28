# shopping_lis:array
#  [product:string unit:integer, price:integer]
#  shoppint_list e.g. ['lemon', 2, 33]
# customers:array
#  [email:string]
#  customers e.g ['player@email.com']
def main(shopping_list, customers)
  shopping_list_value = sum_items_price(shopping_list)
  values_by_customers = how_much_should_customers_pay(shopping_list_value, customers)
  pay_list_with_values(values_by_customers, customers)
end

def sum_items_price(items)
  value_per_item = items.map do |item|
    value = item[2]
    units = item[1]

    value * units
  end

  value_per_item.sum
end

def how_much_should_customers_pay(shopping_list_value, customers)
  return customers.map { |_customer| 0 } if shopping_list_value.zero?
  return [] if customers.size.zero?

  how_much_pay = shopping_list_value / customers.size

  values = []

  while shopping_list_value.positive?
    if (shopping_list_value - how_much_pay) >= how_much_pay
      values << how_much_pay
      shopping_list_value -= how_much_pay
    else
      values << shopping_list_value
      shopping_list_value = 0
    end
  end

  values
end

def pay_list_with_values(values, customers)
  [customers, values].transpose
end
