class PeopleController < ApplicationController
  before_action :person, only: [:show, :edit, :update, :destroy]
  
  def show
  end

  def index
    @people = Person.all
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      flash[:notice] = "Person was successfully created."
      redirect_to @person
    else
      flash[:alert] = "Please check your data."
      render :new
    end
  end

  def edit
  end

  def update
    if @person.update(person_params)
      flash[:notice] = "Person was successfully updated."
      redirect_to @person
    else
      flash[:alert] = "Please check your data."
      render :edit
    end
  end

  def destroy
    @person.destroy
    flash[:notice] = 'Person was successfully destroyed.'
    redirect_to people_url
  end

  private

  def person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:first_name, :last_name, :email, :job, :bio, :gender, :birthdate, :picture)
  end
end
