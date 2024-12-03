require 'nokogiri'

module MdBlockConverter
  class Block
    attr_accessor :lang, :lines, :indent

    def initialize(lines, indent, lang)
      @lines = lines.map(&:lstrip)
      @indent = indent
      @lang = lang
    end

    def convert!
      html = Nokogiri::HTML.fragment(@lines.join("\n"))
      text = html.text
      @lines = text.lines.map(&:chomp)
      self
    end

    def to_s
      ["```#{@lang}", *@lines, "```"].map { |line| "#{' ' * @indent}#{line}" }.join("\n")
    end
  end
end