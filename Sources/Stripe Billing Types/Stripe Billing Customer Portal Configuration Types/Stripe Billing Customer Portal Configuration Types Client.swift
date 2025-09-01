import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import Dependencies

extension Stripe.Billing.Customer.Portal.Configuration {
    @DependencyClient
    public struct Client: Sendable {
        // https://docs.stripe.com/api/customer_portal/configurations/create.md
        @DependencyEndpoint
        public var create: @Sendable (_ request: Stripe.Billing.Customer.Portal.Configuration.Create.Request) async throws -> Stripe.Billing.Customer.Portal.Configuration
        
        // https://docs.stripe.com/api/customer_portal/configurations/retrieve.md
        @DependencyEndpoint
        public var retrieve: @Sendable (_ id: Stripe.Billing.Customer.Portal.Configuration.ID) async throws -> Stripe.Billing.Customer.Portal.Configuration
        
        // https://docs.stripe.com/api/customer_portal/configurations/update.md
        @DependencyEndpoint
        public var update: @Sendable (_ id: Stripe.Billing.Customer.Portal.Configuration.ID, _ request: Update.Request) async throws -> Stripe.Billing.Customer.Portal.Configuration
        
        // https://docs.stripe.com/api/customer_portal/configurations/list.md
        @DependencyEndpoint
        public var list: @Sendable (_ request: Stripe.Billing.Customer.Portal.Configuration.List.Request) async throws -> List.Response
    }
}
