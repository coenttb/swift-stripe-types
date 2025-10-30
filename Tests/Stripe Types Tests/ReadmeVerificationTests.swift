import Foundation
@testable import Stripe_Types
@testable import Stripe_Customers_Types
@testable import Stripe_Payment_Intents_Types
@testable import Stripe_Types_Models
@testable import Stripe_Types_Shared
import Testing
import URLRouting

@Suite("README Code Examples Validation", .serialized)
struct ReadmeVerificationTests {

    // MARK: - Quick Start Examples (README lines 34-51)

    @Test("Quick Start - Type-safe resource IDs (README lines 40-41)")
    func quickStartResourceIDsExample() async throws {
        // Type-safe resource IDs
        let customerId: Stripe.Customers.Customer.ID = "cus_123"
        let paymentIntentId: Stripe.PaymentIntents.PaymentIntent.ID = "pi_456"

        // Verify IDs maintain their type safety
        #expect(customerId.rawValue == "cus_123")
        #expect(paymentIntentId.rawValue == "pi_456")
    }

    @Test("Quick Start - Strongly-typed requests (README lines 44-47)")
    func quickStartRequestExample() async throws {
        // Strongly-typed requests
        let createCustomer = Stripe.Customers.Create.Request(
            email: "customer@example.com",
            name: "John Doe"
        )

        #expect(createCustomer.email == "customer@example.com")
        #expect(createCustomer.name == "John Doe")
    }

    @Test("Quick Start - Client protocol verification (README line 50)")
    func quickStartClientProtocolExample() async throws {
        // Client protocol definition (implementations in swift-stripe-live)
        let _: Stripe.Customers.Client.Type = Stripe.Customers.Client.self

        // Verify the protocol exists and is properly typed
        #expect(Stripe.Customers.Client.self is any Sendable.Type)
    }

    // MARK: - Client Protocol Pattern (README lines 58-68)

    @Test("Client Protocol Structure (README lines 58-68)")
    func clientProtocolStructureExample() async throws {
        // Verify the client protocol structure exists as documented
        let _: Stripe.Customers.Client.Type = Stripe.Customers.Client.self

        // Create a test client to verify the interface
        let testClient = Stripe.Customers.Client(
            create: { _ in Stripe.Customers.Customer(id: "cus_test", object: "customer", created: Date()) },
            retrieve: { _ in Stripe.Customers.Customer(id: "cus_test", object: "customer", created: Date()) },
            update: { _, _ in Stripe.Customers.Customer(id: "cus_test", object: "customer", created: Date()) },
            list: { _ in
                Stripe.Customers.List.Response(
                    object: "list",
                    url: "/v1/customers",
                    hasMore: false,
                    data: []
                )
            },
            delete: { _ in Stripe.DeletedObject(id: "cus_test", object: "customer", deleted: true) }
        )

        // Verify methods exist and can be called
        let createRequest = Stripe.Customers.Create.Request()
        _ = try await testClient.create(createRequest)
    }

    // MARK: - Type Safety with Tagged IDs (README lines 132-139)

    @Test("Type Safety with Tagged IDs (README lines 132-139)")
    func typeSafetyExample() async throws {
        // Can't accidentally mix IDs
        let customerId: Stripe.Customers.Customer.ID = "cus_123"
        let productId: Stripe.Products.Product.ID = "prod_456"

        // Verify the IDs are different types
        #expect(customerId.rawValue == "cus_123")
        #expect(productId.rawValue == "prod_456")

        // Verify they're different types at compile time
        #expect(type(of: customerId) != type(of: productId))

        // This demonstrates the compile-time safety:
        // customersClient.retrieve(productId) would not compile
    }

    // MARK: - Request/Response Pattern (README lines 146-164)

    @Test("Request/Response Pattern - Create.Request (README lines 146-150)")
    func requestResponseCreatePatternExample() async throws {
        // Verify Create.Request structure exists as documented
        let createRequest = Stripe.Customers.Create.Request(
            email: "test@example.com",
            name: "Test User"
        )

        #expect(createRequest.email == "test@example.com")
        #expect(createRequest.name == "Test User")

        // Verify Codable conformance
        let _: any Codable = createRequest
        let _: any Equatable = createRequest
        let _: any Sendable = createRequest
    }

    @Test("Request/Response Pattern - List types (README lines 152-163)")
    func requestResponseListPatternExample() async throws {
        // Verify List.Request and List.Response structures exist
        let listRequest = Stripe.Customers.List.Request()
        #expect(listRequest != nil)

        let listResponse = Stripe.Customers.List.Response(
            object: "list",
            url: "/v1/customers",
            hasMore: false,
            data: []
        )

        #expect(listResponse.object == "list")
        #expect(listResponse.url == "/v1/customers")
        #expect(listResponse.hasMore == false)
        #expect(listResponse.data.isEmpty)

        // Verify Sendable conformance
        let _: any Sendable = listResponse
    }

    // MARK: - URL Routing (README lines 171-183)

    @Test("URL Routing Pattern (README lines 171-183)")
    func urlRoutingExample() async throws {
        // Verify Router exists and conforms to expected protocols
        let router = Stripe.Customers.API.Router()

        // Verify API enum has expected cases
        let createAPI = Stripe.Customers.API.create(
            request: Stripe.Customers.Create.Request()
        )
        let retrieveAPI = Stripe.Customers.API.retrieve(id: "cus_123")
        let updateAPI = Stripe.Customers.API.update(
            id: "cus_123",
            request: Stripe.Customers.Update.Request()
        )
        let listAPI = Stripe.Customers.API.list(
            request: Stripe.Customers.List.Request()
        )
        let deleteAPI = Stripe.Customers.API.delete(id: "cus_123")

        // Verify API cases are Equatable
        #expect(createAPI == createAPI)
        #expect(retrieveAPI == retrieveAPI)
        #expect(updateAPI == updateAPI)
        #expect(listAPI == listAPI)
        #expect(deleteAPI == deleteAPI)

        // Verify router can generate URLs
        let url = router.url(for: retrieveAPI)
        #expect(url.path == "/v1/customers/cus_123")
    }

    // MARK: - Testing Pattern (README lines 189-221)

    @Test("Testing Pattern with Mock Client (README lines 189-221)")
    func testingPatternExample() async throws {
        // Example from README showing how to test with mock implementations
        struct TestError: Error {}

        let mockClient = Stripe.Customers.Client(
            create: { request in
                // Return mock customer
                Stripe.Customers.Customer(
                    id: "cus_test",
                    email: request.email,
                    name: request.name,
                    object: "customer",
                    created: Date()
                )
            },
            retrieve: { _ in throw TestError() },
            update: { _, _ in throw TestError() },
            list: { _ in throw TestError() },
            delete: { _ in throw TestError() }
        )

        // Test with mock
        let request = Stripe.Customers.Create.Request(
            email: "test@example.com",
            name: "Test User"
        )
        let customer = try await mockClient.create(request)
        #expect(customer.id.rawValue == "cus_test")
        #expect(customer.email == "test@example.com")
        #expect(customer.name == "Test User")
    }

    // MARK: - Architecture Validation

    @Test("Verify all types are Sendable and Codable")
    func typeConformanceValidation() async throws {
        // Verify Customer model conforms to required protocols
        let customer = Stripe.Customers.Customer(id: "cus_test", object: "customer", created: Date())
        let _: any Sendable = customer
        let _: any Codable = customer

        // Verify Request types conform
        let createRequest = Stripe.Customers.Create.Request()
        let _: any Sendable = createRequest
        let _: any Codable = createRequest
        let _: any Equatable = createRequest

        // Verify Response types conform
        let response = Stripe.Customers.List.Response(
            object: "list",
            url: "/v1/customers",
            hasMore: false,
            data: []
        )
        let _: any Sendable = response
        let _: any Codable = response
    }

    @Test("Verify Tagged ID type safety")
    func taggedIDValidation() async throws {
        // Create typed IDs
        let customerId: Stripe.Customers.Customer.ID = "cus_123"
        let paymentIntentId: Stripe.PaymentIntents.PaymentIntent.ID = "pi_456"

        // Verify they're different types at compile time
        #expect(type(of: customerId) != type(of: paymentIntentId))

        // Verify raw values are accessible
        #expect(customerId.rawValue == "cus_123")
        #expect(paymentIntentId.rawValue == "pi_456")

        // Verify equality works
        let customerId2: Stripe.Customers.Customer.ID = "cus_123"
        #expect(customerId == customerId2)

        let differentId: Stripe.Customers.Customer.ID = "cus_456"
        #expect(customerId != differentId)
    }

    @Test("Verify Router functionality matches documentation")
    func routerFunctionalityValidation() async throws {
        let router = Stripe.Customers.API.Router()

        // Test URL generation
        let id = Stripe.Customers.Customer.ID(rawValue: "cus_123")
        let api: Stripe.Customers.API = .retrieve(id: id)

        let url = router.url(for: api)
        #expect(url.path == "/v1/customers/cus_123")

        // Test round-trip matching
        let request = try router.request(for: api)
        let matched = try router.match(request: request)
        #expect(matched.is(\.retrieve))
        #expect(matched.retrieve == id)
    }
}
