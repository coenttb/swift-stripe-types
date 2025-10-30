//
//  File.swift
//  coenttb-stripe
//
//  Created by Coen ten Thije Boonkkamp on 09/01/2025.
//

import Foundation
import Stripe_Types_Shared
import Testing
import URLRouting

@testable import Stripe_Payment_Link_Types
@testable import Stripe_Types_Models

@Suite("Payment Link Router Tests")
struct PaymentLinkRouterTests {

  @Test("Creates correct URL for payment link creation")
  func testCreatePaymentLinkURL() throws {
    let router: Stripe.PaymentLinks.API.Router = .init()

    let createRequest = Stripe.PaymentLinks.Create.Request(
      lineItems: [
        .init(price: "price_123", quantity: 1)
      ],
      metadata: ["order_id": "12345"],
      afterCompletion: .init(
        redirect: .init(url: "https://example.com"),
        type: .redirect
      ),
      customText: .init(shippingAddress: .init(message: "Test shipping address"))
    )

    let url = router.url(for: .create(request: createRequest))
    #expect(url.path == "/v1/payment_links")
  }

  @Test("Creates correct URL for payment link update")
  func testUpdatePaymentLinkURL() throws {
    let router: Stripe.PaymentLinks.API.Router = .init()

    let id = Stripe.PaymentLink.ID(rawValue: "plink_123")
    let updateRequest = Stripe.PaymentLinks.Update.Request(
      active: true,
      afterCompletion: nil,
      allowPromotionCodes: true,
      automaticTax: nil,
      billingAddressCollection: nil,
      customFields: nil,
      customText: nil,
      customerCreation: nil,
      inactiveMessage: nil,
      invoiceCreation: nil,
      lineItems: nil,
      metadata: ["updated": "true"],
      paymentMethodCollection: nil,
      paymentMethodTypes: nil,
      restrictions: nil,
      shippingAddressCollection: nil,
      submitType: nil,
      subscriptionData: nil,
      taxIdCollection: nil
    )

    let url = router.url(for: .update(id: id, request: updateRequest))
    #expect(url.path == "/v1/payment_links/plink_123")
  }

  @Test("Creates correct URL for payment link retrieval")
  func testRetrievePaymentLinkURL() throws {
    let router: Stripe.PaymentLinks.API.Router = .init()

    let id = Stripe.PaymentLink.ID(rawValue: "plink_123")
    let url = router.url(for: .retrieve(id: id))
    #expect(url.path == "/v1/payment_links/plink_123")
  }

  @Test("Creates correct URL for listing payment links")
  func testListPaymentLinksURL() throws {
    let router: Stripe.PaymentLinks.API.Router = .init()

    let listRequest = Stripe.PaymentLinks.List.Request(
      active: true,
      limit: 10
    )

    let url = router.url(for: .list(request: listRequest))
    #expect(url.path == "/v1/payment_links")

    let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
    let queryItems = components?.queryItems ?? []
    let queryDict = [String: String?](uniqueKeysWithValues: queryItems.map { ($0.name, $0.value) })

    #expect(queryDict["active"] == "true")
    #expect(queryDict["limit"] == "10")
  }

  @Test("Creates correct URL for payment link line items")
  func testLineItemsURL() throws {
    let router: Stripe.PaymentLinks.API.Router = .init()

    let id = Stripe.PaymentLink.ID(rawValue: "plink_123")
    let lineItemsRequest = Stripe.PaymentLinks.LineItems.Request(
      limit: 5
    )

    let url = router.url(for: .lineItems(id: id, request: lineItemsRequest))
    #expect(url.path == "/v1/payment_links/plink_123/line_items")

    let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
    let queryItems = components?.queryItems ?? []
    let queryDict = [String: String?](uniqueKeysWithValues: queryItems.map { ($0.name, $0.value) })

    #expect(queryDict["limit"] == "5")
  }
}
