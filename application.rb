#!/usr/bin/env ruby

require 'sinatra'
require 'haml'
require 'sass'
require 'zen-grids'

class SinatraZen < Sinatra::Base
  configure do
    Compass.add_project_configuration(File.join(File.dirname(__FILE__),  
                                                'config', 

                                                'compass.config'))    
    set :scss, Compass.sass_engine_options
  end

  get '/css/:filename.css' do                                                    
    scss :"sass/#{params[:filename]}"                                            
  end 

  get '/' do
    haml :index 
  end
end
