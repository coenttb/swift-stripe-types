import Dependencies
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.Capital {
  @DependencyClient
  public struct Client: Sendable {
    public var financingOffer: Stripe.Capital.FinancingOffer.Client = .init()
    public var financingSummary: Stripe.Capital.FinancingSummary.Client = .init()
  }
}
