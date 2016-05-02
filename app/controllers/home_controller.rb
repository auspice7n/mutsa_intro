class HomeController < ApplicationController
    def index
    end
    
    def mission
    end
    
    def service
    end
    
    def team
    end
    
    def contact
    end
    def write
        @title =params[:title]
        @content= params[:content]
        @email=params[:email]
        
        mg_client = Mailgun::Client.new("key-7b7522319f4231476099506b1cce6036")

        message_params =  {
                           from: 'seungbin96@unist.ac.kr',
                           to:   @email,
                           subject: @title,
                           text:    @content
                          }
        
        result = mg_client.send_message('sandbox439bcd6b33034e1a98eaaf9ff03e1bff.mailgun.org', message_params).to_h!
        
        message_id = result['id']
        message = result['message']
        
    end
    
end
