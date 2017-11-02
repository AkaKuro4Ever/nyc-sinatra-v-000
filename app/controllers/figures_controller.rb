class FiguresController < ApplicationController

  get '/figures/new' do

    erb :'/figures/new'
    binding.pry
  end

end
