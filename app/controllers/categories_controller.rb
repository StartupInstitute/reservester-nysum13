class CategoriesController < ApplicationController
  def index
    @categories = Category.text_search(params[:query]).page(params[:page]).per_page(10)
    respond_to do |format|
        format.html
        format.json { render :json => @categories.map(&:attributes) }
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(params[:category])
    if @category.save
      redirect_to @category, notice: 'Category was successfully created.'
    else
      render action: "new"
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
       render action: "index", notice:'Category was successfully updated.'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    render  action: "index", notice:'Category was successfully deleted.'
  end

end
