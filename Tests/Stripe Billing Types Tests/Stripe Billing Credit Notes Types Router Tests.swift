//
//  Stripe Billing Credit Notes Types Router Tests.swift
//  swift-stripe-types
//
//  Created by Coen ten Thije Boonkkamp on 13/01/2025.
//

import Foundation
import Stripe_Types_Shared
import Testing
import URLRouting

@testable import Stripe_Billing_Types
@testable import Stripe_Types_Models

@Suite("Billing Credit Notes Router Tests")
struct BillingCreditNotesRouterTests {
    let router = Stripe.Billing.CreditNotes.API.Router()

    @Test("Create credit note URL generation")
    func testCreateCreditNote() throws {
        let request = Stripe.Billing.CreditNotes.Create.Request(
            invoice: "in_123",
            amount: 1000,
            memo: "Test credit note"
        )
        let api = Stripe.Billing.CreditNotes.API.create(request: request)
        let url = router.url(for: api)

        #expect(url.path == "/v1/credit_notes")
    }

    @Test("Update credit note URL generation")
    func testUpdateCreditNote() throws {
        let request = Stripe.Billing.CreditNotes.Update.Request(
            memo: "Updated memo"
        )
        let api = Stripe.Billing.CreditNotes.API.update(id: "cn_123", request: request)
        let url = router.url(for: api)

        #expect(url.path == "/v1/credit_notes/cn_123")
    }

    @Test("Retrieve credit note URL generation")
    func testRetrieveCreditNote() throws {
        let api = Stripe.Billing.CreditNotes.API.retrieve(id: "cn_123")
        let url = router.url(for: api)

        #expect(url.path == "/v1/credit_notes/cn_123")
    }

    @Test("List credit notes URL generation")
    func testListCreditNotes() throws {
        let request = Stripe.Billing.CreditNotes.List.Request(
            customer: "cus_123",
            limit: 10
        )
        let api = Stripe.Billing.CreditNotes.API.list(request: request)
        let url = router.url(for: api)

        #expect(url.path == "/v1/credit_notes")
        #expect(url.query?.contains("customer=cus_123") == true)
        #expect(url.query?.contains("limit=10") == true)
    }

    @Test("Preview credit note URL generation")
    func testPreviewCreditNote() throws {
        let request = Stripe.Billing.CreditNotes.Preview.Request(
            invoice: "in_123",
            amount: 500
        )
        let api = Stripe.Billing.CreditNotes.API.preview(request: request)
        let url = router.url(for: api)

        #expect(url.path == "/v1/credit_notes/preview")
        #expect(url.query?.contains("invoice=in_123") == true)
        #expect(url.query?.contains("amount=500") == true)
    }

    @Test("Void credit note URL generation")
    func testVoidCreditNote() throws {
        let request = Stripe.Billing.CreditNotes.Void.Request()
        let api = Stripe.Billing.CreditNotes.API.void(id: "cn_123", request: request)
        let url = router.url(for: api)

        #expect(url.path == "/v1/credit_notes/cn_123/void")
    }

    @Test("List credit note lines URL generation")
    func testListCreditNoteLines() throws {
        let request = Stripe.Billing.CreditNotes.Lines.Request(limit: 5)
        let api = Stripe.Billing.CreditNotes.API.lines(id: "cn_123", request: request)
        let url = router.url(for: api)

        #expect(url.path == "/v1/credit_notes/cn_123/lines")
        #expect(url.query?.contains("limit=5") == true)
    }

    @Test("Preview credit note lines URL generation")
    func testPreviewCreditNoteLines() throws {
        let request = Stripe.Billing.CreditNotes.PreviewLines.Request(
            invoice: "in_123",
            limit: 10
        )
        let api = Stripe.Billing.CreditNotes.API.previewLines(request: request)
        let url = router.url(for: api)

        #expect(url.path == "/v1/credit_notes/preview/lines")
        #expect(url.query?.contains("invoice=in_123") == true)
        #expect(url.query?.contains("limit=10") == true)
    }

    @Test("Round-trip parsing for retrieve")
    func testRoundTripRetrieve() throws {
        let original = Stripe.Billing.CreditNotes.API.retrieve(id: "cn_123")
        let request = try router.request(for: original)
        let parsed = try router.match(request: request)
        #expect(parsed == original)
    }
}
