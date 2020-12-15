class Invoice < ApplicationRecord
  validates_presence_of :customer_id, foreign_key: true
  validates_presence_of :merchant_id, foreign_key: true
  validates_presence_of :status
  has_many :invoice_items
  has_many :items, through: :invoice_items
  belongs_to :merchant
  belongs_to :customer
end
