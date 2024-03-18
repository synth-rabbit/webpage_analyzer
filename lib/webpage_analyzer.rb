# frozen_string_literal: true

$LOAD_PATH.unshift(File.expand_path('../lib', __dir__))

require_relative 'webpage_analyzer/drivers'

module WebpageAnalyzer
  DRIVERS = ['ferrum'].freeze
  autoload :Drivers, 'webpage_analyzer/drivers'
  autoload :Extractors, 'webpage_analyzer/extractors'
  autoload :Insights, 'webpage_analyzer/insights'

  def self.top_words(url, limit, driver_name = 'ferrum')
    driver = get_driver(driver_name)

    return driver_invalid_message(driver_name) unless driver.is_a?(Class)

    content = driver.fetch_page_content(url)
    Insights::TopWords.analyze(content, limit)
  end

  def self.get_driver(driver_name)
    driver = "WebpageAnalyzer::Drivers::#{driver_name.capitalize}Driver"
    Object.const_get(driver)
  end

  def self.driver_invalid_message(driver_name)
    "The driver #{driver_name} is not a valid driver. Available options are #{DRIVERS.join(',')}"
  end
end
