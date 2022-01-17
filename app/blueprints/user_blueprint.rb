class UserBlueprint < Blueprinter::Base
  identifier :id

  fields :full_name, :email, :super_admin

  field :created_at do |user|
    user.created_at.to_datetime
  end

  field :token do |user, options|
    options[:token]
  end
end
