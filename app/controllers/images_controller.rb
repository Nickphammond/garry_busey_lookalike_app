
class ImagesController < ApplicationController

    

    private

    # Only allow a list of trusted parameters through.
    def images_params
      params.require(:event).permit(images_look_a_likes_attributes: [:look_a_like_accepted])
    end

end