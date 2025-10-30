import Dependencies
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.Billing.Customer.Portal.Session {
  @DependencyClient
  public struct Client: Sendable {
    // https://docs.stripe.com/api/customer_portal/sessions/create.md
    @DependencyEndpoint
    public var create:
      @Sendable (_ request: Create.Request) async throws -> Stripe.Billing.Customer.Portal.Session

  }
}
