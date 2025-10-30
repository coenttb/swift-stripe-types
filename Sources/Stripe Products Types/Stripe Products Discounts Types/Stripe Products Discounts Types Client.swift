//
//  Stripe Products Discounts Types Client.swift
//  swift-stripe-types
//
//  Created on 2025-01-14.
//

import Dependencies
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.Products.Discounts {
  @DependencyClient
  public struct Client: Sendable {
    // https://docs.stripe.com/api/discounts/delete.md
    @DependencyEndpoint
    public var deleteCustomerDiscount:
      @Sendable (_ customerId: Stripe.Customers.Customer.ID) async throws -> DeletedObject<
        Stripe.Products.Discount
      >

    // https://docs.stripe.com/api/discounts/subscription_delete.md
    @DependencyEndpoint
    public var deleteSubscriptionDiscount:
      @Sendable (_ subscriptionId: Stripe.Billing.Subscription.ID) async throws -> DeletedObject<
        Stripe.Products.Discount
      >
  }
}
