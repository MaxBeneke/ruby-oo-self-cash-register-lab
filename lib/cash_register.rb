require 'pry'

class CashRegister

    attr_accessor :total, :items, :discount, :last_item_price


    def initialize(discount = 0)
        @discount = discount
        @items = []
        @total = 0
    end

    def add_item(item, price, quantity=1)
        self.total += (price * quantity)

        quantity.to_i.times do
            self.items << item
        end
        
        @last_item_price = (price * quantity)

    end

    def apply_discount
        if self.discount == 0
            "There is no discount to apply."
        else
            self.total = (self.total * (100.0 - self.discount.to_f)/100).to_i
            "After the discount, the total comes to $#{self.total}."
        end
    end

    def void_last_transaction

        self.items.pop

        self.total -= self.last_item_price
    end


end

