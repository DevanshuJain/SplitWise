class ExpansesController < ApplicationController
	def index
		@group = Group.find_by_id(params[:group_id])
		@expanse = Expanse.all
	end

	def new
		@group = Group.find_by_id(params[:group_id])
		@expanse = Expanse.new
	end

	def edit
		@group = Group.find_by_id(params[:group_id])
		@expanse = Expanse.find_by_id(params[:id])
	end


	def create
		@group = Group.find_by_id(params[:group_id])
		@expanse = Expanse.new(expanse_params)

		if @expanse.save
		  redirect_to group_expanses_path(params["group_id"])
		else
		  render :new
		end
	end

	def update
		@group = Group.find_by_id(params[:group_id])
		@expanse = Expanse.find_by_id(params[:id])
	
		if @expanse.update(expanse_params)
		  redirect_to group_expanses_path(params["group_id"])
		else
		  render :edit
		end
	end

	def destroy
		@group = Group.find_by_id(params[:group_id])
		@expanse = Expanse.find_by_id(params[:id])
		@expanse.destroy

		redirect_to group_expanses_path(params["group_id"])
	end



	private
		def expanse_params
		params.require(:expanse).permit(:title, :description, :amount)
		end


end
