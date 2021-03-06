class PeopleController < ApplicationController

  def index
    @people = Person.all
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      redirect_to root_path, notice: "Person was created!"
    else
      @new_edit_error = "You must enter a First name and Last name OR Title and Last name to be created!"
      render :new
    end
  end

  def show
    @person = Person.find(params[:id])
  end

  def edit
  @person = Person.find(params[:id])
  end


  def update
    @person = Person.find(params[:id])
    if @person.update(person_params)
      redirect_to people_path, notice: 'Person was updated!'
    else
      @new_edit_error = "You must enter a First name and Last name OR Title and Last name to be updated!"
      render :edit
    end
  end

private
def person_params
params.require(:person).permit(:title, :first_name, :last_name)
end



end
