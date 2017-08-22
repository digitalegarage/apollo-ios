public protocol GraphQLOperation: class {
  static var operationDefinition: String { get }
  static var queryDocument: String { get }
  static var rootKey: String { get }
  
  var variables: GraphQLMap? { get }
  
  associatedtype Data: GraphQLMappable
}

public extension GraphQLOperation {
  static var queryDocument: String {
    return operationDefinition
  }
  
  var variables: GraphQLMap? {
    return nil
  }
}

public protocol GraphQLQuery: GraphQLOperation {}

extension GraphQLQuery {
  static var rootKey: String {
    return "QUERY_ROOT"
  }
}

public protocol GraphQLMutation: GraphQLOperation {}

extension GraphQLMutation {
  static var rootKey: String {
    return "MUTATION_ROOT"
  }
}
