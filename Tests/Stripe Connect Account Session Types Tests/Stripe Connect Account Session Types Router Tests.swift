//
//  Stripe Connect Account Session Types Router Tests.swift
//  swift-stripe-types
//
//  Created on 2025-01-14.
//

import Foundation
import Stripe_Types_Shared
import Testing
import URLRouting

@testable import Stripe_Connect_Types
@testable import Stripe_Types_Models

@Suite("Connect Account Session Router Tests")
struct ConnectAccountSessionRouterTests {
    let router = Stripe.Connect.Account.Session.API.Router()

    @Test("Create account session")
    func testCreateAccountSession() throws {
        let accountId = Stripe.Connect.Account.ID("acct_1234567890")
        let request = Stripe.Connect.Account.Session.Create.Request(
            account: accountId,
            components: .init(
                accountOnboarding: .init(enabled: true),
                payments: .init(enabled: true),
                payouts: .init(enabled: true),
                balances: .init(enabled: true)
            )
        )

        let api = Stripe.Connect.Account.Session.API.create(request: request)

        // Generate URL request
        let urlRequest = try router.request(
            for: api,
            baseURL: URL(string: "https://api.stripe.com")!
        )

        // Verify method
        #expect(urlRequest.httpMethod == "POST")

        // Verify URL
        #expect(urlRequest.url?.absoluteString == "https://api.stripe.com/v1/account_sessions")

        // Verify body contains form data
        #expect(urlRequest.httpBody != nil)

        // Parse back the API from the request
        let parsedAPI = try router.parse(
            request: urlRequest,
            baseURL: URL(string: "https://api.stripe.com")!
        )
        #expect(parsedAPI == api)
    }

    @Test("Create account session with minimal components")
    func testCreateAccountSessionMinimal() throws {
        let accountId = Stripe.Connect.Account.ID("acct_test")
        let request = Stripe.Connect.Account.Session.Create.Request(
            account: accountId,
            components: .init(accountOnboarding: .init(enabled: true))
        )

        let api = Stripe.Connect.Account.Session.API.create(request: request)

        // Generate URL request
        let urlRequest = try router.request(
            for: api,
            baseURL: URL(string: "https://api.stripe.com")!
        )

        // Verify method
        #expect(urlRequest.httpMethod == "POST")

        // Verify URL
        #expect(urlRequest.url?.absoluteString == "https://api.stripe.com/v1/account_sessions")
    }

    @Test("Create account session with all components")
    func testCreateAccountSessionAllComponents() throws {
        let accountId = Stripe.Connect.Account.ID("acct_complete")
        let request = Stripe.Connect.Account.Session.Create.Request(
            account: accountId,
            components: .init(
                accountManagement: .init(enabled: true),
                accountOnboarding: .init(enabled: true),
                balances: .init(enabled: true),
                disputesList: .init(enabled: true),
                documents: .init(enabled: true),
                financialAccount: .init(enabled: true),
                financialAccountTransactions: .init(enabled: true),
                instantPayoutsPromotion: .init(enabled: true),
                issuingCard: .init(enabled: true),
                issuingCardsList: .init(enabled: true),
                notificationBanner: .init(enabled: true),
                paymentDetails: .init(enabled: true),
                paymentDisputes: .init(enabled: true),
                payments: .init(enabled: true),
                payouts: .init(enabled: true),
                payoutsList: .init(enabled: true),
                taxRegistrations: .init(enabled: true),
                taxSettings: .init(enabled: true)
            )
        )

        let api = Stripe.Connect.Account.Session.API.create(request: request)

        // Generate URL request
        let urlRequest = try router.request(
            for: api,
            baseURL: URL(string: "https://api.stripe.com")!
        )

        // Verify the request was created successfully
        #expect(urlRequest.httpMethod == "POST")
        #expect(urlRequest.url?.absoluteString == "https://api.stripe.com/v1/account_sessions")
        #expect(urlRequest.httpBody != nil)
    }
}
