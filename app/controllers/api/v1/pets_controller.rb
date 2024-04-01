module Api::V1
  class PetsController < ApiController
    def index
      @pets = Pet.active.alphabetical.all
      render json: PetSerializer.new(@pets).serialized_json
    end
  end
end