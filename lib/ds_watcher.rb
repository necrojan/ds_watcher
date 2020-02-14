require 'nokogiri'
require 'open-uri'

module DsWatcher
  class Watcher
    attr_reader :doc, :url

    def initialize
      @url = 'https://www.viz.com/shonenjump/chapters/demon-slayer-kimetsu-no-yaiba'
      @doc = Nokogiri::HTML(open(url))
    end

    def new_chapter?
      chapter = doc.css('div.type-center.type-sm.line-caption.pad-y-rg.pad-y-md--lg.type-rg--lg:contains("New chapter")')
      return false unless chapter

      true
    end

    def display_recent
      url = doc.css('a.o_chapter-container.disp-bl.color-off-black.hover-off-black.hover-bg-lighter-gray.flex').attribute('href').value
      url
    end
  end
end