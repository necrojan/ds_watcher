require 'nokogiri'
require 'open-uri'

module DsWatcher
  class Watcher
    attr_reader :doc, :url

    def initialize
      @url = 'https://www.viz.com/shonenjump/chapters/demon-slayer-kimetsu-no-yaiba'
      @doc = Nokogiri::HTML(open(url))
      @text = []
    end

    def coming_soon?
      chapter = doc.css('div.type-center.type-sm.line-caption.pad-y-rg.pad-y-md--lg.type-rg--lg:contains("New chapter")')
      return false unless chapter

      true
    end

    def new_chapter
      if coming_soon?
        coming_soon = doc.css('div.type-center.type-sm.line-caption.pad-y-rg.pad-y-md--lg.type-rg--lg').text.strip!
        @text << coming_soon
      else
        @text << 'Here are some few chapters to re-read: '
        @text.join("\n")

        @text + recent_chapters
      end
    end

    def recent_chapters
      doc.css('a.o_chapter-container.disp-bl.color-off-black.hover-off-black.hover-bg-lighter-gray.flex').each do |chapter|
        date_published = chapter.css('.pad-y-0.pad-r-0.pad-r-rg--sm').text
        chapter_no = chapter.css('.disp-id.mar-r-sm').text
        link = get_link(chapter.attribute('href').value)
        @text << date_published
        @text << chapter_no
        @text << link
        @text.join("\n")
      end
      @text
    end

    def get_link(text)
      if text.include? 'join to read'
        'Visit https://www.viz.com/shonenjump/chapters/demon-slayer-kimetsu-no-yaiba to join and read.'
      else
        'https://viz.com' + text
      end
    end
  end
end