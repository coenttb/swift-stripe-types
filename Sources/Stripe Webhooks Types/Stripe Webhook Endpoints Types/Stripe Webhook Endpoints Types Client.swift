import Dependencies
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.WebhookEndpoint {
    @DependencyClient
    public struct Client: Sendable {
        // https://docs.stripe.com/api/webhook_endpoints/create.md
        @DependencyEndpoint
        public var create:
            @Sendable (_ request: Stripe.WebhookEndpoint.Create.Request) async throws -> Webhook

        // https://docs.stripe.com/api/webhook_endpoints/retrieve.md
        @DependencyEndpoint
        public var retrieve: @Sendable (_ id: Stripe.WebhookEndpoint.ID) async throws -> Webhook

        // https://docs.stripe.com/api/webhook_endpoints/update.md
        @DependencyEndpoint
        public var update:
            @Sendable (
                _ id: Stripe.WebhookEndpoint.ID, _ request: Stripe.WebhookEndpoint.Update.Request
            )
                async throws -> Webhook

        // https://docs.stripe.com/api/webhook_endpoints/list.md
        @DependencyEndpoint
        public var list:
            @Sendable (_ request: Stripe.WebhookEndpoint.List.Request) async throws -> List.Response

        // https://docs.stripe.com/api/webhook_endpoints/delete.md
        @DependencyEndpoint
        public var delete:
            @Sendable (_ id: Stripe.WebhookEndpoint.ID) async throws -> DeletedObject<
                Stripe.WebhookEndpoint
            >
    }
}
