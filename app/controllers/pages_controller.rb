class PagesController < ActionController::Base
    def index
        @name = params[:name]
    end
end
