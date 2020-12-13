# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

# before running "rake db:seed", do the following:
# - put the "rails-engine-development.pgdump" file in db/data/
# - put the "items.csv" file in db/data/

cmd = "pg_restore --verbose --clean --no-acl --no-owner -h localhost -U $(whoami) -d rails-engine_development db/data/rails-engine-development.pgdump"
puts "Loading PostgreSQL Data dump into local database with command:"
puts cmd
system(cmd)

csv_text = File.read(Rails.root.join("db", "data", "items.csv"))
csv_collection = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
csv_collection.each_slice(1000) do |csv|
  csv.each do |row|
    t = Item.new
    t.id = row["id"]
    t.name = row["name"]
    t.description = row["description"]
    t.unit_price = row["unit_price"]
    t.merchant_id = row["merchant_id"]
    t.created_at = row["created_at"]
    t.updated_at = row["updated_at"]
    t.save
  end
end

# TODO
# - Import the CSV data into the Items table
# - Add code to reset the primary key sequences on all 6 tables (merchants, items, customers, invoices, invoice_items, transactions)
