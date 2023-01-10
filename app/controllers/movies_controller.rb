class MoviesController < ApplicationController
  
  def new
    @movie = Movie.new
  end
  
  def index
    matching_movies = Movie.all

    @movies = matching_movies.order(created_at: :desc)

    respond_to do |format|
      format.json do
        render json: @movies
      end
      format.html
    end
  end

  def show
    @movie = Movie.find(params.fetch(:id))
  end

  def create
    @movie = Movie.new
    @movie.title = params.fetch("title")
    @movie.description = params.fetch("description")
    #@movie.released = params.fetch("query_released", false)

    if @movie.valid?
      @movie.save
      redirect_to movies_url, notice: "Movie created successfully." 
    else
      #cookies[:title] = params.fetch("query_title")
      #cookies[:description] = params.fetch("query_description")
      #cookies[:released] = params.fetch("query_released")
      #redirect_to("/movies/new", { :alert => the_movie.errors.full_messages.to_sentence })

      render "new"

    end
  end

  def edit
    @movie = Movie.find(params.fetch(:id))
  end

  def update
    @movie = Movie.find(params.fetch(:id))

    @movie.title = params.fetch("query_title")
    @movie.description = params.fetch("query_description")
    @movie.released = params.fetch("query_released", false)

    if movie.valid?
      movie.save
      redirect_to movie_url(the_movie), notice: "Movie updated successfully."
    else
      redirect_to movie_url(the_movie), alert: the_movie.errors.full_messages.to_sentence 
    end
  end

  def destroy
    @movie = Movie.find(params.fetch(:id))

    movie.destroy

    redirect_to movies_url, notice: "Movie deleted successfully."
  end
end
