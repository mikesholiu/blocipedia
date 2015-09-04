class WikisController < ApplicationController

  def index
    @wikis = Wiki.visible_to(current_user).paginate(page: params[:page], per_page: 20)
    
  end

  def private_wikis
    #if current_user.role != "admin"
     # @wikis = Wiki.visible_private(current_user).paginate(page: params[:page], per_page: 20)
    #else
  if current_user.present?
    if current_user.role == "admin"
      @wikis = Wiki.visible_private_global(current_user).paginate(page: params[:page], per_page: 20)
    elsif current_user.role == "premium"
      @wikis = Wiki.visible_private(current_user).paginate(page: params[:page], per_page: 20)
    else
      private_wikis_path
    end
  else
    private_wikis_path
  end

  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new(params.require(:wiki).permit(:title, :body, :private, :user_ids => []))
    @wiki.creator = current_user.id
    @wiki.users << current_user
    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to @wiki
    else
      flash[:error] = "There was an error saving the wiki. Please try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:id])
    @collaborators = User.where(:id => params[:collaborators])
    @wiki.users = @collaborators 
    if @wiki.creator? && !@wiki.users.include?(User.find(@wiki.creator))
      @wiki.users << User.find(@wiki.creator)
    end
    if @wiki.update_attributes(params.require(:wiki).permit(:title, :body, :private))
      flash[:notice] = "Wiki was updated."
      redirect_to @wiki
    else
      flash[:error] = "There was an error saving the wiki. Please try again."
      render :edit
    end
   end

  def destroy
    @wiki = Wiki.find(params[:id])
    if @wiki.delete
      flash[:notice] = "Wiki #{@wiki.title} was deleted."
      redirect_to :back
    else
      flash[:error] = "There was an error deleting the wiki. Please try again."
      redirect_to @wiki
    end
  end

end
