# Webpage Analyzer

Webpage Analyzer is a program that allows you to gain insights
by visiting urls.

## Installation

Webpage Analyzer requires that you have the [Chrome Web Browser](https://support.google.com/chrome/answer/95346?hl=en&co=GENIE.Platform%3DDesktop)
installed on your system. After installing run the following command from the project root.

```bash
bundle install
```

In order to run the command line program on Mac or Linux it might require you to run. Currently the program is untested
on Windows.

```bash
chmod +x bin/analyze_webpage
```

## Usage

### Commands

#### top_words

By default checks the top 25 words on a webpage

**Options**
- `--limit`: Sets the upper limit of top words on a page

**Example**
```bash
bin/analyze_webpage top_words https://en.wikipedia.org/wiki/Giant_panda --limit 10
```

## Assumptions

The following assumptions were made in creating this program:
- The URLs visited would be of content-type text/html
- The content for counting words would not include script, style, or html tags
- Filler words e.g. "the", "of", "and", etc. would be included in the word count
- Words would be counted irregardless of capitalization

## What I Like
- I like the modularity of the implementation.  It allows for the core library to be expanded upon with additional functionality for Insights (ex. Assess words by importance through html tags) and Extractors (ex. JSON)
- I like that the command line program can be expanded upon due to modularity
- I like that alternative methods for web scraping can be implemented by keeping the drivers modularized
- I like using autoload so that only the classes in use are loaded which should help with performance
- I like that using a gem like Ferrum, the program should be able to handle pages with dynamic content

## What I Would Add
- Handle URLs that receive JSON data
- Verify robots.txt on URLs to scrape responsibly
- Add additional insight options
- Add additional drivers like Selenium or static only parsing
- Add the ability to toggle parsing words within the tags that are removed such as style or script tags.
- Support languages outside of English
- Support not counting articles, conjuctions, and other filler words
- Build out the library as a Gem
- Implement a plugin system

## What I Would Change
- Figure out a better method for managing Drivers

## License

MIT License

Copyright (c) 2024 Joshua Edwards

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.