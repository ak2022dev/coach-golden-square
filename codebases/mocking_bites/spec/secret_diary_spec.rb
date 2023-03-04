# File spec/secret_diary_spec.rb

require "diary"
require "secret_diary"

RSpec.describe SecretDiary do
  it "initially locks a diary" do
    diary = Diary.new("My contents")
    secret_diary = SecretDiary.new(diary)
    expect{secret_diary.read}.to raise_error("Go away!")
  end
  it "allow reading an unlocked diary" do
    diary = Diary.new("My contents")
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    expect(secret_diary.read).to eq("My contents")
  end
end
