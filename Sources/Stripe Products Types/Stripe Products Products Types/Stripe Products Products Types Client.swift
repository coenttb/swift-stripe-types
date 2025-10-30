//
//  Products Client.swift
//  swift-stripe-types
//
//  Created by Coen ten Thije Boonkkamp on 05/01/2025.
//

import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.Products.Products {
  @DependencyClient
  public struct Client: Sendable {
    @DependencyEndpoint
    public var create:
      @Sendable (_ request: Stripe.Products.Products.Create.Request) async throws ->
        Stripe.Products.Product

    @DependencyEndpoint
    public var update:
      @Sendable (
        _ id: Stripe.Products.Product.ID, _ request: Stripe.Products.Products.Update.Request
      ) async throws -> Stripe.Products.Product

    @DependencyEndpoint
    public var retrieve:
      @Sendable (_ id: Stripe.Products.Product.ID) async throws -> Stripe.Products.Product

    @DependencyEndpoint
    public var list:
      @Sendable (_ request: Stripe.Products.Products.List.Request) async throws ->
        Stripe.Products.Products.List.Response

    @DependencyEndpoint
    public var delete:
      @Sendable (_ id: Stripe.Products.Product.ID) async throws -> DeletedObject<
        Stripe.Products.Product
      >

    @DependencyEndpoint
    public var search:
      @Sendable (_ request: Stripe.Products.Products.Search.Request) async throws ->
        Stripe.Products.Products.Search.Response
  }
}
