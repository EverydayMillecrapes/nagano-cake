class Admin::SearchController < ApplicationController
    def search
      @customers = Customer.search(params[:keyword])
      @keyword = params[:keyword]
    end
end
