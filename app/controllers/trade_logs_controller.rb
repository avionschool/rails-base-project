class TradeLogsController < ApplicationController
    def index 
        @trades = current_user.trade_logs
    end

end
