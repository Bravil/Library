class BooksController < ApplicationController
# the URL:s

# /books
  def index
    @books= Book.all
  end

# /books/:id
  def show
    @book= Book.find(params[:id])
  end

# GET /books:id/edit
  def edit
    @book= Book.find(params[:id])
  end

# GET /books/new
 def new
   @book= Book.new
  end

# POST /books
 def create
   @book= Book.new(params[:book])
   if @book.save
    flash[:notice] = "Book created"
    redirect_to books_path
  else
    render action: :new
  end
 end

  # PUT /books/:id
  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(params[:book])
      flash[:notice] = "Book saved"
      redirect_to book_path(@book)
    else
      render action: :edit
    end
  end

  # DELETE /books/:id
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Book deleted"
    redirect_to books_path
  end



end
