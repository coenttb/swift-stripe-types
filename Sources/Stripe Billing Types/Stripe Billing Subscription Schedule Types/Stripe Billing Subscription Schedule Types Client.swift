//
//  Stripe Billing Subscription Schedule Types Client.swift
//  swift-stripe-types
//
//  Created by Coen ten Thije Boonkkamp on 13/01/2025.
//

import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import Dependencies

extension Stripe.Billing.Subscription.Schedule {
    @DependencyClient
    public struct Client: Sendable {
        // https://docs.stripe.com/api/subscription_schedules/create.md
        @DependencyEndpoint
        public var create: @Sendable (_ request: Stripe.Billing.Subscription.Schedule.Create.Request) async throws -> Stripe.Billing.Subscription.Schedule
        
        // https://docs.stripe.com/api/subscription_schedules/retrieve.md
        @DependencyEndpoint
        public var retrieve: @Sendable (_ id: Stripe.Billing.Subscription.Schedule.ID) async throws -> Stripe.Billing.Subscription.Schedule
        
        // https://docs.stripe.com/api/subscription_schedules/update.md
        @DependencyEndpoint
        public var update: @Sendable (_ id: Stripe.Billing.Subscription.Schedule.ID, _ request: Stripe.Billing.Subscription.Schedule.Update.Request) async throws -> Stripe.Billing.Subscription.Schedule
        
        // https://docs.stripe.com/api/subscription_schedules/list.md
        @DependencyEndpoint
        public var list: @Sendable (_ request: Stripe.Billing.Subscription.Schedule.List.Request) async throws -> Stripe.Billing.Subscription.Schedule.List.Response
        
        // https://docs.stripe.com/api/subscription_schedules/cancel.md
        @DependencyEndpoint
        public var cancel: @Sendable (_ id: Stripe.Billing.Subscription.Schedule.ID, _ request: Stripe.Billing.Subscription.Schedule.Cancel.Request) async throws -> Stripe.Billing.Subscription.Schedule
        
        // https://docs.stripe.com/api/subscription_schedules/release.md
        @DependencyEndpoint
        public var release: @Sendable (_ id: Stripe.Billing.Subscription.Schedule.ID, _ request: Stripe.Billing.Subscription.Schedule.Release.Request) async throws -> Stripe.Billing.Subscription.Schedule
    }
}
