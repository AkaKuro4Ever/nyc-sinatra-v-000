class LandmarksController < ApplicationController

  get '/landmarks/new' do

    erb :'/landmarks/new'
  end

  get '/landmarks' do
    erb :'/landmarks/index'
  end

  post '/landmarks' do
    @landmark = Landmark.new(params[:landmark])
    @landmark.save

    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by(id: params[:id])

    erb :'/landmarks/edit'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by(id: params[:id])

    erb :'/landmarks/show'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find_by(id: params[:id])
    @landmark.update(params[:landmark])
    redirect to "/landmarks/#{@landmark.id}"
  end

end
