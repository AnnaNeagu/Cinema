class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    movies_array = Array.new

    @movies.each do |movie|
      movies_array << get_formatted_movies(movie) 
    end

    render json: movies_array, status: 200
  end

  def show
    @movies = Movie.find(params[:id])
    
    if @movies
      render json: get_formatted_movie(@movies), status: 200
    else
      render status: 404
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie =  Movie.new(movie_params)
    if @movie.save
      head 200 
    end
  end


  private
  def movie_params
    params.require(:movie).permit(:title, :description, :year, :generes, :rating, :running_time, :trailer, :image)
  end
  def get_formatted_movies(movie)
    formatted_movie = {
      title: movie.title,
      description: movie.description,
      year: movie.year,
      generes: movie.generes,
      rating: movie.rating,
      running_time: movie.running_time,
      trailer: movie.trailer,
      image: movie.image
    }
  end
end
