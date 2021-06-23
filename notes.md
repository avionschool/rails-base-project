## when pulling:
    1. switch to master
    2. run `git stash`
    3. git pull origin master
    4. switch to branch
    5. git rebase master
    6. git stash pop

## when pushing:
    1. *make sure you are in your working branch
    2. git add files to be pushed
    3. git commit
    4. git push origin <branch>
    5. go to github, make the pull request, MAKE SURE TO CHOOSE FORKED REPO



## pag di maayos na namerge yung changes naming dalawa
    ex. conflict sa versions

    1. git add file
    2. git stash pop
    ...


## para tanggalin sa staged:
    1. git restore --staged <file>
    2. git restore <file>
    *check if wala na sa git status
    3. git status

## pag nag-aayos ng commit sa local master branch
    1. git stash
    2. git stash pop
    2. git fetch
    3. git reset --hard origin <gusto mong i-pull na branch>
        -make sure to commit the changes before reset
        -git stash is for this reason

## cleaning up branches
    1. git branch -d localBranchName
        // delete branch locally

    2. git push origin --delete remoteBranchName
        // delete branch remotely

## when cloning remote repo:
    1. create a config/database.yml file
    2. copy contents of config/database.yml.sample to config/database.yml
    3. create a master.key file by running:
        EDITOR="vim --wait" rails credentials:edit
    4. get a copy of master.key and paste in your local master.key


## intransitive assoc (simplest implementation of many to many)
    ex. using models user and role, create a new table (not model) that joins user and role
    1. create a migration file
        'rails g migration create_join_table_<model1_model2> <model1> <model2>'
    2. in user.rb and role.rb, add the following respectively:
        'has_and_belongs_to_many :roles'
        'has_and_belongs_to_many :user'

## mono-transitive assoc (has_many_through)
    -uses a model that holds two models that being related to each other
    2. in user.rb and role.rb, add the following respectively:
        'has_many :user_roles'
        'has_many :roles, through: :user_roles'

        'has_many :user_roles'
        'has_many :users, through: :user_roles'

        in the middle model user_role.rb:
        'belongs_to :user'
        'belongs_to :role'


## updating local repo (git pull)
    *if working branch is not to be deleted, do 2 git pulls: 1 for master and 1 for working branch
    1. go to master branch, run 'git pull'
    2. go to working branch, run 'git pull origin <branchname>'

## para bumilis rails
    rails assets:clean && rails assets:precompile 

## kill server if you lose the terminal tab
    sudo kill -9 $(lsof -i :3000 -t) OR
    Remove the file: C:/Sites/folder/Pids/Server.pids