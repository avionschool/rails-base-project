## conversation naming convention:
    item_id-user1_id-user2-id, where:
        user1 is the user that posted the item
        user2 is the user that messaged user1 through the item listing


## creating a conversation:
    -when user2 clicks item listing, it should create a conversation instance with name item_id-user1_id-user2-id; if it already exists, just redirect to that conversation

## for starting redis server as service:
    run 'sudo service redis-server start'