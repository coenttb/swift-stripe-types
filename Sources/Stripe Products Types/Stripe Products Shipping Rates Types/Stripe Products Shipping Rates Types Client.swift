import Dependencies
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import Tagged

extension Stripe.Products.ShippingRates {
  @DependencyClient
  public struct Client: Sendable {
    // https://docs.stripe.com/api/shipping_rates/create.md
    @DependencyEndpoint
    public var create:
      @Sendable (_ request: Create.Request) async throws -> Stripe.Products.Shipping.Rate

    // https://docs.stripe.com/api/shipping_rates/retrieve.md
    @DependencyEndpoint
    public var retrieve:
      @Sendable (_ id: Stripe.Products.Shipping.Rate.ID) async throws ->
        Stripe.Products.Shipping.Rate

    // https://docs.stripe.com/api/shipping_rates/update.md
    @DependencyEndpoint
    public var update:
      @Sendable (_ id: Stripe.Products.Shipping.Rate.ID, _ request: Update.Request) async throws ->
        Stripe.Products.Shipping.Rate

    // https://docs.stripe.com/api/shipping_rates/list.md
    @DependencyEndpoint
    public var list: @Sendable (_ request: List.Request) async throws -> List.Response
  }
}
