class Questions
  attr_accessor :answer, :prompt, :value1, :value2
  def initialize
    @value1 = 1+rand(20)
    @value2 = 1+rand(20)
    @answer = value1 + value2
    @prompt = "What does #{@value1} plus #{@value2} equal?"
  end
end