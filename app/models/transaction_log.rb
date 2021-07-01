class TransactionLog < ApplicationRecord
  belongs_to :buyer_transaction, foreign_key: 'transaction_id', class_name: 'Transaction'
end
