class FavoriteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :neo_reference_id, :user_id

  attribute :asteroid do |object|
    {
      'name': object.name,
      'is_potentially_hazardous_asteroid': object.is_potentially_hazardous_asteroid
    }
  end
end
