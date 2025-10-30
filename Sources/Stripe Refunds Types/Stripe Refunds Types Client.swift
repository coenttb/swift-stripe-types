//
//  Stripe Refunds Types Client.swift
//  swift-stripe-types
//
//  Created by Coen ten Thije Boonkkamp on 13/01/2025.
//

import Dependencies
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.Refunds {
  @DependencyClient
  public struct Client: Sendable {
    // https://docs.stripe.com/api/refunds/create.md
    @DependencyEndpoint
    public var create:
      @Sendable (_ request: Stripe.Refunds.Create.Request) async throws -> Stripe.Refunds.Refund

    // https://docs.stripe.com/api/refunds/retrieve.md
    @DependencyEndpoint
    public var retrieve:
      @Sendable (_ id: Stripe.Refunds.Refund.ID) async throws -> Stripe.Refunds.Refund

    // https://docs.stripe.com/api/refunds/update.md
    @DependencyEndpoint
    public var update:
      @Sendable (_ id: Stripe.Refunds.Refund.ID, _ request: Stripe.Refunds.Update.Request)
        async throws -> Stripe.Refunds.Refund

    // https://docs.stripe.com/api/refunds/list.md
    @DependencyEndpoint
    public var list:
      @Sendable (_ request: Stripe.Refunds.List.Request) async throws ->
        Stripe.Refunds.List.Response

    // https://docs.stripe.com/api/refunds/cancel.md
    @DependencyEndpoint
    public var cancel:
      @Sendable (_ id: Stripe.Refunds.Refund.ID) async throws -> Stripe.Refunds.Refund
  }
}
