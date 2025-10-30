//
//  File.swift
//  swift-stripe-types
//
//  Created by Coen ten Thije Boonkkamp on 08/01/2025.
//

import Foundation
import Stripe_Types_Shared

extension Stripe {
  public struct StatementDescriptor: Codable, Hashable, Sendable {
    public let rawValue: String

    public init(_ string: String) throws {
      try StatementDescriptor.validate(string)
      self.rawValue = string
    }

    private static func validate(_ string: String) throws {
      guard !string.isEmpty else {
        throw ValidationError.empty
      }

      guard string.count <= 22 else {
        throw ValidationError.tooLong
      }

      let invalidCharacters = CharacterSet(charactersIn: "<>\'\"*")
      guard string.rangeOfCharacter(from: invalidCharacters) == nil else {
        throw ValidationError.invalidCharacters
      }

      let numbersOnly = CharacterSet.decimalDigits
      let stringCharacters = CharacterSet(charactersIn: string)
      guard !stringCharacters.isSubset(of: numbersOnly) else {
        throw ValidationError.onlyNumbers
      }
    }
  }
}

extension Stripe.StatementDescriptor: RawRepresentable {
  public init?(rawValue: String) {
    try? self.init(rawValue)
  }
}

extension Stripe.StatementDescriptor {
  public init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    let string = try container.decode(String.self)
    try self.init(string)
  }

  public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    try container.encode(self.rawValue)
  }
}

extension Stripe.StatementDescriptor {
  public enum ValidationError: Error {
    case tooLong
    case invalidCharacters
    case onlyNumbers
    case empty

    public var description: String {
      switch self {
      case .tooLong:
        return "Statement descriptor must not exceed 22 characters"
      case .invalidCharacters:
        return "Statement descriptor contains invalid characters"
      case .onlyNumbers:
        return "Statement descriptor must not consist solely of numbers"
      case .empty:
        return "Statement descriptor cannot be empty"
      }
    }
  }
}
// String-like behavior
extension Stripe.StatementDescriptor: CustomStringConvertible {
  public var description: String {
    self.rawValue
  }
}
