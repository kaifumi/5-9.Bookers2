class BooksController < ApplicationController

    def index
        @books=Book.all
        @book=Book.new
    end
    def create
        book=Book.new(book_params)
        book.user_id=current_user.id
        if book.save
					flash[:notice]="successfully 投稿できました"
					redirect_to books_path
				else
					flash.now[:alert] = 'error 投稿失敗です'
					@books=Book.all
					@book=Book.new
					render :index
				end
    end
    def show
        @book=Book.find(params[:id])
    end
    def destroy
        @book=Book.find(params[:id])
        @book.destroy
        redirect_to books_path
    end
    def edit
        @book=Book.find(params[:id])
        if @book.user_id==current_user.id
            render :edit
        else
            redirect_to books_path
        end
    end
    def update
        @book=Book.find(params[:id])
				if @book.update(book_params)
					flash[:notice]="successfully 更新できました"
					redirect_to book_path(@book)
        else
          flash.now[:alert] = 'error 更新失敗です'
					render :edit
				end
    end
    def top
    end
    def about
    end
    private
    def book_params
        params.require(:book).permit(:title,:body)
    end
end
