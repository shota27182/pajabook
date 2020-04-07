class BooksController < ApplicationController
  before_action :authenticate_user,{only:[:show,:new,:create,:edit,:update,:destroy,:hello,:bye]}


  def index
    @books=Book.all.order(created_at: :desc)
    @search = Book.search(search_params)
    @search_books = @search.result(distinct: true).order(created_at: 'DESC')

  end

  def details
    @books=Book.where(field: params[:field])
  end

  def show
    @book = Book.find_by(id: params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @field=Field.find_by(name:params[:name])
    @place=params[:place].to_i
    @book = Book.new(
      title: params[:title],
      author: params[:author],
      img:params[:img]
    )
    @book.place=@place
    @book.field=@field.id
    if @book.save
      flash[:notice] = "本を登録しました"
      redirect_to("/")
    else
      render("books/new")
    end
  end

  def edit
    @book = Book.find_by(id: params[:id])
  end

  def update
    @book = Book.find_by(id: params[:id])
    @field=Field.find_by(name:params[:name])
    @place=params[:place].to_i
    @book.place=@place
    @book.field=@field.id
    @book.title = params[:title]
    @book.author = params[:author]
    if @book.save
      flash[:notice] = "本を編集しました"
      redirect_to("/books/#{@book.id}")
    else
      render("books/edit")
    end
  end

  def destroy
    @book = Book.find_by(id: params[:id])
    @book.destroy
    flash[:notice] = "本を削除しました"
    redirect_to("/")
  end

  def hello
    @book=Book.find_by(id:params[:id])
    @book.user_id = @current_user.id
    @book.save
    redirect_to("/users/#{@current_user.id}")
  end

  def bye
    @book=Book.find_by(id:params[:id])
    @book.user_id = nil
    @book.save
    redirect_to("/users/#{@current_user.id}")
  end

  def search
    @search = Book.search(search_params)
    @book = @search.result(distinct: true).order(created_at: 'DESC').page(params[:page]).per(10)
  end

  def search_params
    params.require(:q).permit(:title_cont)
  end
end
