# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../../lib/webpage_analyzer/extractors/html_text'
require_relative '../../../../lib/webpage_analyzer/insights/top_words'

module WebpageAnalyzer
  module Insights
    RSpec.describe TopWords do
      describe '.analyze' do
        let(:content) { '<html><body>Test content with test words, and more words.</body></html>' }
        let(:limit) { 2 }

        before do
          allow(WebpageAnalyzer::Extractors::HtmlText).to receive(:extract_text).and_return('Test content with test words and more words ')
        end

        it 'returns the top N words by frequency' do
          expect(TopWords.analyze(content, limit)).to eq("1. test: 2\n2. words: 2")
        end

        it 'handles case insensitivity' do
          expect(TopWords.analyze(content, 3)).to include('test: 2').and include('words: 2')
        end

        it 'formats the output correctly' do
          formatted_output = TopWords.analyze(content, limit)
          expect(formatted_output).to match(/\d+\. \w+: \d+/)
        end

        context 'when limit is more than unique words count' do
          let(:limit) { 10 }
          it 'returns all words without exceeding the total count' do
            result = TopWords.analyze(content, limit)
            expect(result.split("\n").length).to be <= 6 # Total unique words expected from the content
          end
        end
      end
    end
  end
end
