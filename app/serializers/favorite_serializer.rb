class FavoriteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :neo_reference_id, :user_id
end
