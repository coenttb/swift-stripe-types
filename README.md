# swift-stripe-types

[![Swift](https://img.shields.io/badge/Swift-6.0-orange.svg)](https://swift.org)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE.md)
[![Version](https://img.shields.io/badge/version-0.1.0-green.svg)](https://github.com/coenttb/swift-stripe-types/releases)

Comprehensive type definitions for Stripe's API in Swift, providing complete type safety and compile-time guarantees.

## Overview

`swift-stripe-types` provides strongly-typed definitions for Stripe's REST API with:

- 🎯 **Type Safety**: Tagged IDs prevent mixing different resource identifiers
- 📦 **48 Modules Implemented**: Complete coverage of essential Stripe features
- 🔌 **Protocol-Based**: Clean separation between types and implementations
- ⚡ **Swift 6.0**: Full concurrency support with Sendable conformance
- 🧪 **Testable**: Dependency injection via swift-dependencies
- 📄 **Apache 2.0**: Maximum compatibility for all projects

## Installation

Add to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/coenttb/swift-stripe-types", from: "0.1.0")
]
```

## Quick Start

### Using the Types

```swift
import StripeTypes
import StripeCustomersTypes
import StripePaymentIntentsTypes

// Type-safe resource IDs
let customerId: Stripe.Customers.Customer.ID = "cus_123"
let paymentIntentId: Stripe.PaymentIntents.PaymentIntent.ID = "pi_456"

// Strongly-typed requests
let createCustomer = Stripe.Customers.Create.Request(
    email: "customer@example.com",
    name: "John Doe"
)

// Client definition (implementations in swift-stripe-live)
let client: Stripe.Customers.Client = Stripe.Customers.Client(...)
```

### Client

Every Stripe resource has a corresponding client:

```swift
extension Stripe.Customers {
    @DependencyClient
    public struct Client: Sendable {
        public var create: @Sendable (Create.Request) async throws -> Stripe.Customer
        public var retrieve: @Sendable (Stripe.Customer.ID) async throws -> Stripe.Customer
        public var update: @Sendable (Stripe.Customer.ID, Update.Request) async throws -> Stripe.Customer
        public var list: @Sendable (List.Request) async throws -> List.Response
        public var delete: @Sendable (Stripe.Customer.ID) async throws -> DeletedObject
    }
}
```

## Implemented Modules (48)

### Core Payment Processing ✅
- **Customers**: Full customer management
- **Payment Intents**: Modern payment flows with SCA support
- **Payment Methods**: Cards, bank accounts, and alternative payment methods
- **Setup Intents**: Save payment methods for future use
- **Charges**: Direct charge creation and management
- **Refunds**: Full and partial refund handling
- **Disputes**: Chargeback management
- **Tokens**: Tokenization for secure data handling

### Billing & Subscriptions ✅
- **Subscriptions**: Complete recurring billing
- **Invoices**: Invoice generation and management
- **Invoice Items & Line Items**: Detailed invoice composition
- **Plans & Prices**: Flexible pricing models
- **Credit Notes**: Credit and refund tracking
- **Quotes**: Sales quotes and proposals
- **Meters & Usage**: Usage-based billing
- **Test Clocks**: Time simulation for testing
- **Customer Portal**: Self-service configuration

### Products & Commerce ✅
- **Products**: Product catalog management
- **Prices**: Dynamic pricing configuration
- **Coupons**: Discount coupons
- **Promotion Codes**: Customer-facing discount codes
- **Tax Rates**: Tax configuration
- **Shipping Rates**: Shipping cost management

### Platform & Connect ✅
- **Accounts**: Connected account management
- **Account Links**: Onboarding flows
- **Transfers**: Fund transfers
- **Transfer Reversals**: Reversal operations
- **Application Fees**: Platform fee collection

### Additional Features ✅
- **Balance & Transactions**: Account balance tracking
- **Events**: Webhook event types
- **Files & File Links**: File upload and sharing
- **Payouts**: Bank transfers
- **Customer Sessions**: Frontend authentication
- **Confirmation Tokens**: Payment confirmation
- **Mandates**: Payment authorizations

### Specialized Features ✅
- **Terminal**: Readers and Locations for in-person payments
- **Tax Calculations**: Real-time tax computation
- **Capital**: Financing offers and summaries
- **Fraud**: Reviews, early warnings, and value lists
- **Webhook Endpoints**: Endpoint configuration
- **Forwarding Requests**: Request forwarding

## Architecture

### Type Safety with Tagged IDs

Every Stripe resource uses Tagged types for compile-time safety:

```swift
// Can't accidentally mix IDs
let customerId: Stripe.Customer.ID = "cus_123"
let productId: Stripe.Product.ID = "prod_456"

// This won't compile - type safety!
// customersClient.retrieve(productId) // ❌ Error: Cannot convert Product.ID to Customer.ID
customersClient.retrieve(customerId) // ✅ Correct
```

### Request/Response Pattern

All operations follow a consistent pattern:

```swift
public enum Create {
    public struct Request: Codable, Equatable, Sendable {
        // Strongly-typed request parameters
    }
}

public enum List {
    public struct Request: Codable, Equatable, Sendable {
        // Pagination and filtering
    }
    
    public struct Response: Codable, Sendable {
        public let object: String
        public let url: String
        public let hasMore: Bool
        public let data: [Model]
    }
}
```

### URL Routing

Each module includes type-safe URL routing:

```swift
public struct Router: ParserPrinter, Sendable {
    public var body: some URLRouting.Router<API> {
        OneOf {
            Route(.case(API.create)) {
                Method.post
                Path.v1.customers
                Body(.form(Create.Request.self))
            }
            // ... other routes
        }
    }
}
```

## Testing

The types are designed for easy testing with mock implementations:

```swift
import StripeCustomersTypes
import Testing

@Test
func testCustomerCreation() async throws {
    // Create a mock client
    let mockClient = Stripe.Customers.Client(
        create: { request in
            // Return mock customer
            Stripe.Customers.Customer(
                id: "cus_test",
                email: request.email,
                name: request.name
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
}

struct TestError: Error {}
```

## Related Packages

- [swift-stripe](https://github.com/coenttb/swift-stripe): The Swift library for the Stripe API.
- [swift-stripe-live](https://github.com/coenttb/swift-stripe-live): A Swift package with live implementations for the Stripe API.
- [swift-types-foundation](https://github.com/coenttb/swift-types-foundation): A Swift package bundling essential type-safe packages for domain modeling.

## Requirements

- Swift 6.0+
- macOS 14+ / iOS 17+ / Linux

## Documentation

Comprehensive documentation available in:
- Source code documentation
- [Stripe API Reference](https://docs.stripe.com/api)
- Example implementations in tests

## License

This package is licensed under the Apache 2.0 License. See [LICENSE.md](LICENSE.md) for details.

The Apache 2.0 license provides maximum compatibility, allowing use in both open source and commercial projects.

## Support

For issues, questions, or contributions, please visit the [GitHub repository](https://github.com/coenttb/swift-stripe-types).
