## conversation naming convention:
    item_id-user1_id-user2-id, where:
        user1 is the user that posted the item
        user2 is the user that messaged user1 through the item listing


## creating a conversation:
    -when user2 clicks item listing, it should create a conversation instance with name item_id-user1_id-user2-id; if it already exists, just redirect to that conversation

## for starting redis server as service:
    run 'sudo service redis-server start'

## active storage
    1. rails active_storage:install
    2. rails db:migrate
    3. update storage.yml:
        test:
            service: Disk
            root: <%= Rails.root.join("tmp/storage") %>

        local:
            service: Disk
            root: <%= Rails.root.join("storage") %>
    4. update config/environments/development.rb:
        config.active_storage.service = :local
    5. update config/environments/test.rb:
        config.active_storage.service = :test

## imagemagick install
    run: sudo apt-get install imagemagick

## to copy master.key contents to heroku
    run: heroku config:set RAILS_MASTER_KEY=`cat config/master.key`

## bugs to fix:
    1. when an exchange happened in a conversation, sometimes clicking on another conversation and clicking back to the previous conversation, the previous conversation doesn't show the recent exchange

    2. after subscribing to a conversation, clicking a link other than the conversation links does not unsubscribe the user in the current conversation channel; clicking kalakalph which redirects the user to root should terminate the channel subscription

    3. timestamp not working for newly sent messages but refreshing the page fixes it
        - maybe time interval between two consecutive messages should be calculated in the background job

    4. if a user who participated in any conversation is deleted, app gets an error in displaying conversation partners

    5. if a user who participated in any conversation is deleted, app gets an error in displaying conversation partners

    6. when attempting to create or update a listing with validation errors; validation errors don't appear

    7. No button to redirect to home when user is not signed in
    
## minor details to add:
    1. add channel broadcast when item's status is changed
    2. deleting listing should prompt a verification modal
    3. in conversation show page, add main item image in conversation name
    4. add image carousel for item images