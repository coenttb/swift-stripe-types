import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.Customers.Customer.Sessions {
    // https://docs.stripe.com/api/customer_sessions/create.md
    public enum Create {}
}

// https://docs.stripe.com/api/customer_sessions/create.md
extension Stripe.Customers.Customer.Sessions.Create {
    public struct Request: Codable, Equatable, Sendable {
        public let customer: Stripe.Customers.Customer.ID
        public let components: Stripe.Customers.Customer.Sessions.Create.Request.Components

        public init(
            customer: Stripe.Customers.Customer.ID,
            components: Stripe.Customers.Customer.Sessions.Create.Request.Components
        ) {
            self.customer = customer
            self.components = components
        }
    }
}

extension Stripe.Customers.Customer.Sessions.Create.Request {
    public enum Components: Codable, Equatable, Sendable {
        case buyButton(BuyButton)
        case paymentElement(PaymentElement)
        case pricingTable(PricingTable)

        private enum CodingKeys: String, CodingKey {
            case buyButton = "buy_button"
            case paymentElement = "payment_element"
            case pricingTable = "pricing_table"
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            switch self {
            case .buyButton(let config):
                try container.encode(config, forKey: .buyButton)
            case .paymentElement(let config):
                try container.encode(config, forKey: .paymentElement)
            case .pricingTable(let config):
                try container.encode(config, forKey: .pricingTable)
            }
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)

            let componentsFound = [
                container.contains(.buyButton),
                container.contains(.paymentElement),
                container.contains(.pricingTable),
            ].filter { $0 }

            guard componentsFound.count == 1 else {
                throw DecodingError.dataCorrupted(
                    .init(
                        codingPath: container.codingPath,
                        debugDescription: "Exactly one component must be enabled"
                    )
                )
            }

            if let buyButton = try container.decodeIfPresent(BuyButton.self, forKey: .buyButton) {
                self = .buyButton(buyButton)
            } else if let paymentElement = try container.decodeIfPresent(
                PaymentElement.self,
                forKey: .paymentElement
            ) {
                self = .paymentElement(paymentElement)
            } else if let pricingTable = try container.decodeIfPresent(
                PricingTable.self,
                forKey: .pricingTable
            ) {
                self = .pricingTable(pricingTable)
            } else {
                throw DecodingError.dataCorrupted(
                    .init(
                        codingPath: container.codingPath,
                        debugDescription: "No component found"
                    )
                )
            }
        }
    }
}

extension Stripe.Customers.Customer.Sessions.Create.Request.Components {
    public struct BuyButton: Codable, Equatable, Sendable {
        public let enabled: Bool

        public init(enabled: Bool) {
            self.enabled = enabled
        }
    }

    public struct PricingTable: Codable, Equatable, Sendable {
        public let enabled: Bool

        public init(enabled: Bool) {
            self.enabled = enabled
        }
    }

    public struct PaymentElement: Codable, Equatable, Sendable {
        public let enabled: Bool
        public let features: Features?

        public init(
            enabled: Bool,
            features: Features? = nil
        ) {
            self.enabled = enabled
            self.features = features
        }
    }
}

extension Stripe.Customers.Customer.Sessions.Create.Request.Components.PaymentElement {
    public struct Features: Codable, Equatable, Sendable {
        public let paymentMethodAllowRedisplayFilters: [AllowRedisplayFilter]?
        public let paymentMethodRedisplay: Feature?
        public let paymentMethodRedisplayLimit: Int?
        public let paymentMethodRemove: Feature?
        public let paymentMethodSave: Feature?
        public let paymentMethodSaveUsage: SaveUsage?

        private enum CodingKeys: String, CodingKey {
            case paymentMethodAllowRedisplayFilters = "payment_method_allow_redisplay_filters"
            case paymentMethodRedisplay = "payment_method_redisplay"
            case paymentMethodRedisplayLimit = "payment_method_redisplay_limit"
            case paymentMethodRemove = "payment_method_remove"
            case paymentMethodSave = "payment_method_save"
            case paymentMethodSaveUsage = "payment_method_save_usage"
        }

        public init(
            paymentMethodAllowRedisplayFilters: [AllowRedisplayFilter]? = nil,
            paymentMethodRedisplay: Feature? = nil,
            paymentMethodRedisplayLimit: Int? = nil,
            paymentMethodRemove: Feature? = nil,
            paymentMethodSave: Feature? = nil,
            paymentMethodSaveUsage: SaveUsage? = nil
        ) {
            self.paymentMethodAllowRedisplayFilters = paymentMethodAllowRedisplayFilters
            self.paymentMethodRedisplay = paymentMethodRedisplay
            self.paymentMethodRedisplayLimit = paymentMethodRedisplayLimit
            self.paymentMethodRemove = paymentMethodRemove
            self.paymentMethodSave = paymentMethodSave
            self.paymentMethodSaveUsage = paymentMethodSaveUsage
        }
    }
}

extension Stripe.Customers.Customer.Sessions.Create.Request.Components.PaymentElement.Features {
    public enum AllowRedisplayFilter: String, Codable, Sendable {
        case always
        case limited
        case unspecified
    }

    public enum Feature: String, Codable, Sendable {
        case disabled
        case enabled
    }

    public enum SaveUsage: String, Codable, Sendable {
        case offSession = "off_session"
        case onSession = "on_session"
    }
}
