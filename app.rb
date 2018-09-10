require 'sinatra/base'
require './lib/players'
require './lib/the_computer'
require './lib/game_logic'

class RockPaperScissors < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    $player_name = Players.new(params[:player_name])
    redirect '/play'
  end

  get '/play' do
    @player_name = $player_name.player_1
    erb :play
  end

  post '/winner' do
    $player_option = params[:player_option]
    # $computer_option = TheComputer.new
    redirect '/winner'
  end

  get '/winner' do
    @player_option = $player_option
    @player_1_name = $player_name.player_1
    # @computer_option = $computer_option.computer_choice
    winner = GameLogic.new(@player_1_name)
    @the_winner = winner.get_winner(@player_option)
    erb :winner
  end
end