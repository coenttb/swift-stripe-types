import Foundation
@testable import Stripe_Products_Types
@testable import Stripe_Types_Models
import Stripe_Types_Shared
import Testing
import URLRouting
import Tagged

@Suite("Products Shipping Rates Router Tests")
struct ProductsShippingRatesRouterTests {
    let router = Stripe.Products.ShippingRates.API.Router()
    
    @Test("Create shipping rate")
    func createShippingRate() throws {
        let request = Stripe.Products.ShippingRates.Create.Request(
            displayName: "Standard Shipping",
            type: .fixedAmount,
            fixedAmount: .init(amount: 500, currency: .usd)
        )
        let api = Stripe.Products.ShippingRates.API.create(request: request)
        
        let urlRequest = try router.request(for: api)
        #expect(urlRequest.url?.path == "/v1/shipping_rates")
        #expect(urlRequest.httpMethod == "POST")
        
        let parsed = try router.match(request: urlRequest)
        #expect(parsed.is(\.create))
    }
    
    @Test("Retrieve shipping rate")
    func retrieveShippingRate() throws {
        let shippingRateId: Stripe.Products.Shipping.Rate.ID = "shr_123"
        let api = Stripe.Products.ShippingRates.API.retrieve(id: Stripe.Products.ShippingRateId)
        
        let url = router.url(for: api)
        #expect(url.path == "/v1/shipping_rates/shr_123")
        
        let urlRequest = try router.request(for: api)
        #expect(urlRequest.httpMethod == "GET")
        
        let parsed = try router.match(request: urlRequest)
        #expect(parsed.is(\.retrieve))
        
        if case let .retrieve(id) = parsed {
            #expect(id == shippingRateId)
        }
    }
    
    @Test("Update shipping rate")
    func updateShippingRate() throws {
        let shippingRateId: Stripe.Products.Shipping.Rate.ID = "shr_123"
        let request = Stripe.Products.ShippingRates.Update.Request(
            active: false,
            taxBehavior: .inclusive
        )
        let api = Stripe.Products.ShippingRates.API.update(id: Stripe.Products.ShippingRateId, request: request)
        
        let url = router.url(for: api)
        #expect(url.path == "/v1/shipping_rates/shr_123")
        
        let urlRequest = try router.request(for: api)
        #expect(urlRequest.httpMethod == "POST")
        
        let parsed = try router.match(request: urlRequest)
        #expect(parsed.is(\.update))
        
        if case let .update(id, _) = parsed {
            #expect(id == shippingRateId)
        }
    }
    
    @Test("List shipping rates")
    func listShippingRates() throws {
        let request = Stripe.Products.ShippingRates.List.Request(
            active: true,
            currency: .usd,
            limit: 25
        )
        let api = Stripe.Products.ShippingRates.API.list(request: request)
        
        let url = router.url(for: api)
        #expect(url.path == "/v1/shipping_rates")
        #expect(url.query?.contains("active=true") == true)
        #expect(url.query?.contains("currency=usd") == true)
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
    
    @Test("Create shipping rate with delivery estimate")
    func createShippingRateWithDeliveryEstimate() throws {
        let deliveryEstimate = Stripe.Products.ShippingRates.Create.Request.DeliveryEstimate(
            maximum: .init(unit: .businessDay, value: 5),
            minimum: .init(unit: .businessDay, value: 3)
        )
        let request = Stripe.Products.ShippingRates.Create.Request(
            displayName: "Express Shipping",
            type: .fixedAmount,
            deliveryEstimate: deliveryEstimate,
            fixedAmount: .init(amount: 1500, currency: .usd),
            taxBehavior: .exclusive
        )
        let api = Stripe.Products.ShippingRates.API.create(request: request)
        
        let urlRequest = try router.request(for: api)
        #expect(urlRequest.url?.path == "/v1/shipping_rates")
        #expect(urlRequest.httpMethod == "POST")
        
        let parsed = try router.match(request: urlRequest)
        if case .create = parsed {
            // Expected
        } else {
            Issue.record("Expected create case")
        }
    }
    
    @Test("Update shipping rate with currency options")
    func updateShippingRateWithCurrencyOptions() throws {
        let shippingRateId: Stripe.Products.Shipping.Rate.ID = "shr_123"
        let currencyOptions = [
            "eur": Stripe.Products.ShippingRates.Update.Request.FixedAmount.CurrencyOption(
                amount: 600,
                taxBehavior: .inclusive
            )
        ]
        let request = Stripe.Products.ShippingRates.Update.Request(
            fixedAmount: .init(currencyOptions: currencyOptions)
        )
        let api = Stripe.Products.ShippingRates.API.update(id: Stripe.Products.ShippingRateId, request: request)
        
        let urlRequest = try router.request(for: api)
        #expect(urlRequest.url?.path == "/v1/shipping_rates/shr_123")
        #expect(urlRequest.httpMethod == "POST")
        
        let parsed = try router.match(request: urlRequest)
        #expect(parsed.is(\.update))
    }
    
    @Test("List shipping rates with all parameters")
    func listShippingRatesAllParameters() throws {
        let created = Stripe.DateFilter(gte: 1609459200)
        let request = Stripe.Products.ShippingRates.List.Request(
            active: false,
            created: created,
            currency: .eur,
            endingBefore: "shr_100",
            limit: 50,
            startingAfter: "shr_200"
        )
        let api = Stripe.Products.ShippingRates.API.list(request: request)
        
        let url = router.url(for: api)
        #expect(url.path == "/v1/shipping_rates")
        #expect(url.query?.contains("active=false") == true)
        #expect(url.query?.contains("currency=eur") == true)
        #expect(url.query?.contains("limit=50") == true)
        
        let urlRequest = try router.request(for: api)
        let parsed = try router.match(request: urlRequest)
        if case .list = parsed {
            // Expected
        } else {
            Issue.record("Expected list case")
        }
    }
}
