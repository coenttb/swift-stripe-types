//
//  Stripe Billing Meters Types Router Tests.swift
//  swift-stripe-types
//
//  Created by Coen ten Thije Boonkkamp on 13/01/2025.
//

import Foundation
@testable import Stripe_Billing_Types
@testable import Stripe_Types_Models
import Stripe_Types_Shared
import Testing
import URLRouting

@Suite("Billing Meters Router Tests")
struct BillingMetersRouterTests {
    let router = Stripe.Billing.Meters.API.Router()
    
    @Test("Create meter URL generation")
    func testCreateMeter() throws {
        let request = Stripe.Billing.Meters.Create.Request(
            displayName: "API Calls",
            eventName: "api_request"
        )
        let api = Stripe.Billing.Meters.API.create(request: request)
        let url = router.url(for: api)
        
        #expect(url.path == "/v1/billing/meters")
    }
    
    @Test("Retrieve meter URL generation")
    func testRetrieveMeter() throws {
        let api = Stripe.Billing.Meters.API.retrieve(id: "meter_123")
        let url = router.url(for: api)
        
        #expect(url.path == "/v1/billing/meters/meter_123")
    }
    
    @Test("Update meter URL generation")
    func testUpdateMeter() throws {
        let request = Stripe.Billing.Meters.Update.Request(
            displayName: "Updated API Calls"
        )
        let api = Stripe.Billing.Meters.API.update(id: "meter_123", request: request)
        let url = router.url(for: api)
        
        #expect(url.path == "/v1/billing/meters/meter_123")
    }
    
    @Test("List meters URL generation")
    func testListMeters() throws {
        let request = Stripe.Billing.Meters.List.Request(
            limit: 10,
            status: .active
        )
        let api = Stripe.Billing.Meters.API.list(request: request)
        let url = router.url(for: api)
        
        #expect(url.path == "/v1/billing/meters")
        #expect(url.query?.contains("limit=10") == true)
        #expect(url.query?.contains("status=active") == true)
    }
    
    @Test("Deactivate meter URL generation")
    func testDeactivateMeter() throws {
        let request = Stripe.Billing.Meters.Deactivate.Request()
        let api = Stripe.Billing.Meters.API.deactivate(id: "meter_123", request: request)
        let url = router.url(for: api)
        
        #expect(url.path == "/v1/billing/meters/meter_123/deactivate")
    }
    
    @Test("Reactivate meter URL generation")
    func testReactivateMeter() throws {
        let request = Stripe.Billing.Meters.Reactivate.Request()
        let api = Stripe.Billing.Meters.API.reactivate(id: "meter_123", request: request)
        let url = router.url(for: api)
        
        #expect(url.path == "/v1/billing/meters/meter_123/reactivate")
    }
    
    @Test("Round-trip parsing for retrieve")
    func testRoundTripRetrieve() throws {
        let original = Stripe.Billing.Meters.API.retrieve(id: "meter_123")
        let request = try router.request(for: original)
        let parsed = try router.match(request: request)
        #expect(parsed == original)
    }
    
    @Test("Round-trip parsing for deactivate")
    func testRoundTripDeactivate() throws {
        let original = Stripe.Billing.Meters.API.deactivate(id: "meter_123", request: .init())
        let request = try router.request(for: original)
        #expect(request.httpMethod == "POST")
        let parsed = try router.match(request: request)
        #expect(parsed == original)
    }
    
    @Test("Round-trip parsing for reactivate")
    func testRoundTripReactivate() throws {
        let original = Stripe.Billing.Meters.API.reactivate(id: "meter_123", request: .init())
        let request = try router.request(for: original)
        #expect(request.httpMethod == "POST")
        let parsed = try router.match(request: request)
        #expect(parsed == original)
    }
}