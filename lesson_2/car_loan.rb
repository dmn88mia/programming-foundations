def monthly_payment(loan_amount,monthly_rate,loan_in_months)
  loan_amount.to_i * (monthly_rate / (1 - (1 + monthly_rate)**(-loan_in_months)))
end

Kernel.puts("What is your loan amount?")
loan_amount = Kernel.gets().chomp()

Kernel.puts("What is your APR? Please input a number")
apr = Kernel.gets().chomp()
monthly_rate = apr.to_f / 100 / 12

Kernel.puts("How long is the duration of this loan in years please:")
loan_in_years = Kernel.gets().chomp()
loan_in_months = loan_in_years.to_i * 12
Kernel.puts("You have #{loan_in_months} montths to pay it off.")

# Kernel.puts("Your monthly payment is #{monthly_payment(loan_amount,monthly_rate,loan_in_months)}")

puts monthly_payment(loan_amount,monthly_rate,loan_in_months)



