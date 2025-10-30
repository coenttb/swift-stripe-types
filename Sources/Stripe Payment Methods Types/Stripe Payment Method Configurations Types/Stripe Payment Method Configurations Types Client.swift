//
//  Stripe Payment Method Configurations Types Client.swift
//  swift-stripe-types
//
//  Created for swift-stripe-types on 14/01/2025.
//

import Dependencies
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import Tagged

extension Stripe.PaymentMethodConfigurations {
  @DependencyClient
  public struct Client: Sendable {
    // https://docs.stripe.com/api/payment_method_configurations/create.md
    @DependencyEndpoint
    public var create:
      @Sendable (_ request: Create.Request) async throws ->
        Stripe.PaymentMethodConfigurations.Configuration

    // https://docs.stripe.com/api/payment_method_configurations/retrieve.md
    @DependencyEndpoint
    public var retrieve:
      @Sendable (_ id: Stripe.PaymentMethodConfigurations.Configuration.ID) async throws ->
        Stripe.PaymentMethodConfigurations.Configuration

    // https://docs.stripe.com/api/payment_method_configurations/update.md
    @DependencyEndpoint
    public var update:
      @Sendable (
        _ id: Stripe.PaymentMethodConfigurations.Configuration.ID, _ request: Update.Request
      ) async throws -> Stripe.PaymentMethodConfigurations.Configuration

    // https://docs.stripe.com/api/payment_method_configurations/list.md
    @DependencyEndpoint
    public var list: @Sendable (_ request: List.Request) async throws -> List.Response
  }
}
