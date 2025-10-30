import Dependencies
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.Fraud.Reviews {
  @DependencyClient
  public struct Client: Sendable {
    // https://docs.stripe.com/api/radar/reviews/retrieve.md
    @DependencyEndpoint
    public var retrieve: @Sendable (_ id: Review.ID) async throws -> Review

    // https://docs.stripe.com/api/radar/reviews/list.md
    @DependencyEndpoint
    public var list: @Sendable (_ request: API.List.Request) async throws -> API.List.Response

    // https://docs.stripe.com/api/radar/reviews/approve.md
    @DependencyEndpoint
    public var approve:
      @Sendable (_ id: Review.ID, _ request: API.Approve.Request) async throws -> Review
  }
}
