# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../../lib/webpage_analyzer/extractors/html_text'

RSpec.describe WebpageAnalyzer::Extractors::HtmlText do
  describe '.extract_text' do
    subject(:extracted_text) { described_class.extract_text(html_input) }

    context 'with script tags' do
      let(:html_input) { '<script>var a = "Hello";</script>Some text.' }
      it 'removes script tags and their content' do
        expect(extracted_text).to eq('Some text')
      end
    end

    context 'with svg tags' do
      let(:html_input) { '<svg><path d="..."/></svg>Some text.' }
      it 'removes svg tags and their content' do
        expect(extracted_text).to eq('Some text')
      end
    end

    context 'with style tags' do
      let(:html_input) { '<style>body {color: red;}</style>Some text.' }
      it 'removes style tags and their content' do
        expect(extracted_text).to eq('Some text')
      end
    end

    context 'with HTML tags' do
      let(:html_input) { '<p>Some <strong>text</strong>.</p>' }
      it 'removes HTML tags' do
        expect(extracted_text).to eq('Some text')
      end
    end

    context 'with special characters' do
      let(:html_input) { 'Text with !@#$%^&*() special characters.' }
      it 'removes non-alphabetic characters except spaces and apostrophes' do
        expect(extracted_text).to eq('Text with special characters')
      end
    end

    context 'with extra spaces' do
      let(:html_input) { 'Text     with    extra   spaces.' }
      it 'collapses multiple spaces into a single space' do
        expect(extracted_text).to eq('Text with extra spaces')
      end
    end
  end
end
