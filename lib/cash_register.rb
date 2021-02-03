require "pry"

class CashRegister

    attr_accessor :discount, :total, :items, :last_item

    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @last_item = {}
        @items = []
    end

    def add_item title, price, quantity = 1
        if quantity > 1
            quantity.times do
                @items << title
            end
        else 
            @items << title
        end 
        @last_item = {title: title, price: price, quantity: quantity}
        @total += (price * quantity)
        @total
    end 
    
    def apply_discount
        if discount > 0
            percent_discount = discount / 100.0
            amount_off = @total * percent_discount
            @total -= amount_off.to_int 
            "After the discount, the total comes to $#{@total}."
        else  
            "There is no discount to apply."
        end 
    end 

    def void_last_transaction 
        item_price = @last_item[:price] * @last_item[:quantity]
        @total -= item_price
        @items.pop 
        # if @items.length == 0 
        #     @total = 0.0
        # end 

    end 


end 

