class InteractiveCalculator
  def initialize(terminal)
    @terminal = terminal
  end
  def run
    @terminal.puts("Hello. I will subtract two numbers")
    @terminal.puts("Please enter a number")
    num1 = @terminal.gets()
    num1 = num1.chomp.to_i
    @terminal.puts("Please enter another number")
    num2 = @terminal.gets()
    num2 = num2.chomp.to_i
    @terminal.puts("Here is your result:")
    @terminal.puts("#{num1} - #{num2} = #{num1-num2}")
  end
end
