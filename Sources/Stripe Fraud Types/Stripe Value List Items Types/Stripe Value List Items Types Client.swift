import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import Dependencies

extension Stripe.Fraud.ValueListItems {
    @DependencyClient
    public struct Client: Sendable {
        // https://docs.stripe.com/api/radar/value_list_items/create.md
        @DependencyEndpoint
        public var create: @Sendable (_ request: API.Create.Request) async throws -> ValueListItem
        
        // https://docs.stripe.com/api/radar/value_list_items/retrieve.md
        @DependencyEndpoint
        public var retrieve: @Sendable (_ id: ValueListItem.ID) async throws -> ValueListItem
        
        // https://docs.stripe.com/api/radar/value_list_items/list.md
        @DependencyEndpoint
        public var list: @Sendable (_ request: API.List.Request) async throws -> API.List.Response
        
        // https://docs.stripe.com/api/radar/value_list_items/delete.md
        @DependencyEndpoint
        public var delete: @Sendable (_ id: ValueListItem.ID) async throws -> DeletedObject<ValueListItem>
    }
}
