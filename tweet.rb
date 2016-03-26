require 'rubygems'
require 'twitter'
require "date"
class Tweet
  def initialize

    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['CONSUMER_KEY']
      config.consumer_secret     = ENV['CONSUMER_SECRET']
      config.access_token        = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    end

  end
  def test
    tweet = "テストです。すぐに消します。"
    update(tweet)
  end
  def daily_tweet
      todate = Date.today
      @today = Character.where("date = ?",todate.strftime("%m%d"))
      @today.each do |chara| 
          tweet = "今日は#{chara.name}の誕生日です。\n ##{chara.name}生誕祭 ##{chara.name}生誕祭#{todate.year} ##{todate.month}月#{todate.day}日は#{chara.name}の誕生日"
          update(tweet)
      end
  end
  private
  def update(tweet)
    return nil unless tweet
    begin
      @client.update(tweet.chomp)
    rescue => ex
      nil # todo
    end
  end
end