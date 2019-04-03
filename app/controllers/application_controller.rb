require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get "/" do
      erb :super_hero
    end

    post "/teams" do
      @hero_name = []
      @hero_power = []
      @hero_bio = []

      # puts params
      @team_name = params[:team][:name]
      @team_motto = params[:team][:motto]

      puts params

      @team_members = params[:team][:members]
      @team_members.each do |member|
        @hero_name << member[:name]
        @hero_power << member[:power]
        @hero_bio << member[:bio]
      end

      puts @hero_power
      erb :team
    end
end
