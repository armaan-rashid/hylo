import Core
import Utils

/// Creates existential container wrapping the address of a witness.
public struct WrapAddrInstruction: Instruction {

  /// The address wrapped in the existential container.
  public let witness: Operand

  /// The witness table of the wrapped value.
  public let table: Operand

  /// The type of the existential container.
  public let interface: LoweredType

  public let site: SourceRange

  /// Creates an instance with the given properties.
  fileprivate init(witness: Operand, table: Operand, interface: LoweredType, site: SourceRange) {
    self.witness = witness
    self.table = table
    self.interface = interface
    self.site = site
  }

  public var types: [LoweredType] { [interface] }

  public var operands: [Operand] { [witness] }

}

extension WrapAddrInstruction: CustomStringConvertible {

  public var description: String {
    "wrap_addr \(witness), \(table) as \(interface)"
  }

}

extension Module {

  /// Creates a `wrap_addr` anchored at `anchor` that creates an existential container of type
  /// `interface` wrapping `witness` and `table`.
  ///
  /// - Parameters:
  ///   - witness: The address of the object wrapped in the container.
  ///   - interface: The type of the container.
  ///   - table: The witness table of the wrapped value. Must be a pointer to a witness table.
  func makeWrapAddr(
    _ witness: Operand,
    _ table: Operand,
    as interface: ExistentialType,
    anchoredAt anchor: SourceRange
  ) -> WrapAddrInstruction {
    precondition(type(of: witness).isAddress)
    return .init(witness: witness, table: table, interface: .address(interface), site: anchor)
  }

}
