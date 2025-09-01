import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import Dependencies

extension Stripe.PaymentMethods.Sources {
    @DependencyClient
    public struct Client: Sendable {
        // https://docs.stripe.com/api/sources/create.md
        @DependencyEndpoint
        public var create: @Sendable (_ request: Create.Request) async throws -> Source
        
        // https://docs.stripe.com/api/sources/retrieve.md
        @DependencyEndpoint
        public var retrieve: @Sendable (_ id: Source.ID) async throws -> Source
        
        // https://docs.stripe.com/api/sources/update.md
        @DependencyEndpoint
        public var update: @Sendable (_ id: Source.ID, _ request: Update.Request) async throws -> Source
        
        // https://docs.stripe.com/api/sources/attach.md
        @DependencyEndpoint
        public var attach: @Sendable (_ customerId: Stripe.Customers.Customer.ID, _ source: Source.ID) async throws -> Source
        
        // https://docs.stripe.com/api/sources/detach.md
        @DependencyEndpoint
        public var detach: @Sendable (_ customerId: Stripe.Customers.Customer.ID, _ sourceId: Source.ID) async throws -> Source
    }
}
