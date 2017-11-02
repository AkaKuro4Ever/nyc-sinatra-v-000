class FiguresController < ApplicationController

  get '/figures/new' do

    erb :'/figures/new'
  end

  get '/figures' do

    erb :'/figures/show'
  end

  get '/figures/:id' do
    @figure = Figure.find_by(id: params[:id])

    erb :'/figures/figure'
  end

  post '/figures' do
    @figure = Figure.new(params[:figure])
    if !params[:landmark][:name].empty?
      if @landmark = Landmark.find_by(name: params[:landmark][:name])
        @figure.landmarks << @landmark
      else
        @landmark = Landmark.create(name: params[:landmark][:name])
        @figure.landmarks << @landmark
      end
    end
      if !params[:title][:name].empty?
        if @title = Title.find_by(name: params[:title][:name])
          @title.figures << @figure
        else
          @title = Title.create(name: params[:title][:name])
          @title.figures << @figure
        end
      end
    @figure.save
    @title.save
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by(id: params[:id])
    erb :edit
  end

  patch '/figures/:id' do #edit action
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:id])
    if !params[:landmark][:name].empty?
      if @landmark = Landmark.find_by(name: params[:landmark][:name])
        @figure.landmarks << @landmark
      else
        @landmark = Landmark.create(name: params[:landmark][:name])
        @figure.landmarks << @landmark
      end
    end

    @figure.save
    redirect to "/figure/#{@figure.id}"
  end
end
