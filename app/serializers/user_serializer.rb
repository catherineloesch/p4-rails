class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :created_at, :username, :password, :display_name, :address, :description, :age
end
