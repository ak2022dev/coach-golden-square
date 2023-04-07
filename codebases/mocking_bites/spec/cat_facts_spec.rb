require 'cat_facts'

RSpec.describe CatFacts do
  it "provides a cat fact" do
    # Create a double with which to inject dependency into initialiser
    fake_getter = double :getter
    # Create fake value for getter to return, using curl
    fake_getter_text = '{"fact":"Female cats are polyestrous","length":28}'
    # Model #get method using fake values
    expect(fake_getter).to receive(:get).with(URI("https://catfact.ninja/fact")).and_return(fake_getter_text)
    cat_facts = CatFacts.new(fake_getter)
    expect(cat_facts.provide()).to eq("Cat fact: Female cats are polyestrous")
  end
end
