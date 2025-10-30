//
//  File.swift
//  coenttb-stripe
//
//  Created by Coen ten Thije Boonkkamp on 04/01/2025.
//

import Foundation
import Stripe_Types_Shared

extension Setup {
  /// Represents an error encountered during a SetupIntent confirmation
  public struct Error: Codable, Hashable, Sendable {
    /// How to proceed with an error for card issuer declines
    public let adviceCode: String?

    /// Error code for programmatically handleable errors
    public let code: String?

    /// Card issuer's reason for decline
    public let declineCode: String?

    /// URL to error code documentation
    public let docUrl: String?

    /// Human-readable error message
    public let message: String?

    /// Network advice code for card issuer declines (2 digits)
    public let networkAdviceCode: String?

    /// Network decline code for card issuer declines (2-4 digits)
    public let networkDeclineCode: String?

    /// Parameter associated with the error
    public let param: String?

    /// Payment method that encountered the error
    public let paymentMethod: Stripe.PaymentMethods.PaymentMethod?

    /// Type of payment method that had an issue
    public let paymentMethodType: String?

    /// The type of error returned
    public let type: String

    enum CodingKeys: String, CodingKey {
      case adviceCode = "advice_code"
      case code
      case declineCode = "decline_code"
      case docUrl = "doc_url"
      case message
      case networkAdviceCode = "network_advice_code"
      case networkDeclineCode = "network_decline_code"
      case param
      case paymentMethod = "payment_method"
      case paymentMethodType = "payment_method_type"
      case type
    }
  }
}

extension Stripe.Setup.Attempt {
  /// Represents the error type returned by the Stripe API
  public enum `Type`: String, Codable, Hashable, Sendable {
    case apiError = "api_error"
    case cardError = "card_error"
    case idempotencyError = "idempotency_error"
    case invalidRequestError = "invalid_request_error"
  }
}
