class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def edit
    @group = Group.find_by_id(params[:id])
  end

  def create
    @group = Group.new(article_params)

    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end


  def update
    @group = Group.find(params[:id])

    if @group.update(article_params)
      redirect_to groups_path
    else
      render :edit
    end
  end

  def add_firend_in_group
    @group = Group.find_by_id(params[:groups_id])
    if params[:fname].present?
        user = User.find_by(email: params[:fname])
        if user.present?
          flash[:alert] = "User Added Sucessfully."
          user.groups.create(Group_name: @group.Group_name)
          redirect_to group_expanses_path(@group.id)
        else
          flash[:alert] = "User not found."
          redirect_to group_expanses_path(@group.id)
        end
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    redirect_to groups_path
  end


  private
    def article_params
      params.require(:group).permit(:Group_name)
    end
end
