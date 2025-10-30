import Dependencies
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.Connect.AccountLinks {
  @DependencyClient
  public struct Client: Sendable {
    // https://docs.stripe.com/api/account_links/create.md
    @DependencyEndpoint
    public var create:
      @Sendable (_ request: Stripe.Connect.AccountLinks.Create.Request) async throws ->
        Stripe.Connect.Account.Link
  }
}
