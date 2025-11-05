import Dependencies
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.Billing.Credit.Balance {
    @DependencyClient
    public struct Client: Sendable {
        // https://docs.stripe.com/api/billing/credit-balance-transaction/retrieve.md
        @DependencyEndpoint
        public var retrieve: @Sendable (_ id: Transaction.ID) async throws -> Transaction

        // https://docs.stripe.com/api/billing/credit-balance-transaction/list.md
        @DependencyEndpoint
        public var list: @Sendable (_ request: List.Request) async throws -> Transaction.List
    }
}
