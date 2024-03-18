# frozen_string_literal: true

module WebpageAnalyzer
  module Insights
    class TopWords
      def self.analyze(content, limit)
        new.analyze(content, limit)
      end

      def analyze(content, limit)
        text = Extractors::HtmlText.extract_text(content)
        word_counts = count_words(text)
        top_words = word_counts.sort_by { |_, count| -count }.first(limit)
        format_words(top_words)
      end

      private

      def count_words(text)
        word_counts = Hash.new(0)
        text.split.each { |word| word_counts[word.downcase] += 1 }
        word_counts
      end

      def format_words(words)
        words.map.with_index(1) { |(word, count), index| "#{index}. #{word}: #{count}" }.join("\n")
      end
    end
  end
end
