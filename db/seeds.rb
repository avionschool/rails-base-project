# Seed process should be made from a different file under services folder.
# Use namespacing for a more readable code

SeedsServices::CreateUsers.new.call
SeedsServices::CreateMainbookEntries.new.call
SeedsServices::CreateAdmin.new.call

# For Faker
3.times do
  AbcProduct.create(
    product_name: Faker::Appliance.equipment,
    product_price: Faker::Number.binary(digits: 3), 
    user_status: [true, false].sample
  )
end