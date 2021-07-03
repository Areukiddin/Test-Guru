class GistsController < ApplicationController
  def create(params)
    params[:question].gists.build(url: params[:result].url, user: params[:user]).save!
  end
end
