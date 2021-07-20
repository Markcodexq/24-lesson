#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	@error = "something wrong!"
	erb :about
end

get '/contacts' do
	erb :contacts
end

get '/visit' do
	erb :visit
	
end

post '/visit' do
	@user = params[:user_name]
	@phone = params[:user_phone]
	@date = params[:date_time]
	@choise = params[:choise]
	@color = params[:color]

	if @user == ""
		@error = "Write a user name"
	elsif @phone == ""
		@error = "Write a phone number"
	elsif @date == ""
		@error = "Write the data"
	end

	if @error != ""
		return erb :visit
	end
	@message = "Dear #{@user}, you will add to our system, phone is - #{@phone}, date - #{@date}, master - #{@choise}, color - #{@color}"

	f = File.open './public/users.txt', 'a'
	f.write "User: #{@user}, Phone: #{@phone}, Date: #{@date}, Master: #{@choise}, Color: #{@color}\n"
	f.close
	erb :visit
end