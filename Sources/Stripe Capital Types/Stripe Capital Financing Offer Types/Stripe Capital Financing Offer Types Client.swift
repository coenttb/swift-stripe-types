import Dependencies
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.Capital.FinancingOffer {
  @DependencyClient
  public struct Client: Sendable {
    // https://docs.stripe.com/api/capital/financing_offers/retrieve.md
    @DependencyEndpoint
    public var retrieve:
      @Sendable (_ id: Stripe.Capital.FinancingOffer.ID) async throws ->
        Stripe.Capital.FinancingOffer

    // https://docs.stripe.com/api/capital/financing_offers/list.md
    @DependencyEndpoint
    public var list: @Sendable (_ request: List.Request) async throws -> List.Response

    // https://docs.stripe.com/api/capital/financing_offers/mark_delivered.md
    @DependencyEndpoint
    public var markDelivered:
      @Sendable (_ id: Stripe.Capital.FinancingOffer.ID) async throws ->
        Stripe.Capital.FinancingOffer
  }
}
