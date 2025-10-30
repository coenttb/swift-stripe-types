import Dependencies
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import Tagged

extension Stripe.Customers.CashBalance {
  @DependencyClient
  public struct Client: Sendable {
    // https://docs.stripe.com/api/cash_balance/retrieve.md
    @DependencyEndpoint
    public var retrieve:
      @Sendable (_ customerId: Stripe.Customers.Customer.ID) async throws ->
        Stripe_Types_Models.CashBalance

    // https://docs.stripe.com/api/cash_balance/update.md
    @DependencyEndpoint
    public var update:
      @Sendable (_ customerId: Stripe.Customers.Customer.ID, _ request: Update.Request) async throws
        -> Stripe_Types_Models.CashBalance
  }
}
