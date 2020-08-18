class Order < ApplicationRecord
  belongs_to :box
  belongs_to :user
end
