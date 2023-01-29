import Core

/// A C++ `continue` statement
struct CXXContinueStmt: CXXStmt {

  /// The original node in Val AST.
  /// This node can be of any type.
  let original: AnyNodeID.TypedNode?

}
