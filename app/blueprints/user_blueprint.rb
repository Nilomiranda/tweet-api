class UserBlueprint < Blueprinter::Base
  identifier :id

  fields :id, :name, :email
end