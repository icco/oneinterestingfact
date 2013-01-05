require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

describe "Round Model" do
  it 'can construct a new instance' do
    @round = Round.new
    refute_nil @round
  end
end
