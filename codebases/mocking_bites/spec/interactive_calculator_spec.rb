require 'interactive_calculator'

RSpec.describe InteractiveCalculator do
  it "subtracts two numbers" do
    fake_terminal = double :kernel 
    calc = InteractiveCalculator.new(fake_terminal)
    expect(fake_terminal).to receive(:puts).with("Hello. I will subtract two numbers").and_return(nil).ordered
    expect(fake_terminal).to receive(:puts).with("Please enter a number").and_return(nil).ordered
    expect(fake_terminal).to receive(:gets).and_return("4\n").ordered
    expect(fake_terminal).to receive(:puts).with("Please enter another number").and_return(nil).ordered
    expect(fake_terminal).to receive(:gets).and_return("3\n").ordered
    expect(fake_terminal).to receive(:puts).with("Here is your result:").and_return(nil).ordered
    expect(fake_terminal).to receive(:puts).with("4 - 3 = 1").and_return(nil).ordered
    calc.run()
  end
end
