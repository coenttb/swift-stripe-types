import Foundation
@testable import Stripe_Confirmation_Token_Types
@testable import Stripe_Types_Models
import Stripe_Types_Shared
import Testing
import URLRouting
import Tagged

@Suite("Confirmation Token Router Tests")
struct ConfirmationTokenRouterTests {
    let router = Stripe.ConfirmationTokenAPI.Router()
    
    @Test("Retrieve confirmation token URL generation")
    func testRetrieveURL() throws {
        let id = ConfirmationToken.ID("cfrm_1234567890")
        let api = Stripe.ConfirmationTokenAPI.retrieve(id: id)
        
        let url = router.url(for: api)
        
        #expect(url.path == "/v1/confirmation_tokens/cfrm_1234567890")
    }
    
    @Test("Parse retrieve confirmation token URL")
    func testParseRetrieveURL() throws {
        let id = ConfirmationToken.ID("cfrm_test123")
        let api = Stripe.ConfirmationTokenAPI.retrieve(id: id)
        let request = try router.request(for: api)
        
        let parsedAPI = try router.match(request: request)
        
        guard case let .retrieve(parsedId) = parsedAPI else {
            Issue.record("Expected retrieve case")
            return
        }
        #expect(parsedid == "cfrm_test123")
    }
    
    @Test("Round-trip URL parsing")
    func testRoundTrip() throws {
        let original = Stripe.ConfirmationTokenAPI.retrieve(id: ConfirmationToken.ID("cfrm_roundtrip"))
        let request = try router.request(for: original)
        let parsed = try router.match(request: request)
        
        #expect(parsed == original)
    }
}
