# frozen_string_literal: true

RSpec.describe MdBlockConverter do
  it "has a version number" do
    expect(MdBlockConverter::VERSION).not_to be nil
  end

  it "converts markdown blocks" do
    text = <<~TEXT
      <span class="line"><span class="cl"><span class="c"># Comment</span><span class="err">
      </span></span></span><span class="line"><span class="cl"><span class="err"></span>INSTRUCTION arguments</span></span>
    TEXT
    block = MdBlockConverter::Block.new(text.lines.map(&:chomp), 4, 'ruby')
    block.convert!
    puts block.to_s
  end
end
