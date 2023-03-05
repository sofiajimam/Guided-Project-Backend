# frozen_string_literal: true

module Types
  class LocationType < Types::BaseObject
    field :id, ID, null: false

    field :lat, Float, null: false
    field :lng, Float, null: false

    field :state, String
    field :country, String
    field :city, String

    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
