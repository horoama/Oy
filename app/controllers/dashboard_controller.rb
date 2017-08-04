class DashboardController < ApplicationController
    def index
        @user_id = current_user.id
        @followings = following
        @justoy = Justoy.new()
    end

private
    def following
        current_user.following
    end
end
