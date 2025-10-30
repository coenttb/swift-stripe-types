//
//  Stripe Payouts Types Client.swift
//  swift-stripe-types
//
//  Created by Coen ten Thije Boonkkamp on 13/01/2025.
//

import Dependencies
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.Payouts {
  @DependencyClient
  public struct Client: Sendable {
    // https://docs.stripe.com/api/payouts/create.md
    @DependencyEndpoint
    public var create:
      @Sendable (_ request: Stripe.Payouts.Create.Request) async throws -> Stripe.Payouts.Payout

    // https://docs.stripe.com/api/payouts/retrieve.md
    @DependencyEndpoint
    public var retrieve:
      @Sendable (_ id: Stripe.Payouts.Payout.ID) async throws -> Stripe.Payouts.Payout

    // https://docs.stripe.com/api/payouts/update.md
    @DependencyEndpoint
    public var update:
      @Sendable (_ id: Stripe.Payouts.Payout.ID, _ request: Stripe.Payouts.Update.Request)
        async throws -> Stripe.Payouts.Payout

    // https://docs.stripe.com/api/payouts/list.md
    @DependencyEndpoint
    public var list:
      @Sendable (_ request: Stripe.Payouts.List.Request) async throws ->
        Stripe.Payouts.List.Response

    // https://docs.stripe.com/api/payouts/cancel.md
    @DependencyEndpoint
    public var cancel:
      @Sendable (_ id: Stripe.Payouts.Payout.ID) async throws -> Stripe.Payouts.Payout

    // https://docs.stripe.com/api/payouts/reverse.md
    @DependencyEndpoint
    public var reverse:
      @Sendable (_ id: Stripe.Payouts.Payout.ID, _ request: Stripe.Payouts.Reverse.Request)
        async throws -> Stripe.Payouts.Payout
  }
}
