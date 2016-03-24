require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'open-uri'
require 'sinatra/json'
require './models/character.rb'
require 'csv'

use Rack::Session::Cookie

before '/*' do
    # タグ
    @tags = Tag.order('id desc').all
    
    
    
end

get '/' do
    
    # 今日の日付
    day = Date.today

    pastweek = day + 7
    day = day.strftime("%m%d")
    
    pastweek=pastweek.strftime("%m%d")
    @contents = Character.order('good desc').all.limit(50)
    @within_a_week= Character.where("? < date AND date < ?",day,pastweek).order('date asc')
    
    @today = Character.where("date = ?",day).order('date asc')
    erb :index
end

post '/good/:id' do
    @content = Character.find(params[:id])
    good = @content.good
    @content.update({
        good: good + 1
    })
    redirect '/'
end

get '/search' do
    @contents = Charatag.where("name = ? AND date = ? AND tag= ?",params[:name],params[:date],params[:tag])
    @search_conditions = ({
        name: params[:name],
        date: params[:date],
        tag: params[:tag]
    })
    
    erb :search
end

get '/character/:id' do
    @content = Character.find(params[:id])
    erb :character
end

get '/new' do
    @operation = "new"
    erb :new
end

post '/edit' do
    @operation = "edit"
    erb :edit
end

post '/confirm' do
    session[:name] = params[:chara_name]
    session[:date] = params[:date]
    
    session[:operation] = params[:operation]
    redirect '/confirm'
end

get '/confirm' do
    @name = session[:name]
    @date = session[:date]
    @operation = session[:operation]
    erb :confirm
end

post '/exec' do
    case session[:operation]
    when 'new' then
        Character.create({
            name: session[:name],
            date: session[:date]
        })
        redirect '/thanks'
    
    when "edit" then
        @content = Character.find(params[:id])
        @content.update({
            name: session[:name],
            date: session[:date]
        })
        redirect '/thanks'
        
    else
        "Error!!"
        
        
        
    end  
end     


get '/thanks' do
    erb :thanks
end

post '/delete/:id' do
    Character.find(params[:id]).destroy
    redirect '/'
end

post '/edit/:id' do
    @content = Character.find(params[:id])
    erb :edit
end

post '/renew/:id' do
    @content = Character.find(params[:id])
    @content.update({
        name: params[:user_name],
        body: params[:body]
    })
    redirect '/'
end

post '/renew/:id' do
    @content = Character.find(params[:id])
    @content.update({
        name: params[:user_name],
        body: params[:body]
    })
    redirect '/'
end