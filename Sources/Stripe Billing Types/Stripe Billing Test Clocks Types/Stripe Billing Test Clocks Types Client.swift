//
//  Stripe Billing Test Clocks Types Client.swift
//  swift-stripe-types
//
//  Created by Coen ten Thije Boonkkamp on 13/01/2025.
//

import Dependencies
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.Billing.TestClocks {
  @DependencyClient
  public struct Client: Sendable {
    // https://docs.stripe.com/api/test_clocks/create.md
    @DependencyEndpoint
    public var create:
      @Sendable (_ request: Stripe.Billing.TestClocks.Create.Request) async throws -> TestClock

    // https://docs.stripe.com/api/test_clocks/retrieve.md
    @DependencyEndpoint
    public var retrieve:
      @Sendable (_ id: Stripe.Billing.TestClocks.TestClock.ID) async throws -> TestClock

    // https://docs.stripe.com/api/test_clocks/list.md
    @DependencyEndpoint
    public var list:
      @Sendable (_ request: Stripe.Billing.TestClocks.List.Request) async throws -> List.Response

    // https://docs.stripe.com/api/test_clocks/delete.md
    @DependencyEndpoint
    public var delete:
      @Sendable (_ id: Stripe.Billing.TestClocks.TestClock.ID) async throws -> TestClock

    // https://docs.stripe.com/api/test_clocks/advance.md
    @DependencyEndpoint
    public var advance:
      @Sendable (
        _ id: Stripe.Billing.TestClocks.TestClock.ID,
        _ request: Stripe.Billing.TestClocks.Advance.Request
      ) async throws -> TestClock
  }
}
