//
//  Stripe Connect Accounts Types Client.swift
//  swift-stripe-types
//
//  Created by coenttb on 2025-01-14.
//

import Dependencies
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.Connect.Accounts {
    @DependencyClient
    public struct Client: Sendable {
        // https://docs.stripe.com/api/accounts/create.md
        @DependencyEndpoint
        public var create:
            @Sendable (_ request: Create.Request) async throws -> Stripe.Connect.Account

        // https://docs.stripe.com/api/accounts/retrieve.md
        @DependencyEndpoint
        public var retrieve:
            @Sendable (_ id: Stripe.Connect.Account.ID) async throws -> Stripe.Connect.Account

        // https://docs.stripe.com/api/accounts/update.md
        @DependencyEndpoint
        public var update:
            @Sendable (_ id: Stripe.Connect.Account.ID, _ request: Update.Request) async throws ->
                Stripe.Connect.Account

        // https://docs.stripe.com/api/accounts/list.md
        @DependencyEndpoint
        public var list: @Sendable (_ request: List.Request) async throws -> List.Response

        // https://docs.stripe.com/api/accounts/delete.md
        @DependencyEndpoint
        public var delete:
            @Sendable (_ id: Stripe.Connect.Account.ID) async throws -> DeletedObject<
                Stripe.Connect.Account
            >

        // https://docs.stripe.com/api/accounts/reject.md
        @DependencyEndpoint
        public var reject:
            @Sendable (_ id: Stripe.Connect.Account.ID, _ request: Reject.Request) async throws ->
                Stripe.Connect.Account
    }
}
