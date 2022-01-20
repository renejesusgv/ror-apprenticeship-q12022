class Color < ApplicationRecord
  validates :name, inclusion: { in: %w[Black Blue Brown Gray Green Pink Purple Red White Yellow] }
end
