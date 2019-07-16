module Api
  module V1
    module User
      class FavoritesController < ApiBaseController
        def index
          if current_user
            render json: FavoriteSerializer.new(current_user.favorites)
          else
          end
        end
      end
    end
  end
end
