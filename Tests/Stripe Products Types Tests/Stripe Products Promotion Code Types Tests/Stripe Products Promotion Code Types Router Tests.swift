import Foundation
@testable import Stripe_Products_Types
@testable import Stripe_Types_Models
import Stripe_Types_Shared
import Testing
import URLRouting
import Tagged

@Suite("Products Promotion Codes Router Tests")
struct ProductsPromotionCodesRouterTests {
    let router = Stripe.Products.PromotionCodes.API.Router()
    
    @Test("Create promotion code")
    func createPromotionCode() throws {
        let request = Stripe.Products.PromotionCodes.Create.Request(
            coupon: "coup_123",
            active: true,
            code: "SUMMER2024"
        )
        let api = Stripe.Products.PromotionCodes.API.create(request: request)
        
        let urlRequest = try router.request(for: api)
        #expect(urlRequest.url?.path == "/v1/promotion_codes")
        #expect(urlRequest.httpMethod == "POST")
        
        let parsed = try router.match(request: urlRequest)
        #expect(parsed.is(\.create))
    }
    
    @Test("Retrieve promotion code")
    func retrievePromotionCode() throws {
        let promoCodeId: Promotion.Code.ID = "promo_123"
        let api = Stripe.Products.PromotionCodes.API.retrieve(id: promoCodeId)
        
        let url = router.url(for: api)
        #expect(url.path == "/v1/promotion_codes/promo_123")
        
        let urlRequest = try router.request(for: api)
        #expect(urlRequest.httpMethod == "GET")
        
        let parsed = try router.match(request: urlRequest)
        #expect(parsed.is(\.retrieve))
        
        if case let .retrieve(id) = parsed {
            #expect(id == promoCodeId)
        }
    }
    
    @Test("Update promotion code")
    func updatePromotionCode() throws {
        let promoCodeId: Promotion.Code.ID = "promo_123"
        let request = Stripe.Products.PromotionCodes.Update.Request(
            active: false,
            metadata: ["key": "value"]
        )
        let api = Stripe.Products.PromotionCodes.API.update(id: promoCodeId, request: request)
        
        let url = router.url(for: api)
        #expect(url.path == "/v1/promotion_codes/promo_123")
        
        let urlRequest = try router.request(for: api)
        #expect(urlRequest.httpMethod == "POST")
        
        let parsed = try router.match(request: urlRequest)
        #expect(parsed.is(\.update))
        
        if case let .update(id, _) = parsed {
            #expect(id == promoCodeId)
        }
    }
    
    @Test("List promotion codes")
    func listPromotionCodes() throws {
        let request = Stripe.Products.PromotionCodes.List.Request(
            active: true,
            coupon: "coup_456",
            limit: 25
        )
        let api = Stripe.Products.PromotionCodes.API.list(request: request)
        
        let url = router.url(for: api)
        #expect(url.path == "/v1/promotion_codes")
        #expect(url.query?.contains("active=true") == true)
        #expect(url.query?.contains("coupon=coup_456") == true)
        #expect(url.query?.contains("limit=25") == true)
        
        let urlRequest = try router.request(for: api)
        #expect(urlRequest.httpMethod == "GET")
        
        let parsed = try router.match(request: urlRequest)
        if case .list = parsed {
            // Expected
        } else {
            Issue.record("Expected list case")
        }
    }
    
    @Test("List promotion codes with all parameters")
    func listPromotionCodesAllParameters() throws {
        let created = Stripe.DateFilter(gte: 1609459200)
        let request = Stripe.Products.PromotionCodes.List.Request(
            active: false,
            code: "WINTER2024",
            coupon: "coup_789",
            created: created,
            customer: "cus_123",
            endingBefore: "promo_100",
            limit: 50,
            startingAfter: "promo_200"
        )
        let api = Stripe.Products.PromotionCodes.API.list(request: request)
        
        let url = router.url(for: api)
        #expect(url.path == "/v1/promotion_codes")
        #expect(url.query?.contains("active=false") == true)
        #expect(url.query?.contains("code=WINTER2024") == true)
        #expect(url.query?.contains("coupon=coup_789") == true)
        #expect(url.query?.contains("customer=cus_123") == true)
        #expect(url.query?.contains("limit=50") == true)
        
        let urlRequest = try router.request(for: api)
        let parsed = try router.match(request: urlRequest)
        if case .list = parsed {
            // Expected
        } else {
            Issue.record("Expected list case")
        }
    }
    
    @Test("Create promotion code with restrictions")
    func createPromotionCodeWithRestrictions() throws {
        let restrictions = Stripe.Products.PromotionCodes.Restrictions(
            firstTimeTransaction: true,
            minimumAmount: 5000,
            minimumAmountCurrency: .usd
        )
        let request = Stripe.Products.PromotionCodes.Create.Request(
            coupon: "coup_special",
            active: true,
            code: "FIRSTTIME",
            maxRedemptions: 100,
            restrictions: restrictions
        )
        let api = Stripe.Products.PromotionCodes.API.create(request: request)
        
        let urlRequest = try router.request(for: api)
        #expect(urlRequest.url?.path == "/v1/promotion_codes")
        #expect(urlRequest.httpMethod == "POST")
        
        let parsed = try router.match(request: urlRequest)
        #expect(parsed.is(\.create))
    }
}