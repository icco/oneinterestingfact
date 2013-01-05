require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

describe "Game Model" do
  it 'can construct a new instance' do
    @game = Game.new
    refute_nil @game
  end
end
