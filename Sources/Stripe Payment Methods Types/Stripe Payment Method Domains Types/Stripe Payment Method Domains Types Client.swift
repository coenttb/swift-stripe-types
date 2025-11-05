import Dependencies
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import Tagged

extension Stripe.PaymentMethodDomains {
    @DependencyClient
    public struct Client: Sendable {
        // https://docs.stripe.com/api/payment_method_domains/create.md
        @DependencyEndpoint
        public var create:
            @Sendable (_ request: Create.Request) async throws -> Stripe.PaymentMethodDomain

        // https://docs.stripe.com/api/payment_method_domains/retrieve.md
        @DependencyEndpoint
        public var retrieve:
            @Sendable (_ id: Stripe.PaymentMethodDomain.ID) async throws ->
                Stripe.PaymentMethodDomain

        // https://docs.stripe.com/api/payment_method_domains/update.md
        @DependencyEndpoint
        public var update:
            @Sendable (_ id: Stripe.PaymentMethodDomain.ID, _ request: Update.Request) async throws
                ->
                Stripe.PaymentMethodDomain

        // https://docs.stripe.com/api/payment_method_domains/list.md
        @DependencyEndpoint
        public var list: @Sendable (_ request: List.Request) async throws -> List.Response

        // https://docs.stripe.com/api/payment_method_domains/validate.md
        @DependencyEndpoint
        public var validate:
            @Sendable (_ id: Stripe.PaymentMethodDomain.ID) async throws ->
                Stripe.PaymentMethodDomain
    }
}

extension Stripe.PaymentMethodDomains.Client {
    public func list() async throws -> Stripe.PaymentMethodDomains.List.Response {
        try await self.list(.init())
    }
}
