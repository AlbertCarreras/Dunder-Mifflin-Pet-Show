class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def show
    @employee = find_employee
  end

  def edit
    @employee = find_employee
    @all_dogs = Dog.all
  end

  def update
    @employee = find_employee
    if @employee.update(employee_params)
      redirect_to @employee
    else
      error_flash
      @all_dogs = Dog.all
      render :edit
    end
  end

  def new
    @employee = Employee.new
    @all_dogs = Dog.all
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.valid?
      @employee.save
      redirect_to @employee
    else
      error_flash
      @all_dogs = Dog.all
      render :new
    end
  end

  def destroy
    find_employee.destroy
    redirect_to employees_path
  end

private
def find_employee
  Employee.find(params[:id])
end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :title, :alias, :office, :img_url, :dog_id, :dog_attributes => [:name, :breed, :age])
  end

  def error_flash
    flash[:notice]="Your employee could not be updated:"
  end

end
