import Dependencies
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import Tagged

extension Stripe.Connect.Transfers {
    @DependencyClient
    public struct Client: Sendable {
        // https://docs.stripe.com/api/transfers/create.md
        @DependencyEndpoint
        public var create:
            @Sendable (_ request: Create.Request) async throws -> Stripe.Connect.Transfer

        // https://docs.stripe.com/api/transfers/retrieve.md
        @DependencyEndpoint
        public var retrieve:
            @Sendable (_ id: Stripe.Connect.Transfer.ID) async throws -> Stripe.Connect.Transfer

        // https://docs.stripe.com/api/transfers/update.md
        @DependencyEndpoint
        public var update:
            @Sendable (_ id: Stripe.Connect.Transfer.ID, _ request: Update.Request) async throws ->
                Stripe.Connect.Transfer

        // https://docs.stripe.com/api/transfers/list.md
        @DependencyEndpoint
        public var list: @Sendable (_ request: List.Request) async throws -> List.Response
    }
}
