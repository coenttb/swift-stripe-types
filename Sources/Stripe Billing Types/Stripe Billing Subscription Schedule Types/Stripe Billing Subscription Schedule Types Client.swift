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

extension Stripe.Billing.SubscriptionSchedule {
    @DependencyClient
    public struct Client: Sendable {
        // https://docs.stripe.com/api/subscription_schedules/create.md
        @DependencyEndpoint
        public var create: @Sendable (_ request: Stripe.Billing.SubscriptionSchedule.Create.Request) async throws -> Model
        
        // https://docs.stripe.com/api/subscription_schedules/retrieve.md
        @DependencyEndpoint
        public var retrieve: @Sendable (_ id: Stripe.Billing.Subscription.Schedule.ID) async throws -> Model
        
        // https://docs.stripe.com/api/subscription_schedules/update.md
        @DependencyEndpoint
        public var update: @Sendable (_ id: Stripe.Billing.Subscription.Schedule.ID, _ request: Stripe.Billing.SubscriptionSchedule.Update.Request) async throws -> Model
        
        // https://docs.stripe.com/api/subscription_schedules/list.md
        @DependencyEndpoint
        public var list: @Sendable (_ request: Stripe.Billing.SubscriptionSchedule.List.Request) async throws -> Stripe.Billing.SubscriptionSchedule.List.Response
        
        // https://docs.stripe.com/api/subscription_schedules/cancel.md
        @DependencyEndpoint
        public var cancel: @Sendable (_ id: Stripe.Billing.Subscription.Schedule.ID, _ request: Stripe.Billing.SubscriptionSchedule.Cancel.Request) async throws -> Model
        
        // https://docs.stripe.com/api/subscription_schedules/release.md
        @DependencyEndpoint
        public var release: @Sendable (_ id: Stripe.Billing.Subscription.Schedule.ID, _ request: Stripe.Billing.SubscriptionSchedule.Release.Request) async throws -> Model
    }
}

extension Stripe.Billing.SubscriptionSchedule {
    public struct Model: Codable, Equatable, Sendable {
        public let id: Stripe.Billing.Subscription.Schedule.ID
        public let object: String
        public let created: Date
        
        public init(
            id: Stripe.Billing.Subscription.Schedule.ID,
            object: String = "subscription_schedule",
            created: Date
        ) {
            self.id = id
            self.object = object
            self.created = created
        }
    }
}
