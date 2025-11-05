import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.PaymentLinks {
    @DependencyClient
    public struct Client: Sendable {
        // https://docs.stripe.com/api/payment-link/create.md
        @DependencyEndpoint
        public var create:
            @Sendable (_ request: Stripe.PaymentLinks.Create.Request) async throws ->
                Stripe.PaymentLink

        // https://docs.stripe.com/api/payment-link/update.md
        @DependencyEndpoint
        public var update:
            @Sendable (_ id: Stripe.PaymentLink.ID, _ request: Stripe.PaymentLinks.Update.Request)
                async throws -> Stripe.PaymentLink

        // https://docs.stripe.com/api/payment-link/retrieve.md
        @DependencyEndpoint
        public var retrieve:
            @Sendable (_ id: Stripe.PaymentLink.ID) async throws -> Stripe.PaymentLink

        // https://docs.stripe.com/api/payment-link/list.md
        @DependencyEndpoint
        public var list:
            @Sendable (_ request: Stripe.PaymentLinks.List.Request) async throws ->
                Stripe.PaymentLinks.List.Response

        // https://docs.stripe.com/api/payment-link/retrieve-line-items.md
        @DependencyEndpoint
        public var lineItems:
            @Sendable (
                _ id: Stripe.PaymentLink.ID, _ request: Stripe.PaymentLinks.LineItems.Request
            )
                async throws -> Stripe.PaymentLinks.LineItems.Response
    }
}
