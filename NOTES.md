## User
Attributes:
- email
- password

Associations:
has_many :carts
 

## Cart
Attributes:
- status
- user_id

Associations:
- belongs_to :user
- has_many :line_items
- has_many :items, through: :line_items


## line_item
Attributes:
- quantity:integer, default: 1
- cart_id
- item_id

Associations:
- belongs_to :cart
- belongs_to :item


## Item
Attributes:
- title
- price
- inventory:integer
- category_id

Associations:
- belongs_to :category
- has_many :line_items


## Category
Attributes:
- title

Associations:
- has_many :items
