#!/usr/bin/ruby
require 'github/markup'
require 'html/pipeline'
#require 'html/pipeline/wiki_link'
require 'html/pipeline/rouge_filter'

load 'lib/acklex.rb'

stylesheet="page-style.css"
if ARGV[0]
	stylesheet = ARGV[0]
end

context = {
  :base_url   => "./index.htm?page="
}

pipeline = HTML::Pipeline.new [
#  HTML::Pipeline::MarkdownFilter,
#  HTML::Pipeline::WikiLinkFilter,
	HTML::Pipeline::RougeFilter
], context

result = STDIN.read

result = GitHub::Markup.render('input.md', result)

result = pipeline.call result

code = result[:output].to_s

puts <<HTML
<!doctype html!>
<html>
<head>
<link rel="stylesheet" type="text/css" href="#{stylesheet}">
</head>
<body>
HTML

puts code

puts <<HTML
</body>
</html>
HTML
