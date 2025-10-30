//
//  Stripe Billing Quotes Types Client.swift
//  swift-stripe-types
//
//  Created by Coen ten Thije Boonkkamp on 13/01/2025.
//

import Dependencies
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.Billing.Quotes {
  @DependencyClient
  public struct Client: Sendable {
    // https://docs.stripe.com/api/quotes/create.md
    @DependencyEndpoint
    public var create:
      @Sendable (_ request: Stripe.Billing.Quotes.Create.Request) async throws -> Quote

    // https://docs.stripe.com/api/quotes/retrieve.md
    @DependencyEndpoint
    public var retrieve: @Sendable (_ id: Stripe.Billing.Quote.ID) async throws -> Quote

    // https://docs.stripe.com/api/quotes/update.md
    @DependencyEndpoint
    public var update:
      @Sendable (
        _ id: Stripe.Billing.Quotes.Quote.ID, _ request: Stripe.Billing.Quotes.Update.Request
      ) async throws -> Quote

    // https://docs.stripe.com/api/quotes/list.md
    @DependencyEndpoint
    public var list:
      @Sendable (_ request: Stripe.Billing.Quotes.List.Request) async throws ->
        Stripe.Billing.Quotes.List.Response

    // https://docs.stripe.com/api/quotes/accept.md
    @DependencyEndpoint
    public var accept:
      @Sendable (
        _ id: Stripe.Billing.Quotes.Quote.ID, _ request: Stripe.Billing.Quotes.Accept.Request
      ) async throws -> Quote

    // https://docs.stripe.com/api/quotes/cancel.md
    @DependencyEndpoint
    public var cancel:
      @Sendable (
        _ id: Stripe.Billing.Quotes.Quote.ID, _ request: Stripe.Billing.Quotes.Cancel.Request
      ) async throws -> Quote

    // https://docs.stripe.com/api/quotes/finalize.md
    @DependencyEndpoint
    public var finalize:
      @Sendable (
        _ id: Stripe.Billing.Quotes.Quote.ID, _ request: Stripe.Billing.Quotes.Finalize.Request
      ) async throws -> Quote

    // https://docs.stripe.com/api/quotes/pdf.md
    @DependencyEndpoint
    public var pdf: @Sendable (_ id: Stripe.Billing.Quotes.Quote.ID) async throws -> Data

    // https://docs.stripe.com/api/quotes/line_items.md
    @DependencyEndpoint
    public var listLineItems:
      @Sendable (
        _ id: Stripe.Billing.Quotes.Quote.ID,
        _ request: Stripe.Billing.Quotes.List.LineItems.Request
      ) async throws -> Stripe.Billing.Quotes.List.LineItems.Response

    // https://docs.stripe.com/api/quotes/computed_upfront_line_items.md
    @DependencyEndpoint
    public var listComputedUpfrontLineItems:
      @Sendable (
        _ id: Stripe.Billing.Quotes.Quote.ID,
        _ request: Stripe.Billing.Quotes.List.ComputedUpfrontLineItems.Request
      ) async throws -> Stripe.Billing.Quotes.List.ComputedUpfrontLineItems.Response
  }
}
