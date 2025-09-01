import Foundation
@testable import Stripe_Billing_Types
@testable import Stripe_Types_Models
import Stripe_Types_Shared
import Testing
import URLRouting

@Suite("Billing Alerts Router Tests")
struct BillingAlertsRouterTests {
    let router = Stripe.Billing.Alerts.API.Router()
    
    @Test("Create alert route")
    func testCreateRoute() throws {
        let request = Stripe.Billing.Alerts.Create.Request(
            alertType: .usageThreshold,
            title: "High Usage Alert",
            usageThreshold: .init(
                filters: nil,
                gte: 1000,
                meter: "meter_123",
                recurrence: .oneTime
            )
        )
        
        let api = Stripe.Billing.Alerts.API.create(request: request)
        let url = router.url(for: api)
        
        #expect(url.path == "/v1/billing/alerts")
        
        // Round-trip test
        let match = try router.match(request: try router.request(for: api))
        #expect(match.is(\.create))
    }
    
    @Test("Retrieve alert route")
    func testRetrieveRoute() throws {
        let id: Stripe.Billing.Alerts.Alert.ID = "alrt_123"
        let api = Stripe.Billing.Alerts.API.retrieve(id: id)
        let url = router.url(for: api)
        
        #expect(url.path == "/v1/billing/alerts/alrt_123")
        
        // Round-trip test
        let match = try router.match(request: try router.request(for: api))
        #expect(match.is(\.retrieve))
    }
    
    @Test("List alerts route")
    func testListRoute() throws {
        let request = Stripe.Billing.Alerts.List.Request(
            alertType: .usageThreshold,
            limit: 10,
            meter: "meter_123"
        )
        
        let api = Stripe.Billing.Alerts.API.list(request: request)
        let url = router.url(for: api)
        
        #expect(url.path == "/v1/billing/alerts")
        #expect(url.query == "alert_type=usage_threshold&limit=10&meter=meter_123")
        
        // Round-trip test
        let match = try router.match(request: try router.request(for: api))
        #expect(match.is(\.list))
    }
    
    @Test("Activate alert route")
    func testActivateRoute() throws {
        let id: Stripe.Billing.Alerts.Alert.ID = "alrt_123"
        let api = Stripe.Billing.Alerts.API.activate(id: id)
        let url = router.url(for: api)
        
        #expect(url.path == "/v1/billing/alerts/alrt_123/activate")
        
        // Round-trip test
        let match = try router.match(request: try router.request(for: api))
        #expect(match.is(\.activate))
    }
    
    @Test("Archive alert route")
    func testArchiveRoute() throws {
        let id: Stripe.Billing.Alerts.Alert.ID = "alrt_123"
        let api = Stripe.Billing.Alerts.API.archive(id: id)
        let url = router.url(for: api)
        
        #expect(url.path == "/v1/billing/alerts/alrt_123/archive")
        
        // Round-trip test
        let match = try router.match(request: try router.request(for: api))
        #expect(match.is(\.archive))
    }
    
    @Test("Deactivate alert route")
    func testDeactivateRoute() throws {
        let id: Stripe.Billing.Alerts.Alert.ID = "alrt_123"
        let api = Stripe.Billing.Alerts.API.deactivate(id: id)
        let url = router.url(for: api)
        
        #expect(url.path == "/v1/billing/alerts/alrt_123/deactivate")
        
        // Round-trip test
        let match = try router.match(request: try router.request(for: api))
        #expect(match.is(\.deactivate))
    }
}