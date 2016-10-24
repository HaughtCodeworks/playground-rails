class Item < ApplicationRecord
  belongs_to :list
  has_one :status, through: :list
end
