import Foundation
@testable import Stripe_Webhooks_Types
@testable import Stripe_Types_Models
import Stripe_Types_Shared
import Testing
import URLRouting

@Suite("Webhook Endpoints Router Tests")
struct WebhookEndpointsRouterTests {
    let router = Stripe.WebhookEndpoint.API.Router()
    
    @Test("Create webhook endpoint")
    func createWebhookEndpoint() throws {
        let request = Stripe.WebhookEndpoint.Create.Request(
            url: "https://example.com/webhook",
            enabledEvents: ["charge.succeeded", "charge.failed"],
            description: "Test webhook"
        )
        let api = Stripe.WebhookEndpoint.API.create(request: request)
        
        let url = router.url(for: api)
        #expect(url.path == "/v1/webhook_endpoints")
    }
    
    @Test("Retrieve webhook endpoint")
    func retrieveWebhookEndpoint() throws {
        let id = Stripe.WebhookEndpoint.ID("we_123")
        let api = Stripe.WebhookEndpoint.API.retrieve(id: id)
        
        let url = router.url(for: api)
        #expect(url.path == "/v1/webhook_endpoints/we_123")
        
        let request = try router.request(for: api)
        let parsed = try router.match(request: request)
        #expect(parsed == api)
    }
    
    @Test("Update webhook endpoint")
    func updateWebhookEndpoint() throws {
        let id = Stripe.WebhookEndpoint.ID("we_123")
        let updateRequest = Stripe.WebhookEndpoint.Update.Request(
            description: "Updated webhook",
            disabled: false
        )
        let api = Stripe.WebhookEndpoint.API.update(id: id, request: updateRequest)
        
        let url = router.url(for: api)
        #expect(url.path == "/v1/webhook_endpoints/we_123")
    }
    
    @Test("List webhook endpoints")
    func listWebhookEndpoints() throws {
        let request = Stripe.WebhookEndpoint.List.Request(
            limit: 25,
            startingAfter: "we_123"
        )
        let api = Stripe.WebhookEndpoint.API.list(request: request)
        
        let url = router.url(for: api)
        #expect(url.path == "/v1/webhook_endpoints")
        #expect(url.query?.contains("limit=25") == true)
        #expect(url.query?.contains("starting_after=we_123") == true)
        
        let urlRequest = try router.request(for: api)
        let parsed = try router.match(request: urlRequest)
        #expect(parsed.is(\.list))
    }
    
    @Test("Delete webhook endpoint")
    func deleteWebhookEndpoint() throws {
        let id = Stripe.WebhookEndpoint.ID("we_123")
        let api = Stripe.WebhookEndpoint.API.delete(id: id)
        
        let url = router.url(for: api)
        #expect(url.path == "/v1/webhook_endpoints/we_123")
        
        let request = try router.request(for: api)
        let parsed = try router.match(request: request)
        #expect(parsed == api)
    }
}
