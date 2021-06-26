class SearchController < ApplicationController
      def search
      @q = Product.ransack(params[:q])
      @Productss = @q.result(distinct: true)
    end
end
