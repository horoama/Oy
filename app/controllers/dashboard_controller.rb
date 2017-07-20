class DashboardController < ApplicationController
    def index
        @followings = following
    end
private
    def following
        current_user.following
    end
end
