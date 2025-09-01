import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import Dependencies

extension Stripe.Billing.CreditBalanceSummary {
    @DependencyClient
    public struct Client: Sendable {
        // https://docs.stripe.com/api/billing/credit-balance-summary/retrieve.md
        @DependencyEndpoint
        public var retrieve: @Sendable (_ request: Retrieve.Request) async throws -> Stripe.Billing.Credit.Balance.Summary
    }
}
