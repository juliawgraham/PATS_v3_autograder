class VisitsController < ApplicationController
  # A callback to set up an @visit object to work with 
  before_action :set_visit, only: [:show, :edit, :update, :destroy, :dosages]
  before_action :check_login
  authorize_resource

  def index
    # get all visits in reverse chronological order, 10 per page
    if current_user.owner?
      @visits = current_user.owner.visits.chronological.paginate(page: params[:page]).per_page(10)
    else
      @visits_2 = Visit.chronological.last(10)
      @visits = Visit.chronological.paginate(page: params[:page]).per_page(10)
    end
  end

  def pets
    render json: { pets: Pet.active.alphabetical }
  end

  def upsert
    id = params[:id]
    @visit = Visit.find(id)
    @visit.update(visit_params)
    render json: @visit.to_json
  end

  def create_it
    @visit = Visit.new(visit_params)
    @visit.save
    render json: @visit.to_json
  end

  def in_range
    # start_date = params[:start_date]
    # end_date = params[:end_date]
  end
  
  def show
    get_related_data()
  end

  def new
    @visit = Visit.new
  end
  
  def create
    @visit = Visit.new(visit_params)
    if @visit.save
      flash[:notice] = "Successfully added visit for #{@visit.pet.name}."
      redirect_to @visit
    else
      render action: 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @visit.update(visit_params)
      flash[:notice] = "Successfully updated visit by #{@visit.pet.name}."
      redirect_to @visit
    else
      render action: 'edit'
    end
  end
  
  def destroy
    ## We are no longer allowing visits to be destroyed
    # if @visit.destroy
    #   flash[:notice] = "Successfully removed the visit of #{@visit.pet.name} on #{@visit.date.strftime('%b %e')}."
    #   redirect_to visits_url
    # else
    #   get_related_data()
    #   render action: 'show'
    # end
    flash[:notice] = "Visits cannot be destroyed in the PATS system"
    redirect_to @visit
  end

  def dosages
    @dosages = Dosage.for_visit(@visit.id).joins(:medicine).select('dosages.*, medicines.name as medicine_name')
  end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_visit
      @visit = Visit.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def visit_params
      params.require(:visit).permit(:pet_id, :date, :weight)
    end
    def get_related_data
      @pet = @visit.pet
      @owner = @visit.pet.owner
      # get all the dosages & treatments associated with this visit, if any
      # note the difference in the sorting (treatments > dosages in terms of clarity)
      @dosages = dosages()
      @treatments = @visit.treatments.alphabetical.map {|treatment| TreatmentSerializer.new(treatment)}
    end
end
