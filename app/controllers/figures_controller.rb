class FiguresController < ApplicationController

  get '/figures/new' do

    erb :'/figures/new'
  end

  get '/figures' do

    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by(id: params[:id])
    erb :'/figures/edit'
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

  post '/figures/:id' do #edit action
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])
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
        @figure.titles << @title
      else
        @title = Title.create(name: params[:landmark][:name])
        @figure.titles << @title
      end
    end

    @figure.save
    redirect to "/figures/#{@figure.id}"
  end
end
