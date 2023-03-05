# frozen_string_literal: true

module Types
  class AuthorType < Types::BaseObject
    field :id, ID, null: false

    field :email, String, null: false
    field :name, String, null: false
    def name
      case object.class.name
      when "Admin"
        object.name
      else
        "Gova Multiservicios"
      end
    end

    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
