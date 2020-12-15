class InvoiceItem < ApplicationRecord
  validates_presence_of :item_id, foreign_key: true
  validates_presence_of :invoice_id, foreign_key: true
  validates_presence_of :quantity
  belongs_to :invoice
  belongs_to :item
end
