require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

describe "Game Model" do
  it 'can construct a new instance' do
    @game = Game.new
    refute_nil @game
  end

  it 'can add and get players' do
    @game = Game.new
    @user = User.new
    @user.save
    @game.add_player @user.id
    @game.save
    refute_nil @game
    assert_equal @game.players, [@user]
  end
end
