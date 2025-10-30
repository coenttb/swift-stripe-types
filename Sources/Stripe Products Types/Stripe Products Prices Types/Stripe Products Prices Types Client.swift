//
//  Products Prices Client.swift
//  coenttb-stripe
//
//  Created by Coen ten Thije Boonkkamp on 05/01/2025.
//

import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.Products.Prices {
  @DependencyClient
  public struct Client: Sendable {
    @DependencyEndpoint
    public var create:
      @Sendable (_ request: Stripe.Products.Prices.Create.Request) async throws ->
        Stripe.Products.Price

    @DependencyEndpoint
    public var update:
      @Sendable (_ id: Stripe.Products.Price.ID, _ request: Stripe.Products.Prices.Update.Request)
        async throws -> Stripe.Products.Price

    @DependencyEndpoint
    public var retrieve:
      @Sendable (_ id: Stripe.Products.Price.ID) async throws -> Stripe.Products.Price

    @DependencyEndpoint
    public var list:
      @Sendable (_ request: Stripe.Products.Prices.List.Request) async throws ->
        Stripe.Products.Prices.List.Response

    @DependencyEndpoint
    public var search:
      @Sendable (_ request: Stripe.Products.Prices.Search.Request) async throws ->
        Stripe.Products.Prices.Search.Response
  }
}
