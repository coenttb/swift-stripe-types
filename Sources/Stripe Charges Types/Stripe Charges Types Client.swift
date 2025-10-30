//
//  Stripe Charges Types Client.swift
//  swift-stripe-types
//
//  Created by Coen ten Thije Boonkkamp on 13/01/2025.
//

import Dependencies
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.Charges {
  @DependencyClient
  public struct Client: Sendable {
    // https://docs.stripe.com/api/charges/create.md
    @DependencyEndpoint
    public var create:
      @Sendable (_ request: Stripe.Charges.Create.Request) async throws -> Stripe.Charges.Charge

    // https://docs.stripe.com/api/charges/retrieve.md
    @DependencyEndpoint
    public var retrieve:
      @Sendable (_ id: Stripe.Charges.Charge.ID) async throws -> Stripe.Charges.Charge

    // https://docs.stripe.com/api/charges/update.md
    @DependencyEndpoint
    public var update:
      @Sendable (_ id: Stripe.Charges.Charge.ID, _ request: Stripe.Charges.Update.Request)
        async throws -> Stripe.Charges.Charge

    // https://docs.stripe.com/api/charges/list.md
    @DependencyEndpoint
    public var list:
      @Sendable (_ request: Stripe.Charges.List.Request) async throws ->
        Stripe.Charges.List.Response

    // https://docs.stripe.com/api/charges/capture.md
    @DependencyEndpoint
    public var capture:
      @Sendable (_ id: Stripe.Charges.Charge.ID, _ request: Stripe.Charges.Capture.Request)
        async throws -> Stripe.Charges.Charge

    // https://docs.stripe.com/api/charges/search.md
    @DependencyEndpoint
    public var search:
      @Sendable (_ request: Stripe.Charges.Search.Request) async throws ->
        Stripe.Charges.Search.Response
  }
}
