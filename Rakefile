ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

task :env do 
    require_relative './config/environment'
end 

desc 'Drop into the pry console'
task :console => :env do 
    Pry.start 
end