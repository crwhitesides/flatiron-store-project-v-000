class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :carts
  belongs_to :current_cart, class_name: 'Cart'  #=> http://guides.rubyonrails.org/association_basics.html#belongs-to-association-reference (focus on 4.1.1.1, 4.1.1.2, 4.1.2.2)

  def create_cart
    self.current_cart ||= Cart.new
  end
end
