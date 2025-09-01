import Foundation
@testable import Stripe_Billing_Types
@testable import Stripe_Types_Models
import Stripe_Types_Shared
import Testing
import URLRouting
import Tagged

@Suite("Customer Portal Configuration Router Tests")
struct CustomerPortalConfigurationRouterTests {
    let router = Stripe.Billing.Customer.Portal.Configuration.API.Router()
    
    @Test("Create configuration route")
    func testCreateRoute() throws {
        let request = Stripe.Billing.Customer.Portal.Configuration.Create.Request(
            features: .init(
                customerUpdate: nil,
                invoiceHistory: .init(enabled: true),
                paymentMethodUpdate: nil,
                subscriptionCancel: nil,
                subscriptionPause: nil,
                subscriptionUpdate: nil
            )
        )
        
        let api = Stripe.Billing.Customer.Portal.Configuration.API.create(request: request)
        let url = router.url(for: api)
        
        #expect(url.path == "/v1/billing_portal/configurations")
        
        // Round-trip test
        let match = try router.match(request: try router.request(for: api))
        #expect(match.is(\.create))
    }
    
    @Test("Retrieve configuration route")
    func testRetrieveRoute() throws {
        let configId: Stripe.Billing.Customer.Portal.Configuration.ID = "bpc_123"
        let api = Stripe.Billing.Customer.Portal.Configuration.API.retrieve(id: configId)
        let url = router.url(for: api)
        
        #expect(url.path == "/v1/billing_portal/configurations/bpc_123")
        
        // Round-trip test
        let match = try router.match(request: try router.request(for: api))
        #expect(match.is(\.retrieve))
    }
    
    @Test("Update configuration route")
    func testUpdateRoute() throws {
        let request = Stripe.Billing.Customer.Portal.Configuration.Update.Request(
            active: true
        )
        
        let configId: Stripe.Billing.Customer.Portal.Configuration.ID = "bpc_123"
        let api = Stripe.Billing.Customer.Portal.Configuration.API.update(id: configId, request: request)
        let url = router.url(for: api)
        
        #expect(url.path == "/v1/billing_portal/configurations/bpc_123")
        
        // Round-trip test
        let match = try router.match(request: try router.request(for: api))
        #expect(match.is(\.update))
    }
    
    @Test("List configurations route")
    func testListRoute() throws {
        let request = Stripe.Billing.Customer.Portal.Configuration.List.Request(
            active: true,
            limit: 10
        )
        
        let api = Stripe.Billing.Customer.Portal.Configuration.API.list(request: request)
        let url = router.url(for: api)
        
        #expect(url.path == "/v1/billing_portal/configurations")
        #expect(url.query == "active=true&limit=10")
        
        // Round-trip test
        let match = try router.match(request: try router.request(for: api))
        #expect(match.is(\.list))
    }
    
    @Test("List with all parameters")
    func testListWithAllParameters() throws {
        let request = Stripe.Billing.Customer.Portal.Configuration.List.Request(
            active: false,
            isDefault: true,
            endingBefore: "bpc_123",
            startingAfter: "bpc_456",
            limit: 50
        )
        
        let api = Stripe.Billing.Customer.Portal.Configuration.API.list(request: request)
        let url = router.url(for: api)
        
        #expect(url.path == "/v1/billing_portal/configurations")
        #expect(url.query?.contains("active=false") == true)
        #expect(url.query?.contains("is_default=true") == true)
        #expect(url.query?.contains("ending_before=bpc_123") == true)
        #expect(url.query?.contains("starting_after=bpc_456") == true)
        #expect(url.query?.contains("limit=50") == true)
    }
}