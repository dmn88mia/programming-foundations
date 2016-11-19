def calculator(num1,num2,operation)
  num1 = num1.to_i
  num2 = num2.to_i

  case operation.downcase
  when "add"
    Kernel.puts(num1 + num2)
  when "subtract"
    Kernel.puts(num1 - num2)
  when "multiply"
    Kernel.puts(num1 * num2)
  when "division"
    Kernel.puts(num1.to_f / num2.to_f)
  else
    Kernel.puts("Please! select the operation: 'add','subtract','multiply' or 'division'.")
      operation = Kernel.gets().chomp()
      calculator(num1,num2,operation)
  end
end

Kernel.puts("Please a number:")
num1 = Kernel.gets().chomp()
Kernel.puts("Please select another number:")
num2 = Kernel.gets().chomp()
Kernel.puts("Please select the operation: 'add','subtract','multiply' or 'division'.")
operation = Kernel.gets.chomp
calculator(num1,num2,operation)

# def calculator(num1,num2,operation)
#   @num1 = num1.to_i
#   @num2 = num2.to_i

#   case operation.downcase
#   when "add"
#     Kernel.puts(@num1 + num2)
#   when "subtract"
#     Kernel.puts(@num1 - num2)
#   when "multiply"
#     Kernel.puts(@num1 * num2)
#   when "division"
#     Kernel.puts(@num1 / num2)
#   else
#      while operation != "add" || operation != "subtract" || operation != "multiply" || operation != "division"
#       Kernel.puts("Please! select the operation: 'add','subtract','multiply' or 'division'.")
#        operation = Kernel.gets().chomp()
#        calculator(@num1,@num2,operation)
#      end
#   end
# end
