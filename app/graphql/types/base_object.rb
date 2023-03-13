module Types
  class BaseObject < GraphQL::Schema::Object
    edge_type_class(Types::BaseEdge)
    connection_type_class(Types::BaseConnection)
    field_class Types::BaseField

    def unauthorized_field
      raise GraphQL::ExecutionError.new "You are not authorized to query this field"
    end
  end
end
