# Seed process should be made from a different file under services folder.
# Use namespacing for a more readable code

SeedsServices::CreateAdmins.new.call
SeedsServices::CreateUsers.new.call
SeedsServices::CreateStockData.new.call
