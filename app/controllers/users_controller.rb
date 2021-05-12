class UsersController < ApplicationController
  def index
    @users = User.all
    puts "$" * 60
    puts "Voici le nombre d'utilisateurs dans la base : #{@users.length}"
    puts "$" * 60
  end

  def show
    @user_hash = get_user_hash
  end

  private

  def get_user_hash
    @user_hash = { "user" => nil, "index" => -1 }
    user_id = params[:id].to_i
    user = nil
    puts "$" * 60
    puts "user_id : #{user_id}"
    if user_id.between?(1, User.count)
      user = User.find(user_id)
      puts "user : #{user}"
    end
    @user_hash = { "user" => user, "index" => user_id }
    puts "user_hash : #{@user_hash}"
    puts "$" * 60
    @user_hash 
  end
end
