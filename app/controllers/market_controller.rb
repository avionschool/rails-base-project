class MarketController < ApplicationController

    def index
        # SELECT "stocks".* FROM "stocks" INNER JOIN "users" ON "users"."id" = "stocks"."user_id" INNER JOIN "roles" ON "roles"."id" = "users"."role_id" WHERE (role_name = 'broker') LIMIT $1 
        @stocks = Stock.joins(user: :role).where("role_name = 'broker'").limit(10)
    end
end
