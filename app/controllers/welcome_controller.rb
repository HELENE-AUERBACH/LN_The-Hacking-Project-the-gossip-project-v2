class WelcomeController < ApplicationController
  def show
    puts "$" * 60
    puts "Voici le prénom que l'utilisateur a saisi dans l'URL :"
    puts params[:first_name]
    puts "$" * 60
  end
end
