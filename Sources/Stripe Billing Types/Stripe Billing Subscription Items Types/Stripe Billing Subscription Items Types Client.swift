//
//  Stripe Billing Subscription Items Types Client.swift
//  swift-stripe-types
//
//  Created by Coen ten Thije Boonkkamp on 13/01/2025.
//

import Dependencies
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.Billing.SubscriptionItems {
    @DependencyClient
    public struct Client: Sendable {
        // https://docs.stripe.com/api/subscription_items/create.md
        @DependencyEndpoint
        public var create:
            @Sendable (_ request: Stripe.Billing.SubscriptionItems.Create.Request) async throws ->
                Stripe.Billing.Subscription.Item

        // https://docs.stripe.com/api/subscription_items/update.md
        @DependencyEndpoint
        public var update:
            @Sendable (
                _ id: Stripe.Billing.Subscription.Item.ID,
                _ request: Stripe.Billing.SubscriptionItems.Update.Request
            ) async throws -> Stripe.Billing.Subscription.Item

        // https://docs.stripe.com/api/subscription_items/retrieve.md
        @DependencyEndpoint
        public var retrieve:
            @Sendable (_ id: Stripe.Billing.Subscription.Item.ID) async throws ->
                Stripe.Billing.Subscription.Item

        // https://docs.stripe.com/api/subscription_items/list.md
        @DependencyEndpoint
        public var list:
            @Sendable (_ request: Stripe.Billing.SubscriptionItems.List.Request) async throws ->
                Stripe.Billing.SubscriptionItems.List.Response

        // https://docs.stripe.com/api/subscription_items/delete.md
        @DependencyEndpoint
        public var delete:
            @Sendable (_ id: Stripe.Billing.Subscription.Item.ID) async throws -> DeletedObject<
                Stripe.Billing.Subscription.Item
            >
    }
}
