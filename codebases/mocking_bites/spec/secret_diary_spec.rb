# File spec/secret_diary_spec.rb

require "secret_diary"

RSpec.describe SecretDiary do
  it "initially locks a diary" do
    diary = double(:fake_diary)
    secret_diary = SecretDiary.new(diary)
    # below only depends on @lock in secret_diary, not on the double
    expect{secret_diary.read}.to raise_error("Go away!")
  end
  it "allows reading an unlocked diary" do
    diary = double(:fake_diary)
    # SecretDiary#read calls diary#read
    expect(diary).to receive(:read).and_return("My contents")
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    expect(secret_diary.read).to eq("My contents")
  end
  xit "locks an unlocked diary" do
    diary = Diary.new("My contents")
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    secret_diary.lock
    expect{secret_diary.read}.to raise_error("Go away!")
  end
end
