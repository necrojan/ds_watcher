require 'ds_watcher'
require 'nokogiri'

RSpec.describe DsWatcher do
  it "has a version number" do
    expect(DsWatcher::VERSION).not_to be nil
  end

  describe '#display_recent' do
    it 'returns a url string' do 
      @watcher = DsWatcher::Watcher.new
      expect(@watcher.display_recent).to be_a String
    end
  end

  describe '#new_chapter?' do
    it 'returns boolean' do
      @watcher = DsWatcher::Watcher.new
      expect(@watcher.new_chapter?).to be(true).or(be(false))
    end
  end
end
