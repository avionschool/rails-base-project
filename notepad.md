## conversation naming convention:
    item_id-user1_id-user2-id, where:
        user1 is the user that posted the item
        user2 is the user that messaged user1 through the item listing


## creating a conversation:
    -when user2 clicks item listing, it should create a conversation instance with name item_id-user1_id-user2-id; if it already exists, just redirect to that conversation

## for starting redis server as service:
    run 'sudo service redis-server start'


## bugs to fix:
    -when user is not logged in, clicking a listing with comments returns an error
    -when an exchange happened in a conversation, sometimes clicking on another conversation and clicking back to the previous conversation, the previous conversation doesn't show the recent exchange