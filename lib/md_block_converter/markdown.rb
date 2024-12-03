require_relative 'block'

module MdBlockConverter
  class Markdown
    attr_accessor :elements

    def initialize(text)
      iter_context = {
        in_block: false,
        block_lines: [],
        block_indent: nil,
        block_lang: nil,
        elements: []
      }
      @elements = text.lines.map(&:chomp).each_with_object(iter_context) do |line|
        if line.match?(/^\s*```\s*$/)
          if iter_context[:in_block]
            iter_context[:in_block] = false
            iter_context[:elements] << Block.new(iter_context[:block_lines], iter_context[:block_indent], iter_context[:block_lang]).convert!
            iter_context[:block_lines] = []
            iter_context[:block_indent] = nil
            iter_context[:block_lang] = nil
          else
            iter_context[:in_block] = true
            iter_context[:block_lines] = []
            iter_context[:block_indent] = line.match(/^\s*/)[0].length
            iter_context[:block_lang] = line.match(/```\s*(\S*)/)[1]
          end
        else
          if iter_context[:in_block]
            iter_context[:block_lines] << line
          else
            iter_context[:elements] << line
          end
        end
      end[:elements]
    end

    def to_s
      @elements.map(&:to_s).join("\n")
    end
  end
end