import Foundation
@testable import Stripe_Products_Types
@testable import Stripe_Types_Models
import Stripe_Types_Shared
import Testing
import URLRouting

@Suite("Products Price Router Tests")
struct ProductsPriceRouterTests {

    @Test("Creates correct URL for price creation")
    func testCreatePriceURL() throws {
        let router: Stripe.Products.Prices.API.Router = .init()

        let createRequest = Stripe.Products.Prices.Create.Request(
            currency: .usd,
            active: true,
            metadata: ["type": "subscription"],
            product: "prod_123",
            recurring: Stripe.Products.Price.Recurring(
                interval: .month,
                intervalCount: 1
            ),
            unitAmount: 2000
        )

        let url = router.url(for: .create(request: createRequest))
        #expect(url.path == "/v1/prices")
    }

    @Test("Creates correct URL for price retrieval")
    func testRetrievePriceURL() throws {
        let router: Stripe.Products.Prices.API.Router = .init()

        let url = router.url(for: .retrieve(id: "price_123"))
        #expect(url.path == "/v1/prices/price_123")
    }

    @Test("Creates correct URL for price update")
    func testUpdatePriceURL() throws {
        let router: Stripe.Products.Prices.API.Router = .init()

        let updateRequest = Stripe.Products.Prices.Update.Request(
            active: true,
            metadata: ["updated": "true"],
            nickname: "Updated Price"
        )

        let url = router.url(for: .update(id: "price_123", request: updateRequest))
        #expect(url.path == "/v1/prices/price_123")
    }

    @Test("Creates correct URL for listing prices")
    func testListPricesURL() throws {
        let router: Stripe.Products.Prices.API.Router = .init()

        let listRequest = Stripe.Products.Prices.List.Request(
            active: true,
            currency: .usd,
            limit: 10,
            product: "prod_123"
        )

        let url = router.url(for: .list(request: listRequest))
        #expect(url.path == "/v1/prices")

        let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        let queryItems = components?.queryItems ?? []
        let queryDict = Dictionary<String, String?>(uniqueKeysWithValues: queryItems.map { ($0.name, $0.value) })

        #expect(queryDict["active"] == "true")
        #expect(queryDict["currency"] == "usd")
        #expect(queryDict["product"] == "prod_123")
        #expect(queryDict["limit"] == "10")
    }

    @Test("Creates correct URL for searching prices")
    func testSearchPricesURL() throws {
        let router: Stripe.Products.Prices.API.Router = .init()

        let searchRequest = Stripe.Products.Prices.Search.Request(
            query: "active:'true' AND metadata['type']:'subscription'",
            limit: 10
        )

        let url = router.url(for: .search(request: searchRequest))
        #expect(url.path == "/v1/prices/search")

        let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        let queryItems = components?.queryItems ?? []
        let queryDict = Dictionary<String, String?>(uniqueKeysWithValues: queryItems.map { ($0.name, $0.value) })

        #expect(queryDict["query"] == "active:'true' AND metadata['type']:'subscription'")
        #expect(queryDict["limit"] == "10")
    }

    @Test("Creates correct URL for recurring price creation")
    func testCreateRecurringPriceURL() throws {
        let router: Stripe.Products.Prices.API.Router = .init()

        let createRequest = Stripe.Products.Prices.Create.Request(
            currency: .usd,
            product: "prod_123",
            recurring: Stripe.Products.Price.Recurring(
                interval: .month,
                intervalCount: 1,
                usageType: .licensed
            ),
            unitAmount: 2000
        )

        let url = router.url(for: .create(request: createRequest))
        #expect(url.path == "/v1/prices")
    }
}
