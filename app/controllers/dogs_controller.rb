class DogsController < ApplicationController
  def index
    @dogs = Dog.all
  end

  def show
    @dog = find_dog
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    if @dog.valid?
      @dog.save
      redirect_to @dog
    else
      error_flash
      render :new
    end
  end

  def destroy
    find_dog.destroy
    redirect_to dogs_path
  end

  private

  def find_dog
    Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:name, :breed, :age)
  end

  def error_flash
    flash[:notice]="Your employee could not be updated:"
  end


end
