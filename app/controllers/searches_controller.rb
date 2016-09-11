class SearchesController < ApplicationController
	def new
	  @search = Search.new
	end

	def create
	  @search = Search.create!(params[:search])
	  redirect_to @search
	end

	def show
	  @search = Search.where("campus = ?", current_teacher.campus).find(params[:id])
	end
end
