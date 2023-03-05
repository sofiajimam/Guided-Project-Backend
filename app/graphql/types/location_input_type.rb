# frozen_string_literal: true

module Types
  class LocationInputType < Types::BaseInputObject
    argument :lat, Float
    argument :lng, Float
    argument :state, String, required: false
    argument :country, String, required: false
    argument :city, String, required: false
  end
end
