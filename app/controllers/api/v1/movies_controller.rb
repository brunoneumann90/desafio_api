class Api::V1::MoviesController < ApplicationController

  def index
    if request.query_string.present?
      @movies = Movie.search_by(params[:year] || params[:genre] || params[:country])
    else
      @movies = Movie.all.order('year DESC')
    end
  end

end
