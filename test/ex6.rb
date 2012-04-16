class RPN
  def self.eval_rpn exp
    operations = {}
    %w(+ - * /).each do |operator|
      operations[operator] = ->(a, b){ eval("a #{operator} b") }
    end

    tokens = exp.split /\s+/
    stack = []
    tokens.each do |token|
      unless operations.include?(token)
        stack.push token.to_i
      else
        operands = []
        operation = operations[token]
        operation.arity.times do
          raise "Insufficient operands" if stack.empty?
          operands << stack.pop
        end
        stack.push operation.call *operands
      end
    end

    raise "Unbalanced expression" if stack.size > 1
    stack.pop
  end

  def self.start
    loop do
      print "RPN> "
      exp = gets.chomp
      puts "=> #{self.eval_rpn(exp)}"
    end
  end
end

RPN.start
