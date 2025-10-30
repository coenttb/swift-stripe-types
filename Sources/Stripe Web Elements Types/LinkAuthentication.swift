import Foundation
import Stripe_Types_Shared

extension Stripe.WebElements {
  /// Link Authentication Element for Link payment method
  /// See: https://docs.stripe.com/payments/elements/link-authentication-element
  public struct LinkAuthentication: Codable, Hashable, Sendable {
    public let options: Options?

    public init(options: Options? = nil) {
      self.options = options
    }

    public struct Options: Codable, Hashable, Sendable {
      public let defaultValues: DefaultValues?

      public init(defaultValues: DefaultValues? = nil) {
        self.defaultValues = defaultValues
      }
    }
  }
}

extension Stripe.WebElements.LinkAuthentication.Options {
  public struct DefaultValues: Codable, Hashable, Sendable {
    public let email: String?

    public init(email: String? = nil) {
      self.email = email
    }
  }
}
