import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.PaymentMethods {
  public struct Client: Sendable {
    public var paymentMethods: Stripe.PaymentMethods.PaymentMethods.Client
    public var paymentMethodConfigurations: Stripe.PaymentMethodConfigurations.Client
    public var paymentMethodDomains: Stripe.PaymentMethodDomains.Client
    public var sources: Stripe.PaymentMethods.Sources.Client

    public init(
      paymentMethods: Stripe.PaymentMethods.PaymentMethods.Client,
      paymentMethodConfigurations: Stripe.PaymentMethodConfigurations.Client,
      paymentMethodDomains: Stripe.PaymentMethodDomains.Client,
      sources: Stripe.PaymentMethods.Sources.Client
    ) {
      self.paymentMethods = paymentMethods
      self.paymentMethodConfigurations = paymentMethodConfigurations
      self.paymentMethodDomains = paymentMethodDomains
      self.sources = sources
    }
  }
}

extension Stripe.PaymentMethods.Client {
  public func create(
    _ request: Stripe.PaymentMethods.PaymentMethods.Create.Request
  ) async throws -> Stripe.PaymentMethods.PaymentMethod {
    try await self.paymentMethods.create(request)
  }
  public func retrieve(
    _ id: Stripe.PaymentMethods.PaymentMethod.ID
  ) async throws -> Stripe.PaymentMethods.PaymentMethod {
    try await self.paymentMethods.retrieve(id)
  }
  public func update(
    _ id: Stripe.PaymentMethods.PaymentMethod.ID,
    _ request: Stripe.PaymentMethods.PaymentMethods.Update.Request
  ) async throws -> Stripe.PaymentMethods.PaymentMethod {
    try await self.paymentMethods.update(id, request)
  }
  public func list(
    _ request: Stripe.PaymentMethods.PaymentMethods.List.Request
  ) async throws -> Stripe.PaymentMethods.PaymentMethods.List.Response {
    try await self.paymentMethods.list(request)
  }
  public func attach(
    _ id: Stripe.PaymentMethods.PaymentMethod.ID,
    _ request: Stripe.PaymentMethods.PaymentMethods.Attach.Request
  ) async throws -> Stripe.PaymentMethods.PaymentMethod {
    try await self.paymentMethods.attach(id, request)
  }
  public func detach(
    _ id: Stripe.PaymentMethods.PaymentMethod.ID
  ) async throws -> Stripe.PaymentMethods.PaymentMethod {
    try await self.paymentMethods.detach(id)
  }
}
