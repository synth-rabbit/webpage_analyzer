# frozen_string_literal: true

require('cgi')

module WebpageAnalyzer
  module Extractors
    class HtmlText
      def self.extract_text(html)
        new.extract_text(html)
      end

      def extract_text(html)
        html = remove_script_tags(html)
        html = remove_svg_tags(html)
        html = remove_style_tags(html)
        html = remove_html_tags(html)


        clean_text(html)
      end

      private

      def remove_script_tags(html)
        html.gsub(%r{<script[^>]*>.*?</script>}m, '')
      end

      def remove_svg_tags(html)
        html.gsub(%r{<svg[^>]*>.*?</svg>}m, '')
      end

      def remove_style_tags(html)
        html.gsub(%r{<style[^>]*>.*?</style>}m, '')
      end

      def remove_html_tags(html)
        html.gsub(%r{</?[^>]*>}, '')
      end

      def clean_text(text)
        text.gsub(/[^a-zA-Z0-9 ']/, '')
            .squeeze(' ')
      end
    end
  end
end
