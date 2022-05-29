
class SessionsController < ApplicationController
    def login
      puts "LOGGING IN..."
      user = User.find_by(username: params[:username])
      if user.authenticate(params[:password])
        # lkog them in
        session[:user_id] = user.id
        render json: user, status: :ok
      else
        render json: { errors: "Not Authorized" }, status: 401
      end
    end
  
    def logout
      puts "LOGGING OUT..."
      if session[:user_id]
        session.destroy
        head :no_content
      else
        render_unauthorized
      end
    end
  end



# class SessionsController < ApplicationController

#     def login
#         # this is what is sending our user information to the front end 
#         user = User.find_by(username: params[:username])
#         if user.authenticate(params[:password])
#             #log them in
#             session[:user_id] = user.id
#             render json: user, status: :ok
#         else 
#             render json: { error: "not authorized"}, status: 401
#         end 
#     end 

#     def logout
#         puts 'logging out'
#         if session[:user_id]
#             session.destroy
#             head :no_content
#         else 
#             render_unauthorized
#         end 
#     end 
# end
