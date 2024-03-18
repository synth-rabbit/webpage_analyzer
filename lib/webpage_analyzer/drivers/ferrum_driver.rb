# frozen_string_literal: true

require('ferrum')

module WebpageAnalyzer
  module Drivers
    class FerrumDriver
      def self.fetch_page_content(url)
        browser = Ferrum::Browser.new

        browser.goto(url)
        content = browser.body
        browser.quit
        content
      end
    end
  end
end
