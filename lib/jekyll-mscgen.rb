require 'liquid'
require "jekyll-mscgen/version"
require "jekyll-mscgen/generator"

module Jekyll
  module MscgenBlock < Liquid::Block
    def initialize(tag_name, text, tokens)
      super
      @brush = Pseudo::HtmlBrush.new
      @grammar = Pseudo::Grammar.new
    end

    def render(context)
      @text = @nodelist.join('')
      @formatted = @grammar.format(@text, @brush)
      "<div class='pseudo'>#{@formatted}</div>"
    end
  end
end


Liquid::Template.register_tag('msgen', Jekyll::MscgenBlock)