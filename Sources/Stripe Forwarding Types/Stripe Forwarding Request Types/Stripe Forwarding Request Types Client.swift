import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import Dependencies

extension Stripe.Forwarding.Request {
    @DependencyClient
    public struct Client: Sendable {
        // https://docs.stripe.com/api/forwarding/request/create.md
        @DependencyEndpoint
        public var create: @Sendable (_ request: Create.Request) async throws -> Stripe.Forwarding.Request
        
        // https://docs.stripe.com/api/forwarding/request/retrieve.md
        @DependencyEndpoint
        public var retrieve: @Sendable (_ id: Stripe.Forwarding.Request.ID) async throws -> Stripe.Forwarding.Request
        
        // https://docs.stripe.com/api/forwarding/request/list.md
        @DependencyEndpoint
        public var list: @Sendable (_ request: Stripe.Forwarding.Request.List.Request) async throws -> Stripe.Forwarding.Request.List.Response
    }
}
