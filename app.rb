require "sinatra"
require "sinatra/reloader"

get("/howdy") do 
  erb(:hello)
end

get("/goodbye") do
  erb (:bye)
end

get("/square/new") do
  erb(:new_square_calc)
end

get ("/square/results") do
  @the_num = params.fetch("number").to_f

  @the_result = @the_num ** 2
  
  erb(:square_results)
end

get("/square_root/new") do
  erb(:new_square_root_calc)
end

get ("/square_root/results") do
  @the_num = params.fetch("user_number").to_f

  @the_result = Math.sqrt(@the_num)
  
  erb(:square_root_results)
end

get("/payment/new") do
  erb(:new_payment)
end

get ("/payment/results") do
  @apr = params.fetch("user_apr").to_f
  @years = params.fetch("user_years").to_i
  @principal = params.fetch("user_pv").to_f

  monthly_rate = @apr / 100 / 12
  num_payments = @years * 12

  if monthly_rate == 0
    @payment = @principal / num_payments
  else
    numerator = monthly_rate * @principal
    denominator = 1 - (1 + monthly_rate) ** -num_payments
    @payment = numerator / denominator
  end
  
  erb(:payment_results)
end

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end
