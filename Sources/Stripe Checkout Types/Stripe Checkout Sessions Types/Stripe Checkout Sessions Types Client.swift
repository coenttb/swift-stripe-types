import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.Checkout.Sessions {
  @DependencyClient
  public struct Client: Sendable {
    @DependencyEndpoint
    public var create:
      @Sendable (_ request: Stripe.Checkout.Sessions.Create.Request) async throws ->
        Stripe.Checkout.Session

    @DependencyEndpoint
    public var update:
      @Sendable (
        _ id: Stripe.Checkout.Session.ID, _ request: Stripe.Checkout.Sessions.Update.Request
      ) async throws -> Stripe.Checkout.Session

    @DependencyEndpoint
    public var retrieve:
      @Sendable (_ id: Stripe.Checkout.Session.ID) async throws -> Stripe.Checkout.Session

    @DependencyEndpoint
    public var list:
      @Sendable (_ request: Stripe.Checkout.Sessions.List.Request) async throws ->
        Stripe.Checkout.Sessions.List.Response

    @DependencyEndpoint
    public var expire:
      @Sendable (_ id: Stripe.Checkout.Session.ID) async throws -> Stripe.Checkout.Session

    @DependencyEndpoint
    public var lineItems:
      @Sendable (
        _ id: Stripe.Checkout.Session.ID, _ request: Stripe.Checkout.Sessions.LineItems.Request
      ) async throws -> Stripe.Checkout.Sessions.LineItems.Response
  }
}
