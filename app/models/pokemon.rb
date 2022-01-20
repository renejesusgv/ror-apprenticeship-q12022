class Pokemon < ApplicationRecord
  has_and_belongs_to_many :abilities
  has_and_belongs_to_many :types
  belongs_to :color

  validates :name, presence: true, uniqueness: true
  attribute :image, default: 'https://bulma.io/images/placeholders/128x128.png'
end
