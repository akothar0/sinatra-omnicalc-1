require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)
end

get("/square/new") do
  erb(:square)
end

get("/square/result") do
  @user_number = params.fetch("user_number").to_f
  erb(:square_result)
end

get("/square_root/new") do
  erb(:square_root)
end

get("/square_root/result") do
  @user_number = params.fetch("number_input").to_f
  erb(:square_root_result)
end

get("/random/new") do
  erb(:random)
end

get("/random/results") do
  @user_min = params.fetch("user_min").to_f
  @user_max = params.fetch("user_max").to_f
  @random_num = rand(@user_min..@user_max)
  erb(:random_results)
end

get("/payment/new") do
  erb(:payment)
end

get("/payment/results") do
  @user_apr = params.fetch("user_apr").to_f
  @user_years = params.fetch("user_years").to_i
  @user_pv = params.fetch("user_pv").to_f

  # Monthly rate
  r = @user_apr / 100.0 / 12.0

  # Convert term in years to the total number of monthly payments.
  n = @user_years * 12
  @numerator = r * @user_pv
  @denom = 1-(1+r)**(-n)

  @user_payments = @numerator/@denom
  erb(:payment_results)
end
