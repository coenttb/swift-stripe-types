import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import Dependencies

extension Stripe.Customers.Customer.Sessions {
    @DependencyClient
    public struct Client: Sendable {
        // https://docs.stripe.com/api/customer_sessions/create.md
        @DependencyEndpoint
        public var create: @Sendable (_ request: Stripe.Customers.Customer.Sessions.Create.Request) async throws -> Stripe.Customers.Customer.Session
    }
}
