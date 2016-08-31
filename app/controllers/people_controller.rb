class PeopleController < ApplicationController
  # GET /people
  def index
    @people = Person.all
    if params[:q]
      @people = @people.where("name like ?", "%#{params[:q]}%")
    end
  end

  # GET /people/1
  def show
    @person = Person.find(params[:id])
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
    @person = Person.find(params[:id])
  end

  # POST /people
  def create
    @person = Person.new(person_params)

    if @person.save
      redirect_to @person, notice: 'Person was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /people/1
  def update
    @person = Person.find(params[:id])
    if @person.update(person_params)
      redirect_to @person, notice: 'Person was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /people/1
  def destroy
    @person = Person.find(params[:id])
    @person.destroy
    redirect_to people_url, notice: 'Person was successfully destroyed.'
  end

  private
    # Only allow a trusted parameter "white list" through.
    def person_params
      params.require(:person).permit(:name, :city, :state)
    end
end
