json.extract! owner, :id, :first_name, :last_name, :street, :city, :state, :zip, :phone, :email, :active, :role, :username, :password, :password_confirmation, :created_at, :updated_at
json.url owner_url(owner, format: :json)
