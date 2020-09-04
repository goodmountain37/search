class SearchController < ApplicationController
  def index
    @search = params[:search]
    @title_select = params[:model_select]

    if params[:model_select] == "User"
      if params[:search_select] == "完全一致"
        @users = User.where('name LIKE ?', "#{params[:search]}")
      elsif params[:search_select] == "前方一致"
        @users = User.where('name LIKE ?', "#{params[:search]}%")
      elsif params[:search_select] == "後方一致"
        @users = User.where('name LIKE ?', "%#{params[:search]}")
      elsif params[:search_select] == "部分一致"        
        @users = User.where('name LIKE ?', "%#{params[:search]}%")
      else
        @users = User.all
      end
    elsif params[:model_select] == "Book"
      if params[:search_select] == "完全一致"
        @books = Book.where('title LIKE ?', "#{params[:search]}")
      elsif params[:search_select] == "前方一致"
        @books = Book.where('title LIKE ?', "#{params[:search]}%")
      elsif params[:search_select] == "後方一致"
        @books = Book.where('title LIKE ?', "%#{params[:search]}")
      elsif params[:search_select] == "部分一致"        
        @books = Book.where('title LIKE ?', "%#{params[:search]}%")
      else
        @books = Book.all
      end
    end
  end
end
