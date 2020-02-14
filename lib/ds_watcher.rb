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

    def display_chapter
      if new_chapter?
        text = []
        coming_soon = doc.css('div.type-center.type-sm.line-caption.pad-y-rg.pad-y-md--lg.type-rg--lg').text.strip!

        text << coming_soon
        text << 'Here are some few chapters to re-read: '
        text.join("\n")

        text + recent_chapters
      end
    end

    def recent_chapters
      text = []
      doc.css('a.o_chapter-container.disp-bl.color-off-black.hover-off-black.hover-bg-lighter-gray.flex').each do |chapter|
        date_published = chapter.css('.pad-y-0.pad-r-0.pad-r-rg--sm').text
        chapter_no = chapter.css('.disp-id.mar-r-sm').text
        link = get_link(chapter.attribute('href').value)
        text << date_published
        text << chapter_no
        text << link
        text.join("\n")
      end
      text
    end

    def get_link(text)
      if text.include? 'join to read'
        'You should join first to read.'
      else
        text
      end
    end
  end
end