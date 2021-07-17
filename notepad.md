## conversation naming convention:
    item_id-user1_id-user2-id, where:
        user1 is the user that posted the item
        user2 is the user that messaged user1 through the item listing


## creating a conversation:
    -when user2 clicks item listing, it should create a conversation instance with name item_id-user1_id-user2-id; if it already exists, just redirect to that conversation

## for starting redis server as service:
    run 'sudo service redis-server start'


## bugs to fix:
    1. when an exchange happened in a conversation, sometimes clicking on another conversation and clicking back to the previous conversation, the previous conversation doesn't show the recent exchange

    2. after subscribing to a conversation, clicking a link other than the conversation links does not unsubscribe the user in the current conversation channel; clicking kalakalph which redirects the user to root should terminate the channel subscription

    3. timestamp not working for newly sent messages but refreshing the page fixes it
        - maybe time interval between two consecutive messages should be calculated in the background job

## minor details to add:
    1. channel broadcast when item's status is changed
    2. deleting listing should prompt a verification modal
    3. in conversation show page, add image avatar in conversation name