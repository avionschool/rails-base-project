# Hi there 👋

This repo serves as the main repo for our Rails Projects. 


#### Version

```
  Ruby 2.7.2
  Rails 6.0.3.4
  NodeJS 12.18.3
  Yarn 1.22.4
```

#### Installation

Fork this repo:
![image](https://user-images.githubusercontent.com/9253881/111437757-6c527f00-873e-11eb-8d0a-862e4158f4ab.png)

Then, clone your forked repo to your machine
```
  $ git clone git@github.com:<username>/rails-base-project.git <name of your app>
  $ cd <name of your app>
```

#### Setup

```
  $ bundle install
  $ rake db:setup
```

#### Starting the application

```
  $ rails server
```

#### How to run the test suite

```
  $ rspec
```

#### How to run the Ruby Linter

```
  $ rubocop
```

#### How to enable Github Workflow

<img width="906" alt="Screen Shot 2021-03-23 at 10 10 52 PM" src="https://user-images.githubusercontent.com/9253881/112160501-2fe2bf80-8c25-11eb-8e2b-b9508711ec70.png">

<img width="1244" alt="Screen Shot 2021-03-23 at 10 11 12 PM" src="https://user-images.githubusercontent.com/9253881/112160530-36713700-8c25-11eb-9f00-d69a3a36343f.png">





# Coingecko API Wrapper

An oversimplified implementation of [Coingecko's API.](https://www.coingecko.com/en/api/documentation)

## Sample implementation

### Calling the API Client

```ruby
client = Coingecko::Client

# => Coingecko::Client
```

## Methods

All methods return a hash with the respective code, status, and data

**Example**
```ruby
Coingecko::Client.price('solana,solana-inu')
# => {
#   :code=>200, 
#   :status=>"success", 
#   :data=>{
#     "solana"=>{
#       "usd"=>152.74,
#       "usd_24h_vol"=>2009909657.375851, 
#       "usd_24h_change"=>7.494044333858691
#     }, 
#     "solana-inu"=>{
#       "usd"=>0.00513933, 
#       "usd_24h_vol"=>1047.4507977351539, 
#       "usd_24h_change"=>5.0945403311024355
#     }
#   }
# }
```

### Get coins list

Get all of Coingecko's listed coins. This is needed for getting Coingecko IDs for getting the price of the coin!

- Parameters: none
- Returns: an array of coins listed by coingecko

**Example**
```ruby
Coingecko::Client.list[:data]

# returns a very long list
# but here's a snippet of it!
# => [
#     ...,
#       {
#         "id" => "solana",
#         "symbol" => "sol",
#         "name" => "Solana"
#       },
#       {
#         "id" => "solana-inu",
#         "symbol" => "inu",
#         "name" => "Solana Inu"
#       },
#     ...
#    ]
```

### Get simple price

Get the latest USD price of the coin, including its 24hr price change and 24hr traded volume. This is to be used in conjunction with [coins list](#get-coins-list).


- Parameters
    - ids can be a single coin ID or multiple coin IDs, but if multiple, combine them with commas, or put them in an array (see example below)
- Returns: a JSON object with its last price (usd), 24hr volume (usd_24h_vol), and (usd_24h_change)

**Example**
```ruby
ids = "solana,solana-inu"
# or
ids = ["solana", "solana-inu"]
# will both work

Coingecko::Client.price(ids)[:data]
# => {
#     "solana"=>{
#       "usd"=>152.74,
#       "usd_24h_vol"=>2009909657.375851, 
#       "usd_24h_change"=>7.494044333858691
#     }, 
#     "solana-inu"=>{
#       "usd"=>0.00513933, 
#       "usd_24h_vol"=>1047.4507977351539, 
#       "usd_24h_change"=>5.0945403311024355
#     }
#   }
```