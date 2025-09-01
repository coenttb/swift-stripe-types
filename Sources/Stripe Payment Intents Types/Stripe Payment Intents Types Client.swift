//
//  File.swift
//  coenttb-stripe
//
//  Created by Coen ten Thije Boonkkamp on 04/01/2025.
//

import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared


extension Stripe.PaymentIntents {
    @DependencyClient
    public struct Client: Sendable {
        // https://docs.stripe.com/api/payment_intents/create.md
        @DependencyEndpoint
        public var create: @Sendable (_ request: Stripe.PaymentIntents.Create.Request) async throws -> Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent

        // https://docs.stripe.com/api/payment_intents/update.md
        @DependencyEndpoint
        public var update: @Sendable (_ id: Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent.ID, _ request: Stripe.PaymentIntents.Update.Request) async throws -> Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent

        // https://docs.stripe.com/api/payment_intents/retrieve.md
        @DependencyEndpoint
        public var retrieve: @Sendable (_ id: Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent.ID) async throws -> Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent

        // https://docs.stripe.com/api/payment_intents/list.md
        @DependencyEndpoint
        public var list: @Sendable (_ request: Stripe.PaymentIntents.List.Request) async throws -> Stripe.PaymentIntents.List.Response

        // https://docs.stripe.com/api/payment_intents/cancel.md
        @DependencyEndpoint
        public var cancel: @Sendable (_ id: Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent.ID, _ request: Stripe.PaymentIntents.Cancel.Request) async throws -> Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent

        // https://docs.stripe.com/api/payment_intents/capture.md
        @DependencyEndpoint
        public var capture: @Sendable (_ id: Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent.ID, _ request: Stripe.PaymentIntents.Capture.Request) async throws -> Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent

        // https://docs.stripe.com/api/payment_intents/confirm.md
        @DependencyEndpoint
        public var confirm: @Sendable (_ id: Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent.ID, _ request: Stripe.PaymentIntents.Confirm.Request) async throws -> Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent

        // https://docs.stripe.com/api/payment_intents/increment_authorization.md
        @DependencyEndpoint
        public var incrementAuthorization: @Sendable (_ id: Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent.ID, _ request: Stripe.PaymentIntents.IncrementAuthorization.Request) async throws -> Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent

        // https://docs.stripe.com/api/payment_intents/apply_customer_balance.md
        @DependencyEndpoint
        public var applyCustomerBalance: @Sendable (_ id: Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent.ID) async throws -> Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent

        // https://docs.stripe.com/api/payment_intents/search.md
        @DependencyEndpoint
        public var search: @Sendable (_ request: Stripe.PaymentIntents.Search.Request) async throws -> Stripe.PaymentIntents.Search.Response

        // https://docs.stripe.com/api/payment_intents/verify_microdeposits.md
        @DependencyEndpoint
        public var verifyMicrodeposits: @Sendable (_ id: Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent.ID, _ request: Stripe.PaymentIntents.VerifyMicrodeposits.Request) async throws -> Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent
    }
}
