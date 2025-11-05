import Dependencies
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.Fraud.EarlyFraudWarnings {
    @DependencyClient
    public struct Client: Sendable {
        // https://docs.stripe.com/api/radar/early_fraud_warnings/retrieve.md
        @DependencyEndpoint
        public var retrieve:
            @Sendable (_ id: EarlyFraudWarning.ID) async throws -> EarlyFraudWarning

        // https://docs.stripe.com/api/radar/early_fraud_warnings/list.md
        @DependencyEndpoint
        public var list: @Sendable (_ request: API.List.Request) async throws -> API.List.Response
    }
}
