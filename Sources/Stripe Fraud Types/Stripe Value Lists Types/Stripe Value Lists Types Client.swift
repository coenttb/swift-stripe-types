import Dependencies
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.Fraud.ValueLists {
  @DependencyClient
  public struct Client: Sendable {
    // https://docs.stripe.com/api/radar/value_lists/create.md
    @DependencyEndpoint
    public var create: @Sendable (_ request: API.Create.Request) async throws -> ValueList

    // https://docs.stripe.com/api/radar/value_lists/retrieve.md
    @DependencyEndpoint
    public var retrieve: @Sendable (_ id: ValueList.ID) async throws -> ValueList

    // https://docs.stripe.com/api/radar/value_lists/update.md
    @DependencyEndpoint
    public var update:
      @Sendable (_ id: ValueList.ID, _ request: API.Update.Request) async throws -> ValueList

    // https://docs.stripe.com/api/radar/value_lists/list.md
    @DependencyEndpoint
    public var list: @Sendable (_ request: API.List.Request) async throws -> API.List.Response

    // https://docs.stripe.com/api/radar/value_lists/delete.md
    @DependencyEndpoint
    public var delete: @Sendable (_ id: ValueList.ID) async throws -> DeletedObject<ValueList>
  }
}
