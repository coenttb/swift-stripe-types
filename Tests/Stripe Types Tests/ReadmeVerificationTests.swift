import Foundation
@testable import Stripe_Types
@testable import Stripe_Customers_Types
@testable import Stripe_Payment_Intents_Types
@testable import Stripe_Types_Models
@testable import Stripe_Types_Shared
import Dependencies
import Testing

@Suite("README Code Examples Validation", .serialized)
struct ReadmeVerificationTests {

    // MARK: - Quick Start Examples

    @Test("Quick Start - Using the Types (README lines 34-51)")
    func quickStartExample() async throws {
        // Type-safe resource IDs
        let customerId: Stripe.Customers.Customer.ID = "cus_123"
        let paymentIntentId: Stripe.PaymentIntents.PaymentIntent.ID = "pi_456"

        // Verify IDs maintain their type safety
        #expect(customerId.rawValue == "cus_123")
        #expect(paymentIntentId.rawValue == "pi_456")

        // Strongly-typed requests
        let createCustomer = Stripe.Customers.Create.Request(
            email: "customer@example.com",
            name: "John Doe"
        )

        #expect(createCustomer.email == "customer@example.com")
        #expect(createCustomer.name == "John Doe")

        // Protocol-based clients for dependency injection
        await withDependencies {
            $0.stripeCustomers.create = { request in
                Stripe.Customers.Customer(
                    id: "cus_test",
                    email: request.email,
                    name: request.name
                )
            }
        } operation: {
            @Dependency(\.stripeCustomers) var customersClient
            let customer = try await customersClient.create(createCustomer)
            #expect(customer.id.rawValue == "cus_test")
            #expect(customer.email == "customer@example.com")
        }
    }

    // MARK: - Client Protocol Pattern

    @Test("Client Protocol Pattern (README lines 58-68)")
    func clientProtocolExample() async throws {
        // Verify the client protocol structure exists and is Sendable
        let _: Stripe.Customers.Client.Type = Stripe.Customers.Client.self

        // Verify client has expected methods
        await withDependencies {
            $0.stripeCustomers.create = { _ in
                Stripe.Customers.Customer(id: "cus_test")
            }
            $0.stripeCustomers.retrieve = { _ in
                Stripe.Customers.Customer(id: "cus_test")
            }
            $0.stripeCustomers.update = { _, _ in
                Stripe.Customers.Customer(id: "cus_test")
            }
            $0.stripeCustomers.list = { _ in
                Stripe.Customers.List.Response(
                    object: "list",
                    url: "/v1/customers",
                    hasMore: false,
                    data: []
                )
            }
            $0.stripeCustomers.delete = { _ in
                Stripe.DeletedObject(id: "cus_test", object: "customer", deleted: true)
            }
        } operation: {
            @Dependency(\.stripeCustomers) var customersClient

            let createRequest = Stripe.Customers.Create.Request()
            _ = try await customersClient.create(createRequest)

            let customerId: Stripe.Customers.Customer.ID = "cus_test"
            _ = try await customersClient.retrieve(customerId)

            let updateRequest = Stripe.Customers.Update.Request()
            _ = try await customersClient.update(customerId, updateRequest)

            let listRequest = Stripe.Customers.List.Request()
            _ = try await customersClient.list(listRequest)

            _ = try await customersClient.delete(customerId)
        }
    }

    // MARK: - Type Safety with Tagged IDs

    @Test("Type Safety with Tagged IDs (README lines 132-139)")
    func typeSafetyExample() async throws {
        // Can't accidentally mix IDs
        let customerId: Stripe.Customers.Customer.ID = "cus_123"
        let productId: Stripe.Products.Product.ID = "prod_456"

        // Verify the IDs are different types
        #expect(customerId.rawValue == "cus_123")
        #expect(productId.rawValue == "prod_456")

        await withDependencies {
            $0.stripeCustomers.retrieve = { id in
                #expect(id == customerId)
                return Stripe.Customers.Customer(id: id)
            }
        } operation: {
            @Dependency(\.stripeCustomers) var customersClient

            // This compiles - correct usage
            let customer = try await customersClient.retrieve(customerId)
            #expect(customer.id == customerId)

            // The following would NOT compile (type safety at work):
            // customersClient.retrieve(productId) // ❌ Error: Cannot convert Product.ID to Customer.ID
        }
    }

    // MARK: - Request/Response Pattern

    @Test("Request/Response Pattern (README lines 146-164)")
    func requestResponsePatternExample() async throws {
        // Verify Create.Request structure exists
        let createRequest = Stripe.Customers.Create.Request(
            email: "test@example.com",
            name: "Test User"
        )

        #expect(createRequest.email == "test@example.com")
        #expect(createRequest.name == "Test User")

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
    }

    // MARK: - URL Routing

    @Test("URL Routing Pattern (README lines 171-183)")
    func urlRoutingExample() async throws {
        // Verify Router exists and conforms to expected protocols
        let _: Stripe.Customers.API.Router.Type = Stripe.Customers.API.Router.self

        // Verify API enum has expected cases
        let createAPI = Stripe.Customers.API.create(request: Stripe.Customers.Create.Request())
        let retrieveAPI = Stripe.Customers.API.retrieve(id: "cus_123")
        let updateAPI = Stripe.Customers.API.update(
            id: "cus_123",
            request: Stripe.Customers.Update.Request()
        )
        let listAPI = Stripe.Customers.API.list(request: Stripe.Customers.List.Request())
        let deleteAPI = Stripe.Customers.API.delete(id: "cus_123")

        // Verify API cases are Equatable
        #expect(createAPI == createAPI)
        #expect(retrieveAPI == retrieveAPI)
        #expect(updateAPI == updateAPI)
        #expect(listAPI == listAPI)
        #expect(deleteAPI == deleteAPI)
    }

    // MARK: - Testing Pattern

    @Test("Testing Pattern with Mock Implementations (README lines 194-208)")
    func testingPatternExample() async throws {
        // Example from README showing how to test with mock implementations
        await withDependencies {
            $0.stripeCustomers.create = { request in
                // Return mock customer
                Stripe.Customers.Customer(
                    id: "cus_test",
                    email: request.email,
                    name: request.name
                )
            }
        } operation: {
            @Dependency(\.stripeCustomers) var customersClient

            // Test code
            let request = Stripe.Customers.Create.Request(
                email: "test@example.com",
                name: "Test User"
            )
            let customer = try await customersClient.create(request)

            #expect(customer.id.rawValue == "cus_test")
            #expect(customer.email == "test@example.com")
            #expect(customer.name == "Test User")
        }
    }

    // MARK: - Architecture Validation

    @Test("Verify all types are Sendable and Codable")
    func typeConformanceValidation() async throws {
        // Verify Customer model conforms to required protocols
        let _: any Sendable = Stripe.Customers.Customer(id: "cus_test")
        let _: any Codable = Stripe.Customers.Customer(id: "cus_test")

        // Verify Request types conform
        let _: any Sendable = Stripe.Customers.Create.Request()
        let _: any Codable = Stripe.Customers.Create.Request()
        let _: any Equatable = Stripe.Customers.Create.Request()

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
        // (This test validates the type system is working correctly)
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
}
