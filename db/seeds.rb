# Seed process should be made from a different file under services folder.
# Use namespacing for a more readable code

SeedsServices::CreateUsers.new.call
SeedsServices::CreateMainbookEntries.new.call
SeedsServices::CreateAdmin.new.call

