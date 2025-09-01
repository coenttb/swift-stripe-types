//
//  Stripe Connect Account Session Types Client.swift
//  swift-stripe-types
//
//  Created on 2025-01-14.
//

import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import Dependencies

extension Stripe.Connect.Account.Session {
    @DependencyClient
    public struct Client: Sendable {
        // https://docs.stripe.com/api/account_sessions/create.md
        @DependencyEndpoint
        public var create: @Sendable (_ request: Create.Request) async throws -> Stripe.Connect.Account.Session
    }
}