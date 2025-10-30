import Dependencies
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.Billing.Customer.Balance {
  @DependencyClient
  public struct Client: Sendable {
    // https://docs.stripe.com/api/customer_balance_transactions/create.md
    @DependencyEndpoint
    public var create:
      @Sendable (_ customerId: Stripe.Customers.Customer.ID, _ request: Create.Request) async throws
        -> Transaction

    // https://docs.stripe.com/api/customer_balance_transactions/retrieve.md
    @DependencyEndpoint
    public var retrieve:
      @Sendable (_ customerId: Stripe.Customers.Customer.ID, _ id: Transaction.ID) async throws ->
        Transaction

    // https://docs.stripe.com/api/customer_balance_transactions/update.md
    @DependencyEndpoint
    public var update:
      @Sendable (
        _ customerId: Stripe.Customers.Customer.ID, _ id: Transaction.ID, _ request: Update.Request
      ) async throws -> Transaction

    // https://docs.stripe.com/api/customer_balance_transactions/list.md
    @DependencyEndpoint
    public var list:
      @Sendable (_ customerId: Stripe.Customers.Customer.ID, _ request: List.Request) async throws
        -> Transaction.List
  }
}
