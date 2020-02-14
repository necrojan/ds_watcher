require 'ds_watcher'
require 'nokogiri'

RSpec.describe DsWatcher do
  it "has a version number" do
    expect(DsWatcher::VERSION).not_to be nil
  end

  describe '#display_chapter' do
    it 'returns an array' do 
      @watcher = DsWatcher::Watcher.new
      expect(@watcher.display_chapter).to be_a Array
    end
  end

  describe '#new_chapter?' do
    it 'should return a boolean' do
      @watcher = DsWatcher::Watcher.new
      expect(@watcher.new_chapter?).to be(true).or(be(false))
    end
  end

  describe '#get_link?' do
    it 'should return a string' do
      @watcher = DsWatcher::Watcher.new
      result = @watcher.get_link('hello')
      expect(result).to be_a String
    end
  end
end
