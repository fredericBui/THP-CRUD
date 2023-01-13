class Tag < ApplicationRecord
    has_many :gossips, dependent: :delete_all
end
