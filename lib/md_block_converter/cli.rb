require_relative "markdown"

module MdBlockConverter
  module CLI
    def self.start!
      text = ARGF.read
      markdown = MdBlockConverter::Markdown.new(text)
      puts markdown.to_s
    end
  end
end