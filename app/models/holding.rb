class Holding < ApplicationRecord
    belongs_to :user

    validates :user_id, :ticker, :log_price, presence: true
end
