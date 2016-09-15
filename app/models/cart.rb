class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    self.line_items.map do |line_item|
      quantity_in_cart = line_item.quantity
      price_of_item = line_item.item.price
      quantity_in_cart * price_of_item
    end.sum
  end

  # def add_item(item_id)
  #   item_to_be_added = Item.find(item_id)
  #
  #   if self.items.exists?(item_to_be_added.id)
  #     item_in_cart = self.line_items.find_by(item_id: item_to_be_added.id)
  #     item_in_cart.quantity += 1
  #     item_in_cart.save
  #     item_in_cart
  #   else
  #     self.line_items.build(item_id: item_to_be_added.id)
  #   end
  # end

  def add_item(item)
    line_item = self.line_items.find_by(item_id: item)
    if line_item
      line_item.quantity += 1
    else
      line_item = self.line_items.build(cart_id: self.id, item_id: item)
    end
    line_item
  end
end
