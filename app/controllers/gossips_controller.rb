class GossipsController < ApplicationController
  ANONYMOUS_USER_ID = 1.freeze # Ruby Freeze method basically make object constant or immutable

  def index
    # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
    @gossips = Gossip.all
    puts "$" * 60
    puts "Voici le nombre de potins dans la base : #{@gossips.length}"
    puts "$" * 60
  end

  def show
    # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
    @gossip_hash = { "gossip" => nil, "index" => -1 }
    gossip_id = params[:id].to_i
    puts "$" * 60
    puts "gossip_id : #{gossip_id}"
    if (gossip_id != -1)
      gossip = Gossip.find(gossip_id)
      @gossip_hash = { "gossip" => gossip, "index" => gossip_id }
      puts "gossip_hash : #{@gossip_hash}"
    end
    puts "$" * 60
  end

  def new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
    @new_gossip = Gossip.new
  end

  def create
    # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
    puts "$" * 60
    puts "Salut, je suis dans le serveur"
    puts "Ceci est le contenu du hash params : #{params}"
    puts "Trop bien ! Et ceci est ce que l'utilisateur a passé dans le champ title : #{params["title"]}"
    puts "De la bombe, et du coup ça, ça doit être ce que l'utilisateur a passé dans le champ content : #{params["content"]}"
    @gossip = Gossip.new("title" => params[:title],
                         "content" => params[:content],
                         "author" => User.find(ANONYMOUS_USER_ID))
    if @gossip.save # essaie de sauvegarder en base @gossip
      # si ça marche, il redirige vers la page d'index du site
      #redirect_to action: :index
      redirect_to gossips_path(@gossip), notice: 'Ton super potin a bien été créé en base pour la postérité !'
    else
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      render 'new'
    end
    puts "$" * 60
  end

  def edit
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
    @gossip_hash = { "gossip" => nil, "index" => -1 }
    gossip_id = params[:id].to_i
    puts "$" * 60
    puts "gossip_id : #{gossip_id}"
    if (gossip_id != -1)
      gossip = Gossip.find(gossip_id)
      @gossip_hash = { "gossip" => gossip, "index" => gossip_id }
      puts "gossip_hash : #{@gossip_hash}"
    end
    puts "$" * 60
  end

  def update
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
    puts "$" * 60
    puts "Salut, je suis dans le serveur"
    puts "Ceci est le contenu du hash params : #{params}"
    puts "Trop bien ! Et ceci est ce que l'utilisateur a passé dans le champ title : #{params["title"]}"
    puts "De la bombe, et du coup ça, ça doit être ce que l'utilisateur a passé dans le champ content : #{params["content"]}"
    @gossip = Gossip.update("title" => params[:title],
                            "content" => params[:content],
                            "author" => User.find(ANONYMOUS_USER_ID))
    if @gossip.save # essaie de sauvegarder en base @gossip
      # si ça marche, il redirige vers la méthode show (pour afficher le potin modifié)
      redirect_to gossips_path(@gossip), notice: 'Ton super potin a bien été mis à jour en base : il est bien plus "dévastateur" désormais !'
    else
      # sinon, il render la view edit (qui est celle sur laquelle on est déjà)
      render 'edit'
    end
    puts "$" * 60
  end

  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
    puts "$" * 60
    puts "Salut, je suis dans le serveur"
    puts "Ceci est le contenu du hash params : #{params}"
    puts "gossip_id : #{params[:id]}"
    @gossip.find_by(id: params[:id])
    if @gossip.nil?
      @gossip.destroy
      redirect_to action: :index, notice: 'Ton "sale petit" potin a bien été supprimé en base : plus personne ne saura que tu as un jour osé le proférer !'
    end
    puts "$" * 60
  end
end
