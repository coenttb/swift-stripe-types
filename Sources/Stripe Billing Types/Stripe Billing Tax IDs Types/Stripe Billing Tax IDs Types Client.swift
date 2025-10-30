import Dependencies
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.Billing.TaxIDs {
  @DependencyClient
  public struct Client: Sendable {
    // https://docs.stripe.com/api/customer_tax_ids/create
    @DependencyEndpoint
    public var create:
      @Sendable (_ customerId: Stripe.Customers.Customer.ID, _ request: Create.Request) async throws
        -> TaxID

    // https://docs.stripe.com/api/customer_tax_ids/retrieve
    @DependencyEndpoint
    public var retrieve:
      @Sendable (_ customerId: Stripe.Customers.Customer.ID, _ id: TaxID.ID) async throws -> TaxID

    // https://docs.stripe.com/api/customer_tax_ids/delete
    @DependencyEndpoint
    public var delete:
      @Sendable (_ customerId: Stripe.Customers.Customer.ID, _ id: TaxID.ID) async throws ->
        DeletedObject<Stripe.Customers.Customer>

    // https://docs.stripe.com/api/customer_tax_ids/list
    @DependencyEndpoint
    public var list:
      @Sendable (_ customerId: Stripe.Customers.Customer.ID, _ request: List.Request) async throws
        -> List.Response
  }
}
