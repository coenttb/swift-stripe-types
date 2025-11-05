import Dependencies
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.Terminal.Locations {
    @DependencyClient
    public struct Client: Sendable {
        // https://docs.stripe.com/api/terminal/locations/create.md
        @DependencyEndpoint
        public var create: @Sendable (_ request: Create.Request) async throws -> Location

        // https://docs.stripe.com/api/terminal/locations/retrieve.md
        @DependencyEndpoint
        public var retrieve: @Sendable (_ id: Location.ID) async throws -> Location

        // https://docs.stripe.com/api/terminal/locations/update.md
        @DependencyEndpoint
        public var update:
            @Sendable (_ id: Location.ID, _ request: Update.Request) async throws -> Location

        // https://docs.stripe.com/api/terminal/locations/list.md
        @DependencyEndpoint
        public var list: @Sendable (_ request: List.Request) async throws -> List.Response

        // https://docs.stripe.com/api/terminal/locations/delete.md
        @DependencyEndpoint
        public var delete: @Sendable (_ id: Location.ID) async throws -> DeletedObject<Location>
    }
}
