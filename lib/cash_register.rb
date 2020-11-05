class CashRegister
    attr_accessor :total, :discount, :items, :last_total, :last_items

    def initialize(discount = 20)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        @last_total = self.total
        @last_items = self.items
        @total += (price * quantity)
        quantity.times{@items << title}
    end

    def apply_discount
        if @total == 0
            "There is no discount to apply."
        else
            self.total = (@total * (1.0 - (0.01 * @discount))).to_i
            "After the discount, the total comes to $#{self.total}."
        end
    end

    def void_last_transaction
        self.total = self.last_total
        self.items = self.last_items
    end

end
