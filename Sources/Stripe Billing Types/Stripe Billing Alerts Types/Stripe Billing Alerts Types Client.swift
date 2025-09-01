import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import Dependencies

extension Stripe.Billing.Alerts {
    @DependencyClient
    public struct Client: Sendable {
        // https://docs.stripe.com/api/billing/alert/create.md
        @DependencyEndpoint
        public var create: @Sendable (_ request: Create.Request) async throws -> Alert
        
        // https://docs.stripe.com/api/billing/alert/retrieve.md
        @DependencyEndpoint
        public var retrieve: @Sendable (_ id: Alert.ID) async throws -> Alert
        
        // https://docs.stripe.com/api/billing/alert/list.md
        @DependencyEndpoint
        public var list: @Sendable (_ request: List.Request) async throws -> List.Response
        
        // https://docs.stripe.com/api/billing/alert/activate.md
        @DependencyEndpoint
        public var activate: @Sendable (_ id: Alert.ID) async throws -> Alert
        
        // https://docs.stripe.com/api/billing/alert/archive.md
        @DependencyEndpoint
        public var archive: @Sendable (_ id: Alert.ID) async throws -> Alert
        
        // https://docs.stripe.com/api/billing/alert/deactivate.md
        @DependencyEndpoint
        public var deactivate: @Sendable (_ id: Alert.ID) async throws -> Alert
    }
}
