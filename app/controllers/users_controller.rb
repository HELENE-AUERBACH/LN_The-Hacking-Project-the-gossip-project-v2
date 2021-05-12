class UsersController < ApplicationController
  def index
    @users = User.all
    puts "$" * 60
    puts "Voici le nombre d'utilisateurs dans la base : #{@users.length}"
    puts "$" * 60
  end

  def show
    @user_hash = { "user" => nil, "index" => -1 }
    user_id = params[:id].to_i
    puts "$" * 60
    puts "user_id : #{user_id}"
    if (user_id != -1)
      user = User.find(user_id)
      puts "user : #{user}"
      @user_hash = { "user" => user, "index" => user_id }
      puts "user_hash : #{@user_hash}"
    end
    puts "$" * 60
  end
end
