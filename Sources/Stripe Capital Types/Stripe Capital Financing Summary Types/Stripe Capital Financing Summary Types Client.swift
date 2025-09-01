import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import Dependencies

extension Stripe.Capital.FinancingSummary {
    @DependencyClient
    public struct Client: Sendable {
        // https://docs.stripe.com/api/capital/financing_summary/retrieve.md
        @DependencyEndpoint
        public var retrieve: @Sendable () async throws -> Stripe.Capital.FinancingSummary
    }
}