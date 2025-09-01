import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import Dependencies

extension Stripe.Billing.Credit.Grant {
    @DependencyClient
    public struct Client: Sendable {
        // https://docs.stripe.com/api/billing/credit-grant/create.md
        @DependencyEndpoint
        public var create: @Sendable (_ request: Create.Request) async throws -> Stripe.Billing.Credit.Grant
        
        // https://docs.stripe.com/api/billing/credit-grant/retrieve.md
        @DependencyEndpoint
        public var retrieve: @Sendable (_ id: ID) async throws -> Stripe.Billing.Credit.Grant
        
        // https://docs.stripe.com/api/billing/credit-grant/update.md
        @DependencyEndpoint
        public var update: @Sendable (_ id: ID, _ request: Update.Request) async throws -> Stripe.Billing.Credit.Grant
        
        // https://docs.stripe.com/api/billing/credit-grant/list.md
        @DependencyEndpoint
        public var list: @Sendable (_ request: List.Request) async throws -> List.Response
        
        // https://docs.stripe.com/api/billing/credit-grant/expire.md
        @DependencyEndpoint
        public var expire: @Sendable (_ id: ID, _ request: Expire.Request) async throws -> Stripe.Billing.Credit.Grant
        
        // https://docs.stripe.com/api/billing/credit-grant/void.md
        @DependencyEndpoint
        public var void: @Sendable (_ id: ID, _ request: Void.Request) async throws -> Stripe.Billing.Credit.Grant
    }
}
