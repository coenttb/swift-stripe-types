//
//  File.swift
//  swift-stripe-types
//
//  Created by Coen ten Thije Boonkkamp on 04/01/2025.
//

import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.PaymentIntents {
    // https://docs.stripe.com/api/payment_intents/create.md
    public enum Create {}
    // https://docs.stripe.com/api/payment_intents/update.md
    public enum Update {}
    // https://docs.stripe.com/api/payment_intents/confirm.md
    public enum Confirm {}
    // https://docs.stripe.com/api/payment_intents/capture.md
    public enum Capture {}
    // https://docs.stripe.com/api/payment_intents/cancel.md
    public enum Cancel {}
    // https://docs.stripe.com/api/payment_intents/list.md
    public enum List {}
    // https://docs.stripe.com/api/payment_intents/search.md
    public enum Search {}
    // https://docs.stripe.com/api/payment_intents/increment_authorization.md
    public enum IncrementAuthorization {}
    // https://docs.stripe.com/api/payment_intents/verify_microdeposits.md
    public enum VerifyMicrodeposits {}
}

extension Stripe.PaymentIntents {
    public struct Shipping: Codable, Equatable, Sendable {
        public let address: Address
        public let carrier: String?
        public let name: String
        public let phone: String?
        public let trackingNumber: String?
        
        private enum CodingKeys: String, CodingKey {
            case address
            case carrier
            case name
            case phone
            case trackingNumber = "tracking_number"
        }
        
        public init(
            address: Address,
            carrier: String? = nil,
            name: String,
            phone: String? = nil,
            trackingNumber: String? = nil
        ) {
            self.address = address
            self.carrier = carrier
            self.name = name
            self.phone = phone
            self.trackingNumber = trackingNumber
        }
    }
}

// https://docs.stripe.com/api/payment_intents/create.md
extension Stripe.PaymentIntents.Create {
    // Radar fraud prevention options
    public struct RadarOptions: Codable, Equatable, Sendable {
        public let session: String?
        
        public init(session: String? = nil) {
            self.session = session
        }
    }
    
    // Transfer data for connected accounts
    public struct TransferData: Codable, Equatable, Sendable {
        public let amount: Int?
        public let destination: String
        
        public init(amount: Int? = nil, destination: String) {
            self.amount = amount
            self.destination = destination
        }
    }
    
    // Mandate data for setting up future payments
    public struct MandateData: Codable, Equatable, Sendable {
        public let customerAcceptance: CustomerAcceptance
        
        private enum CodingKeys: String, CodingKey {
            case customerAcceptance = "customer_acceptance"
        }
        
        public init(customerAcceptance: CustomerAcceptance) {
            self.customerAcceptance = customerAcceptance
        }
        
        public struct CustomerAcceptance: Codable, Equatable, Sendable {
            public let type: AcceptanceType
            public let acceptedAt: Date?
            public let offline: OfflineAcceptance?
            public let online: OnlineAcceptance?
            
            private enum CodingKeys: String, CodingKey {
                case type
                case acceptedAt = "accepted_at"
                case offline
                case online
            }
            
            public init(
                type: AcceptanceType,
                acceptedAt: Date? = nil,
                offline: OfflineAcceptance? = nil,
                online: OnlineAcceptance? = nil
            ) {
                self.type = type
                self.acceptedAt = acceptedAt
                self.offline = offline
                self.online = online
            }
            
            public enum AcceptanceType: String, Codable, Sendable {
                case online
                case offline
            }
            
            public struct OfflineAcceptance: Codable, Equatable, Sendable {
                // Offline acceptance details if needed
                public init() {}
            }
            
            public struct OnlineAcceptance: Codable, Equatable, Sendable {
                public let ipAddress: String
                public let userAgent: String
                
                private enum CodingKeys: String, CodingKey {
                    case ipAddress = "ip_address"
                    case userAgent = "user_agent"
                }
                
                public init(ipAddress: String, userAgent: String) {
                    self.ipAddress = ipAddress
                    self.userAgent = userAgent
                }
            }
        }
    }
    
    public struct Request: Codable, Equatable, Sendable {
        public let amount: Int
        public let currency: Stripe.Currency
        public let automaticPaymentMethods: Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent.Automatic.Payment.Methods?
        public let confirm: Bool?
        public let customer: Stripe.Customers.Customer.ID?
        public let description: String?
        public let metadata: [String: String]?
        public let offSession: Bool?
        public let paymentMethod: Stripe.PaymentMethods.PaymentMethod.ID?
        public let receiptEmail: String?
        public let setupFutureUsage: Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent.SetupFutureUsage?
        public let shipping: Stripe.PaymentIntents.Shipping?
        public let statementDescriptor: Stripe.StatementDescriptor?
        public let statementDescriptorSuffix: String?
        public let applicationFeeAmount: Int?
        public let captureMethod: Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent.Capture.Method?
        public let confirmationMethod: Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent.Confirmation.Method?
        public let confirmationToken: String?
        public let errorOnRequiresAction: Bool?
        public let mandate: Stripe.Mandates.Mandate.ID?
        public let mandateData: MandateData?
        public let onBehalfOf: String?
        public let paymentMethodConfiguration: String?
        public let paymentMethodData: Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent.Payment.Method.Options?
        public let paymentMethodOptions: Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent.Payment.Method.Options?
        public let paymentMethodTypes: [String]?
        public let radarOptions: RadarOptions?
        public let returnUrl: String?
        public let transferData: TransferData?
        public let transferGroup: String?
        public let useStripeSdk: Bool?

        private enum CodingKeys: String, CodingKey {
            case amount
            case currency
            case automaticPaymentMethods = "automatic_payment_methods"
            case confirm
            case customer
            case description
            case metadata
            case offSession = "off_session"
            case paymentMethod = "payment_method"
            case receiptEmail = "receipt_email"
            case setupFutureUsage = "setup_future_usage"
            case shipping
            case statementDescriptor = "statement_descriptor"
            case statementDescriptorSuffix = "statement_descriptor_suffix"
            case applicationFeeAmount = "application_fee_amount"
            case captureMethod = "capture_method"
            case confirmationMethod = "confirmation_method"
            case confirmationToken = "confirmation_token"
            case errorOnRequiresAction = "error_on_requires_action"
            case mandate
            case mandateData = "mandate_data"
            case onBehalfOf = "on_behalf_of"
            case paymentMethodConfiguration = "payment_method_configuration"
            case paymentMethodData = "payment_method_data"
            case paymentMethodOptions = "payment_method_options"
            case paymentMethodTypes = "payment_method_types"
            case radarOptions = "radar_options"
            case returnUrl = "return_url"
            case transferData = "transfer_data"
            case transferGroup = "transfer_group"
            case useStripeSdk = "use_stripe_sdk"
        }

        public init(
            amount: Int,
            currency: Stripe.Currency,
            automaticPaymentMethods: Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent.Automatic.Payment.Methods? = nil,
            confirm: Bool? = nil,
            customer: Stripe.Customers.Customer.ID? = nil,
            description: String? = nil,
            metadata: [String: String]? = nil,
            offSession: Bool? = nil,
            paymentMethod: Stripe.PaymentMethods.PaymentMethod.ID? = nil,
            receiptEmail: String? = nil,
            setupFutureUsage: Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent.SetupFutureUsage? = nil,
            shipping: Stripe.PaymentIntents.Shipping? = nil,
            statementDescriptor: Stripe.StatementDescriptor? = nil,
            statementDescriptorSuffix: String? = nil,
            applicationFeeAmount: Int? = nil,
            captureMethod: Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent.Capture.Method? = nil,
            confirmationMethod: Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent.Confirmation.Method? = nil,
            confirmationToken: String? = nil,
            errorOnRequiresAction: Bool? = nil,
            mandate: Stripe.Mandates.Mandate.ID? = nil,
            mandateData: MandateData? = nil,
            onBehalfOf: String? = nil,
            paymentMethodConfiguration: String? = nil,
            paymentMethodData: Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent.Payment.Method.Options? = nil,
            paymentMethodOptions: Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent.Payment.Method.Options? = nil,
            paymentMethodTypes: [String]? = nil,
            radarOptions: RadarOptions? = nil,
            returnUrl: String? = nil,
            transferData: TransferData? = nil,
            transferGroup: String? = nil,
            useStripeSdk: Bool? = nil
        ) {
            self.amount = amount
            self.currency = currency
            self.automaticPaymentMethods = automaticPaymentMethods
            self.confirm = confirm
            self.customer = customer
            self.description = description
            self.metadata = metadata
            self.offSession = offSession
            self.paymentMethod = paymentMethod
            self.receiptEmail = receiptEmail
            self.setupFutureUsage = setupFutureUsage
            self.shipping = shipping
            self.statementDescriptor = statementDescriptor
            self.statementDescriptorSuffix = statementDescriptorSuffix
            self.applicationFeeAmount = applicationFeeAmount
            self.captureMethod = captureMethod
            self.confirmationMethod = confirmationMethod
            self.confirmationToken = confirmationToken
            self.errorOnRequiresAction = errorOnRequiresAction
            self.mandate = mandate
            self.mandateData = mandateData
            self.onBehalfOf = onBehalfOf
            self.paymentMethodConfiguration = paymentMethodConfiguration
            self.paymentMethodData = paymentMethodData
            self.paymentMethodOptions = paymentMethodOptions
            self.paymentMethodTypes = paymentMethodTypes
            self.radarOptions = radarOptions
            self.returnUrl = returnUrl
            self.transferData = transferData
            self.transferGroup = transferGroup
            self.useStripeSdk = useStripeSdk
        }
    }
}

// https://docs.stripe.com/api/payment_intents/update.md
extension Stripe.PaymentIntents.Update {
    public struct Request: Codable, Equatable, Sendable {
        public let amount: Int?
        public let currency: Stripe.Currency?
        public let customer: Stripe.Customers.Customer.ID?
        public let description: String?
        public let metadata: [String: String]?
        public let paymentMethod: Stripe.PaymentMethods.PaymentMethod.ID?
        public let receiptEmail: String?
        public let setupFutureUsage: Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent.SetupFutureUsage?
        public let shipping: Stripe.PaymentIntents.Shipping?
        public let statementDescriptor: Stripe.StatementDescriptor?
        public let statementDescriptorSuffix: String?
        public let applicationFeeAmount: Int?
        public let captureMethod: Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent.Capture.Method?
        public let paymentMethodData: Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent.Payment.Method.Options?
        public let paymentMethodOptions: Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent.Payment.Method.Options?
        public let paymentMethodTypes: [String]?
        public let transferGroup: String?

        private enum CodingKeys: String, CodingKey {
            case amount
            case currency
            case customer
            case description
            case metadata
            case paymentMethod = "payment_method"
            case receiptEmail = "receipt_email"
            case setupFutureUsage = "setup_future_usage"
            case shipping
            case statementDescriptor = "statement_descriptor"
            case statementDescriptorSuffix = "statement_descriptor_suffix"
            case applicationFeeAmount = "application_fee_amount"
            case captureMethod = "capture_method"
            case paymentMethodData = "payment_method_data"
            case paymentMethodOptions = "payment_method_options"
            case paymentMethodTypes = "payment_method_types"
            case transferGroup = "transfer_group"
        }

        public init(
            amount: Int? = nil,
            currency: Stripe.Currency? = nil,
            customer: Stripe.Customers.Customer.ID? = nil,
            description: String? = nil,
            metadata: [String: String]? = nil,
            paymentMethod: Stripe.PaymentMethods.PaymentMethod.ID? = nil,
            receiptEmail: String? = nil,
            setupFutureUsage: Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent.SetupFutureUsage? = nil,
            shipping: Stripe.PaymentIntents.Shipping? = nil,
            statementDescriptor: Stripe.StatementDescriptor? = nil,
            statementDescriptorSuffix: String? = nil,
            applicationFeeAmount: Int? = nil,
            captureMethod: Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent.Capture.Method? = nil,
            paymentMethodData: Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent.Payment.Method.Options? = nil,
            paymentMethodOptions: Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent.Payment.Method.Options? = nil,
            paymentMethodTypes: [String]? = nil,
            transferGroup: String? = nil
        ) {
            self.amount = amount
            self.currency = currency
            self.customer = customer
            self.description = description
            self.metadata = metadata
            self.paymentMethod = paymentMethod
            self.receiptEmail = receiptEmail
            self.setupFutureUsage = setupFutureUsage
            self.shipping = shipping
            self.statementDescriptor = statementDescriptor
            self.statementDescriptorSuffix = statementDescriptorSuffix
            self.applicationFeeAmount = applicationFeeAmount
            self.captureMethod = captureMethod
            self.paymentMethodData = paymentMethodData
            self.paymentMethodOptions = paymentMethodOptions
            self.paymentMethodTypes = paymentMethodTypes
            self.transferGroup = transferGroup
        }
    }
}

// https://docs.stripe.com/api/payment_intents/confirm.md
extension Stripe.PaymentIntents.Confirm {
    // Use the same MandateData type from Create
    public typealias MandateData = Stripe.PaymentIntents.Create.MandateData
    public typealias RadarOptions = Stripe.PaymentIntents.Create.RadarOptions
    
    public struct Request: Codable, Equatable, Sendable {
        public let paymentMethod: Stripe.PaymentMethods.PaymentMethod.ID?
        public let receiptEmail: String?
        public let setupFutureUsage: Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent.SetupFutureUsage?
        public let shipping: Stripe.PaymentIntents.Shipping?
        public let captureMethod: Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent.Capture.Method?
        public let confirmationToken: String?
        public let errorOnRequiresAction: Bool?
        public let mandate: Stripe.Mandates.Mandate.ID?
        public let mandateData: MandateData?
        public let offSession: Bool?
        public let paymentMethodData: Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent.Payment.Method.Options?
        public let paymentMethodOptions: Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent.Payment.Method.Options?
        public let paymentMethodTypes: [String]?
        public let radarOptions: RadarOptions?
        public let returnUrl: String?

        private enum CodingKeys: String, CodingKey {
            case paymentMethod = "payment_method"
            case receiptEmail = "receipt_email"
            case setupFutureUsage = "setup_future_usage"
            case shipping
            case captureMethod = "capture_method"
            case confirmationToken = "confirmation_token"
            case errorOnRequiresAction = "error_on_requires_action"
            case mandate
            case mandateData = "mandate_data"
            case offSession = "off_session"
            case paymentMethodData = "payment_method_data"
            case paymentMethodOptions = "payment_method_options"
            case paymentMethodTypes = "payment_method_types"
            case radarOptions = "radar_options"
            case returnUrl = "return_url"
        }

        public init(
            paymentMethod: Stripe.PaymentMethods.PaymentMethod.ID? = nil,
            receiptEmail: String? = nil,
            setupFutureUsage: Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent.SetupFutureUsage? = nil,
            shipping: Stripe.PaymentIntents.Shipping? = nil,
            captureMethod: Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent.Capture.Method? = nil,
            confirmationToken: String? = nil,
            errorOnRequiresAction: Bool? = nil,
            mandate: Stripe.Mandates.Mandate.ID? = nil,
            mandateData: MandateData? = nil,
            offSession: Bool? = nil,
            paymentMethodData: Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent.Payment.Method.Options? = nil,
            paymentMethodOptions: Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent.Payment.Method.Options? = nil,
            paymentMethodTypes: [String]? = nil,
            radarOptions: RadarOptions? = nil,
            returnUrl: String? = nil
        ) {
            self.paymentMethod = paymentMethod
            self.receiptEmail = receiptEmail
            self.setupFutureUsage = setupFutureUsage
            self.shipping = shipping
            self.captureMethod = captureMethod
            self.confirmationToken = confirmationToken
            self.errorOnRequiresAction = errorOnRequiresAction
            self.mandate = mandate
            self.mandateData = mandateData
            self.offSession = offSession
            self.paymentMethodData = paymentMethodData
            self.paymentMethodOptions = paymentMethodOptions
            self.paymentMethodTypes = paymentMethodTypes
            self.radarOptions = radarOptions
            self.returnUrl = returnUrl
        }
    }
}

// https://docs.stripe.com/api/payment_intents/capture.md
extension Stripe.PaymentIntents.Capture {
    // TransferData for capture operation
    public struct TransferData: Codable, Equatable, Sendable {
        public let amount: Int?
        
        public init(amount: Int? = nil) {
            self.amount = amount
        }
    }
    
    public struct Request: Codable, Equatable, Sendable {
        public let amountToCapture: Int?
        public let applicationFeeAmount: Int?
        public let finalCapture: Bool?
        public let metadata: [String: String]?
        public let statementDescriptor: Stripe.StatementDescriptor?
        public let statementDescriptorSuffix: String?
        public let transferData: TransferData?

        private enum CodingKeys: String, CodingKey {
            case amountToCapture = "amount_to_capture"
            case applicationFeeAmount = "application_fee_amount"
            case finalCapture = "final_capture"
            case metadata
            case statementDescriptor = "statement_descriptor"
            case statementDescriptorSuffix = "statement_descriptor_suffix"
            case transferData = "transfer_data"
        }

        public init(
            amountToCapture: Int? = nil,
            applicationFeeAmount: Int? = nil,
            finalCapture: Bool? = nil,
            metadata: [String: String]? = nil,
            statementDescriptor: Stripe.StatementDescriptor? = nil,
            statementDescriptorSuffix: String? = nil,
            transferData: TransferData? = nil
        ) {
            self.amountToCapture = amountToCapture
            self.applicationFeeAmount = applicationFeeAmount
            self.finalCapture = finalCapture
            self.metadata = metadata
            self.statementDescriptor = statementDescriptor
            self.statementDescriptorSuffix = statementDescriptorSuffix
            self.transferData = transferData
        }
    }
}

// https://docs.stripe.com/api/payment_intents/cancel.md
extension Stripe.PaymentIntents.Cancel {
    public struct Request: Codable, Equatable, Sendable {
        public let cancellationReason: Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent.Cancellation.Reason?

        private enum CodingKeys: String, CodingKey {
            case cancellationReason = "cancellation_reason"
        }

        public init(cancellationReason: Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent.Cancellation.Reason? = nil) {
            self.cancellationReason = cancellationReason
        }
    }
}

// https://docs.stripe.com/api/payment_intents/list.md
extension Stripe.PaymentIntents.List {
    public struct Request: Codable, Equatable, Sendable {
        /// Only return payment intents that were created during the given date interval
        public let created: Stripe.DateFilter?
        /// Filter by customer ID
        public let customer: Stripe.Customers.Customer.ID?
        /// A cursor for use in pagination
        public let endingBefore: String?
        /// A limit on the number of objects to be returned (1-100, default 10)
        public let limit: Int?
        /// A cursor for use in pagination
        public let startingAfter: String?

        private enum CodingKeys: String, CodingKey {
            case created
            case customer
            case endingBefore = "ending_before"
            case limit
            case startingAfter = "starting_after"
        }

        public init(
            created: Stripe.DateFilter? = nil,
            customer: Stripe.Customers.Customer.ID? = nil,
            endingBefore: String? = nil,
            limit: Int? = nil,
            startingAfter: String? = nil
        ) {
            self.created = created
            self.customer = customer
            self.endingBefore = endingBefore
            self.limit = limit
            self.startingAfter = startingAfter
        }
    }

    public struct Response: Codable, Sendable {
        public let object: String
        public let url: String
        public let hasMore: Bool
        public let data: [Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent]

        private enum CodingKeys: String, CodingKey {
            case object
            case url
            case hasMore = "has_more"
            case data
        }

        public init(
            object: String,
            url: String,
            hasMore: Bool,
            data: [Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent]
        ) {
            self.object = object
            self.url = url
            self.hasMore = hasMore
            self.data = data
        }
    }
}

// https://docs.stripe.com/api/payment_intents/search.md
extension Stripe.PaymentIntents.Search {
    public struct Request: Codable, Equatable, Sendable {
        public let query: String
        public let limit: Int?
        public let page: String?

        public init(
            query: String,
            limit: Int? = nil,
            page: String? = nil
        ) {
            self.query = query
            self.limit = limit
            self.page = page
        }
    }

    public struct Response: Codable, Sendable {
        public let object: String
        public let url: String
        public let hasMore: Bool
        public let data: [Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent]
        public let nextPage: String?
        public let totalCount: Int?

        private enum CodingKeys: String, CodingKey {
            case object
            case url
            case hasMore = "has_more"
            case data
            case nextPage = "next_page"
            case totalCount = "total_count"
        }

        public init(
            object: String,
            url: String,
            hasMore: Bool,
            data: [Stripe_Types_Shared.Stripe.PaymentIntents.PaymentIntent],
            nextPage: String? = nil,
            totalCount: Int? = nil
        ) {
            self.object = object
            self.url = url
            self.hasMore = hasMore
            self.data = data
            self.nextPage = nextPage
            self.totalCount = totalCount
        }
    }
}

// https://docs.stripe.com/api/payment_intents/increment_authorization.md
extension Stripe.PaymentIntents.IncrementAuthorization {
    public struct Request: Codable, Equatable, Sendable {
        public let amount: Int
        public let applicationFeeAmount: Int?
        public let description: String?
        public let metadata: [String: String]?
        public let statementDescriptor: Stripe.StatementDescriptor?
        public let transferData: TransferData?
        
        private enum CodingKeys: String, CodingKey {
            case amount
            case applicationFeeAmount = "application_fee_amount"
            case description
            case metadata
            case statementDescriptor = "statement_descriptor"
            case transferData = "transfer_data"
        }
        
        public init(
            amount: Int,
            applicationFeeAmount: Int? = nil,
            description: String? = nil,
            metadata: [String: String]? = nil,
            statementDescriptor: Stripe.StatementDescriptor? = nil,
            transferData: TransferData? = nil
        ) {
            self.amount = amount
            self.applicationFeeAmount = applicationFeeAmount
            self.description = description
            self.metadata = metadata
            self.statementDescriptor = statementDescriptor
            self.transferData = transferData
        }
        
        public struct TransferData: Codable, Equatable, Sendable {
            public let amount: Int?
            
            public init(amount: Int? = nil) {
                self.amount = amount
            }
        }
    }
}

// https://docs.stripe.com/api/payment_intents/verify_microdeposits.md
extension Stripe.PaymentIntents.VerifyMicrodeposits {
    public struct Request: Codable, Equatable, Sendable {
        public let amounts: [Int]?
        public let descriptorCode: String?
        
        private enum CodingKeys: String, CodingKey {
            case amounts
            case descriptorCode = "descriptor_code"
        }
        
        public init(
            amounts: [Int]? = nil,
            descriptorCode: String? = nil
        ) {
            self.amounts = amounts
            self.descriptorCode = descriptorCode
        }
    }
}
