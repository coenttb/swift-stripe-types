import Dependencies
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.PaymentMethods.PaymentMethods {
  @DependencyClient
  public struct Client: Sendable {
    // https://docs.stripe.com/api/payment_methods/create.md
    @DependencyEndpoint
    public var create:
      @Sendable (_ request: Stripe.PaymentMethods.PaymentMethods.Create.Request) async throws ->
        Stripe.PaymentMethods.PaymentMethod

    // https://docs.stripe.com/api/payment_methods/retrieve.md
    @DependencyEndpoint
    public var retrieve:
      @Sendable (_ id: Stripe.PaymentMethods.PaymentMethod.ID) async throws ->
        Stripe.PaymentMethods.PaymentMethod

    // https://docs.stripe.com/api/payment_methods/retrieve_customer.md
    @DependencyEndpoint
    public var retrieveCustomer:
      @Sendable (
        _ customerId: Stripe.Customers.Customer.ID,
        _ paymentMethodId: Stripe.PaymentMethods.PaymentMethod.ID
      ) async throws -> Stripe.PaymentMethods.PaymentMethod

    // https://docs.stripe.com/api/payment_methods/update.md
    @DependencyEndpoint
    public var update:
      @Sendable (
        _ id: Stripe.PaymentMethods.PaymentMethod.ID,
        _ request: Stripe.PaymentMethods.PaymentMethods.Update.Request
      ) async throws -> Stripe.PaymentMethods.PaymentMethod

    // https://docs.stripe.com/api/payment_methods/list.md
    @DependencyEndpoint
    public var list: @Sendable (_ request: List.Request) async throws -> List.Response

    // https://docs.stripe.com/api/payment_methods/customer_list.md
    @DependencyEndpoint
    public var listCustomer:
      @Sendable (
        _ customerId: Stripe.Customers.Customer.ID,
        _ request: Stripe.PaymentMethods.PaymentMethods.List.Customer.Request
      ) async throws -> List.Customer.Response

    // https://docs.stripe.com/api/payment_methods/attach.md
    @DependencyEndpoint
    public var attach:
      @Sendable (
        _ id: Stripe.PaymentMethods.PaymentMethod.ID,
        _ request: Stripe.PaymentMethods.PaymentMethods.Attach.Request
      ) async throws -> Stripe.PaymentMethods.PaymentMethod

    // https://docs.stripe.com/api/payment_methods/detach.md
    @DependencyEndpoint
    public var detach:
      @Sendable (_ id: Stripe.PaymentMethods.PaymentMethod.ID) async throws ->
        Stripe.PaymentMethods.PaymentMethod
  }
}
