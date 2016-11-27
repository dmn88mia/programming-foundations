require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def calculator(num1,num2,operation)
  if num1 == num1.to_f.to_s
    new_num1 = num1.to_f
  else
    new_num1 = num1.to_i
  end

  if num2 == num2.to_f.to_s
    new_num2 = num2.to_f
  else
    new_num2 = num2.to_i
  end

  case operation.downcase
  when "add"
    Kernel.puts(new_num1 + new_num2)
  when "subtract"
    Kernel.puts(new_num1 - new_num2)
  when "multiply"
    Kernel.puts(new_num1 * new_num2)
  when "division"
    Kernel.puts(new_num1 / new_num2)
  else
    Kernel.puts("Please! select the operation: 'add','subtract','multiply' or 'division'.")
      operation = Kernel.gets().chomp()
      calculator(num1,num2,operation)
  end
end

def integer?(num)
  if num.to_f.to_s == num
    num
  elsif num.to_i.to_s == num
    num 
  else
    num = '0'
  end
end

loop do

  Kernel.puts(MESSAGES['select_first_num'])
  num1 = Kernel.gets().chomp()

  loop do
    if integer?(num1) == '0'
      puts(MESSAGES['error'])
      num1 = Kernel.gets().chomp()
    else
      break
    end
  end


  Kernel.puts(MESSAGES['select_second_num'])
  num2 = Kernel.gets().chomp()

  loop do
    if integer?(num2) == '0'
      puts(MESSAGES['error'])
      num2 = Kernel.gets().chomp()
    else
      break
    end
  end

  Kernel.puts(MESSAGES['operation'])
  operation = Kernel.gets.chomp
  calculator(num1,num2,operation)

  Kernel.puts(MESSAGES['more_calculations'])
  answer = Kernel.gets().chomp()

  if answer.upcase == 'Y'
      next
  else
    break
  end

end

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
