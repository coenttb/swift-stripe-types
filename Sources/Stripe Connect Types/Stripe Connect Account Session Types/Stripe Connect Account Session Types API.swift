//
//  Stripe Connect Account Session Types API.swift
//  swift-stripe-types
//
//  Created on 2025-01-14.
//

import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import URLFormCodingURLRouting
import CasePaths
import Tagged

extension Stripe.Connect.Account.Session {
    @CasePathable
    @dynamicMemberLookup
    public enum API: Equatable, Sendable {
        // https://docs.stripe.com/api/account_sessions/create.md
        case create(request: Create.Request)
    }
}

extension Stripe.Connect.Account.Session.API {
    public struct Router: ParserPrinter, Sendable {
        public init() {}
        
        public var body: some URLRouting.Router<Stripe.Connect.Account.Session.API> {
            OneOf {
                Route(.case(Stripe.Connect.Account.Session.API.create)) {
                    Method.post
                    Path.v1
                    Path.accountSessions
                    Body(.form(Stripe.Connect.Account.Session.Create.Request.self, decoder: .stripe, encoder: .stripe))
                }
            }
        }
    }
}

extension Path<PathBuilder.Component<String>> {
    nonisolated(unsafe) public static let accountSessions = Path {
        "account_sessions"
    }
}