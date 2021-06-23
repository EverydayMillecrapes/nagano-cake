class Admin::GenresController < ApplicationController
def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_back(fallback_location: admin_genres_path)
end
def index
    @genre = Genre.new
    @genres = Genre.all
end

def edit
    @genre = Genre.find(params[:id])
end

def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
        redirect_to admin_genres_path, notice: "You have updated genre successfully."
    else
        render "edit"
    end
end

def genre_params
    params.require(:genre).permit(:name)
end

end
