import Foundation
import Stripe_Types_Shared

extension Stripe.Capital {
  public struct FinancingSummary: Codable, Equatable, Sendable {
    public let object: String
    public let details: Details?
    public let financingOffer: String?
    public let status: String

    public struct Details: Codable, Equatable, Sendable {
      public let advanceAmount: Int
      public let advancePaidOutAt: Date?
      public let currency: Stripe.Currency
      public let currentRepaymentInterval: String?
      public let feeAmount: Int
      public let paidAmount: Int
      public let remainingAmount: Int
      public let repaymentsBeginAt: Date?
      public let withholdRate: Double

      private enum CodingKeys: String, CodingKey {
        case advanceAmount = "advance_amount"
        case advancePaidOutAt = "advance_paid_out_at"
        case currency
        case currentRepaymentInterval = "current_repayment_interval"
        case feeAmount = "fee_amount"
        case paidAmount = "paid_amount"
        case remainingAmount = "remaining_amount"
        case repaymentsBeginAt = "repayments_begin_at"
        case withholdRate = "withhold_rate"
      }
    }

    private enum CodingKeys: String, CodingKey {
      case object
      case details
      case financingOffer = "financing_offer"
      case status
    }
  }
}
