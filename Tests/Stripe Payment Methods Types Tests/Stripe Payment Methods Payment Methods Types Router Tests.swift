import Foundation
@testable import Stripe_Payment_Methods_Types
@testable import Stripe_Types_Models
import Stripe_Types_Shared
import Testing
import URLRouting

@Suite("Payment Methods Router Tests")
struct PaymentMethodsRouterTests {
    let router = Stripe.PaymentMethods.PaymentMethods.API.Router()
    
    @Test("Create payment method route")
    func testCreateRoute() throws {
        let request = Stripe.PaymentMethods.PaymentMethods.Create.Request(
            type: .card,
            card: .init(
                number: "4242424242424242",
                expMonth: 12,
                expYear: 2025,
                cvc: "123"
            )
        )
        
        let api = Stripe.PaymentMethods.PaymentMethods.API.create(request: request)
        let url = router.url(for: api)
        
        #expect(url.path == "/v1/payment_methods")
        
        // Round-trip test
        let match = try router.match(request: try router.request(for: api))
        #expect(match.is(\.create))
    }
    
    @Test("Retrieve payment method route")
    func testRetrieveRoute() throws {
        let api = Stripe.PaymentMethods.PaymentMethods.API.retrieve(id: "pm_123")
        let url = router.url(for: api)
        
        #expect(url.path == "/v1/payment_methods/pm_123")
        
        // Round-trip test
        let match = try router.match(request: try router.request(for: api))
        #expect(match.is(\.retrieve))
    }
    
    @Test("Retrieve customer payment method route")
    func testRetrieveCustomerRoute() throws {
        let api = Stripe.PaymentMethods.PaymentMethods.API.retrieveCustomer(
            customerId: "cus_123",
            paymentMethodId: "pm_456"
        )
        let url = router.url(for: api)
        
        #expect(url.path == "/v1/customers/cus_123/payment_methods/pm_456")
        
        // Round-trip test
        let match = try router.match(request: try router.request(for: api))
        #expect(match.is(\.retrieveCustomer))
    }
    
    @Test("Update payment method route")
    func testUpdateRoute() throws {
        let request = Stripe.PaymentMethods.PaymentMethods.Update.Request(
            metadata: ["key": "value"]
        )
        
        let api = Stripe.PaymentMethods.PaymentMethods.API.update(id: "pm_123", request: request)
        let url = router.url(for: api)
        
        #expect(url.path == "/v1/payment_methods/pm_123")
        
        // Round-trip test
        let match = try router.match(request: try router.request(for: api))
        #expect(match.is(\.update))
    }
    
    @Test("List payment methods route")
    func testListRoute() throws {
        let request = Stripe.PaymentMethods.PaymentMethods.List.Request(
            customer: "cus_123",
            type: "card",
            limit: 10
        )
        
        let api = Stripe.PaymentMethods.PaymentMethods.API.list(request: request)
        let url = router.url(for: api)
        
        #expect(url.path == "/v1/payment_methods")
        #expect(url.query == "customer=cus_123&type=card&limit=10")
        
        // Round-trip test
        let match = try router.match(request: try router.request(for: api))
        #expect(match.is(\.list))
    }
    
    @Test("List customer payment methods route")
    func testListCustomerRoute() throws {
        let request = Stripe.PaymentMethods.PaymentMethods.List.Customer.Request(
            type: "card",
            limit: 10
        )
        
        let api = Stripe.PaymentMethods.PaymentMethods.API.listCustomer(
            customerId: "cus_123",
            request: request
        )
        let url = router.url(for: api)
        
        #expect(url.path == "/v1/customers/cus_123/payment_methods")
        #expect(url.query == "type=card&limit=10")
        
        // Round-trip test
        let match = try router.match(request: try router.request(for: api))
        #expect(match.is(\.listCustomer))
    }
    
    @Test("Attach payment method route")
    func testAttachRoute() throws {
        let request = Stripe.PaymentMethods.PaymentMethods.Attach.Request(
            customer: "cus_123"
        )
        
        let api = Stripe.PaymentMethods.PaymentMethods.API.attach(id: "pm_123", request: request)
        let url = router.url(for: api)
        
        #expect(url.path == "/v1/payment_methods/pm_123/attach")
        
        // Round-trip test
        let match = try router.match(request: try router.request(for: api))
        #expect(match.is(\.attach))
    }
    
    @Test("Detach payment method route")
    func testDetachRoute() throws {
        let api = Stripe.PaymentMethods.PaymentMethods.API.detach(id: "pm_123")
        let url = router.url(for: api)
        
        #expect(url.path == "/v1/payment_methods/pm_123/detach")
        
        // Round-trip test
        let match = try router.match(request: try router.request(for: api))
        #expect(match.is(\.detach))
    }
}
