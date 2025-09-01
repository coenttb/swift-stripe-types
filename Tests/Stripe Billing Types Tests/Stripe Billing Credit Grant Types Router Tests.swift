import Foundation
@testable import Stripe_Billing_Types
@testable import Stripe_Types_Models
import Stripe_Types_Shared
import Testing
import URLRouting

@Suite("Credit Grant Router Tests")
struct CreditGrantRouterTests {
    let router = Stripe.Billing.Credit.Grant.API.Router()
    
    @Test("Create credit grant route")
    func testCreateRoute() throws {
        let request = Stripe.Billing.Credit.Grant.Create.Request(
            amount: .init(
                monetary: .init(currency: "usd", value: 1000),
                type: "monetary"
            ),
            applicabilityConfig: .init(
                scope: .init(priceType: "metered", prices: nil)
            ),
            category: .promotional,
            customer: "cus_123"
        )
        
        let api = Stripe.Billing.Credit.Grant.API.create(request: request)
        let url = router.url(for: api)
        
        #expect(url.path == "/v1/billing/credit_grants")
        
        // Round-trip test
        let match = try router.match(request: try router.request(for: api))
        #expect(match.is(\.create))
    }
    
    @Test("Retrieve credit grant route")
    func testRetrieveRoute() throws {
        let id = Stripe.Billing.Credit.Grant.ID("credgr_123")
        let api = Stripe.Billing.Credit.Grant.API.retrieve(id: id)
        let url = router.url(for: api)
        
        #expect(url.path == "/v1/billing/credit_grants/credgr_123")
        
        // Round-trip test
        let match = try router.match(request: try router.request(for: api))
        #expect(match.is(\.retrieve))
    }
    
    @Test("Update credit grant route")
    func testUpdateRoute() throws {
        let id = Stripe.Billing.Credit.Grant.ID("credgr_123")
        let request = Stripe.Billing.Credit.Grant.Update.Request(
            metadata: ["key": "value"]
        )
        
        let api = Stripe.Billing.Credit.Grant.API.update(id: id, request: request)
        let url = router.url(for: api)
        
        #expect(url.path == "/v1/billing/credit_grants/credgr_123")
        
        // Round-trip test
        let match = try router.match(request: try router.request(for: api))
        #expect(match.is(\.update))
    }
    
    @Test("List credit grants route")
    func testListRoute() throws {
        let request = Stripe.Billing.Credit.Grant.List.Request(
            customer: "cus_123",
            limit: 10
        )
        
        let api = Stripe.Billing.Credit.Grant.API.list(request: request)
        let url = router.url(for: api)
        
        #expect(url.path == "/v1/billing/credit_grants")
        #expect(url.query == "customer=cus_123&limit=10")
        
        // Round-trip test
        let match = try router.match(request: try router.request(for: api))
        #expect(match.is(\.list))
    }
    
    @Test("Expire credit grant route")
    func testExpireRoute() throws {
        let id = Stripe.Billing.Credit.Grant.ID("credgr_123")
        let request = Stripe.Billing.Credit.Grant.Expire.Request()
        
        let api = Stripe.Billing.Credit.Grant.API.expire(id: id, request: request)
        let url = router.url(for: api)
        
        #expect(url.path == "/v1/billing/credit_grants/credgr_123/expire")
        
        // Round-trip test
        let match = try router.match(request: try router.request(for: api))
        #expect(match.is(\.expire))
    }
    
    @Test("Void credit grant route")
    func testVoidRoute() throws {
        let id = Stripe.Billing.Credit.Grant.ID("credgr_123")
        let request = Stripe.Billing.Credit.Grant.Void.Request()
        
        let api = Stripe.Billing.Credit.Grant.API.void(id: id, request: request)
        let url = router.url(for: api)
        
        #expect(url.path == "/v1/billing/credit_grants/credgr_123/void")
        
        // Round-trip test
        let match = try router.match(request: try router.request(for: api))
        #expect(match.is(\.void))
    }
}
