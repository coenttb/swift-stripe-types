import Dependencies
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import Tagged

extension Stripe.Customers.Cards {
    @DependencyClient
    public struct Client: Sendable {
        // https://docs.stripe.com/api/cards/create.md
        @DependencyEndpoint
        public var create:
            @Sendable (_ customerId: Stripe.Customers.Customer.ID, _ request: Create.Request)
                async throws
                -> Card

        // https://docs.stripe.com/api/cards/retrieve.md
        @DependencyEndpoint
        public var retrieve:
            @Sendable (_ customerId: Stripe.Customers.Customer.ID, _ cardId: Card.ID) async throws
                -> Card

        // https://docs.stripe.com/api/cards/update.md
        @DependencyEndpoint
        public var update:
            @Sendable (
                _ customerId: Stripe.Customers.Customer.ID, _ cardId: Card.ID,
                _ request: Update.Request
            ) async throws -> Card

        // https://docs.stripe.com/api/cards/list.md
        @DependencyEndpoint
        public var list:
            @Sendable (_ customerId: Stripe.Customers.Customer.ID, _ request: List.Request)
                async throws
                -> List.Response

        // https://docs.stripe.com/api/cards/delete.md
        @DependencyEndpoint
        public var delete:
            @Sendable (_ customerId: Stripe.Customers.Customer.ID, _ cardId: Card.ID) async throws
                ->
                DeletedObject<Card>
    }
}
