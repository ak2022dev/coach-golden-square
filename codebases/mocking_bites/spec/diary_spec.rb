# File: spec/diary_spec.rb

require "diary"

RSpec.describe Diary do
  it "Remembers contents" do
    diary = Diary.new("These are my contents")
    expect(diary.read).to eq("These are my contents")
  end
end
