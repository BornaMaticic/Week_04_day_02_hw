require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?


require_relative( './models/game.rb' )
also_reload( './models/*' )



get '/game/:rock/:scissors' do
  hand1 = params[:rock]
  hand2 = params[:scissors]
  the_game = RPSGame.new(hand1, hand2)
  @game = the_game.check_win
  erb( :result )
end

get '/welcome' do
  erb (:welcome)
end
