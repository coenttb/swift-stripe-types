//
//  PaymentMethods.swift
//  swift-stripe-types
//
//  Created by Namespace Refactoring Script on 2025-08-10 08:57:41 +0000.
//

import Foundation
import Stripe_Types_Models
@_exported import Stripe_Types_Shared

extension Stripe.PaymentMethods {
  public enum PaymentMethods {}
}

// MARK: - Create
extension Stripe.PaymentMethods.PaymentMethods {
  // https://docs.stripe.com/api/payment_methods/create.md
  public enum Create {}
}

extension Stripe.PaymentMethods.PaymentMethods.Create {
  public struct Request: Codable, Equatable, Sendable {
    public let type: Stripe.PaymentMethods.PaymentMethod.`Type`
    public let billingDetails: BillingModel.Details?
    public let metadata: [String: String]?
    public let allowRedisplay: String?  // "always", "limited", "unspecified"

    // Payment method specific parameters
    public let card: Card?
    public let usBankAccount: USBankAccount?
    public let sepaDebit: SepaDebit?
    // Add more payment method specific types as needed

    public init(
      type: Stripe.PaymentMethods.PaymentMethod.`Type`,
      billingDetails: BillingModel.Details? = nil,
      metadata: [String: String]? = nil,
      allowRedisplay: String? = nil,
      card: Card? = nil,
      usBankAccount: USBankAccount? = nil,
      sepaDebit: SepaDebit? = nil
    ) {
      self.type = type
      self.billingDetails = billingDetails
      self.metadata = metadata
      self.allowRedisplay = allowRedisplay
      self.card = card
      self.usBankAccount = usBankAccount
      self.sepaDebit = sepaDebit
    }

    private enum CodingKeys: String, CodingKey {
      case type
      case billingDetails = "billing_details"
      case metadata
      case allowRedisplay = "allow_redisplay"
      case card
      case usBankAccount = "us_bank_account"
      case sepaDebit = "sepa_debit"
    }

    public struct Card: Codable, Equatable, Sendable {
      public let number: String?
      public let expMonth: Int?
      public let expYear: Int?
      public let cvc: String?
      public let token: String?

      public init(
        number: String? = nil,
        expMonth: Int? = nil,
        expYear: Int? = nil,
        cvc: String? = nil,
        token: String? = nil
      ) {
        self.number = number
        self.expMonth = expMonth
        self.expYear = expYear
        self.cvc = cvc
        self.token = token
      }

      private enum CodingKeys: String, CodingKey {
        case number
        case expMonth = "exp_month"
        case expYear = "exp_year"
        case cvc
        case token
      }
    }

    public struct USBankAccount: Codable, Equatable, Sendable {
      public let accountHolderType: String?  // "individual" or "company"
      public let accountNumber: String?
      public let routingNumber: String?

      public init(
        accountHolderType: String? = nil,
        accountNumber: String? = nil,
        routingNumber: String? = nil
      ) {
        self.accountHolderType = accountHolderType
        self.accountNumber = accountNumber
        self.routingNumber = routingNumber
      }

      private enum CodingKeys: String, CodingKey {
        case accountHolderType = "account_holder_type"
        case accountNumber = "account_number"
        case routingNumber = "routing_number"
      }
    }

    public struct SepaDebit: Codable, Equatable, Sendable {
      public let iban: String

      public init(iban: String) {
        self.iban = iban
      }
    }
  }
}

// MARK: - Update
extension Stripe.PaymentMethods.PaymentMethods {
  // https://docs.stripe.com/api/payment_methods/update.md
  public enum Update {}
}

extension Stripe.PaymentMethods.PaymentMethods.Update {
  public struct Request: Codable, Equatable, Sendable {
    public let billingDetails: BillingModel.Details?
    public let metadata: [String: String]?
    public let allowRedisplay: String?  // "always", "limited", "unspecified"
    public let card: Card?
    public let usBankAccount: USBankAccount?
    public let link: Link?

    public init(
      billingDetails: BillingModel.Details? = nil,
      metadata: [String: String]? = nil,
      allowRedisplay: String? = nil,
      card: Card? = nil,
      usBankAccount: USBankAccount? = nil,
      link: Link? = nil
    ) {
      self.billingDetails = billingDetails
      self.metadata = metadata
      self.allowRedisplay = allowRedisplay
      self.card = card
      self.usBankAccount = usBankAccount
      self.link = link
    }

    private enum CodingKeys: String, CodingKey {
      case billingDetails = "billing_details"
      case metadata
      case allowRedisplay = "allow_redisplay"
      case card
      case usBankAccount = "us_bank_account"
      case link
    }

    public struct Card: Codable, Equatable, Sendable {
      public let expMonth: Int?
      public let expYear: Int?

      public init(expMonth: Int? = nil, expYear: Int? = nil) {
        self.expMonth = expMonth
        self.expYear = expYear
      }

      private enum CodingKeys: String, CodingKey {
        case expMonth = "exp_month"
        case expYear = "exp_year"
      }
    }

    public struct USBankAccount: Codable, Equatable, Sendable {
      public let accountHolderType: String?  // "individual" or "company"

      public init(accountHolderType: String? = nil) {
        self.accountHolderType = accountHolderType
      }

      private enum CodingKeys: String, CodingKey {
        case accountHolderType = "account_holder_type"
      }
    }

    public struct Link: Codable, Equatable, Sendable {
      // Link payment method update parameters if needed
      public init() {}
    }
  }
}

// MARK: - List
extension Stripe.PaymentMethods.PaymentMethods {
  // https://docs.stripe.com/api/payment_methods/list.md
  public enum List {}
}

extension Stripe.PaymentMethods.PaymentMethods.List {
  public struct Request: Codable, Equatable, Sendable {
    public let customer: Stripe.Customers.Customer.ID?
    public let type: String?
    public let endingBefore: String?
    public let startingAfter: String?
    public let limit: Int?

    public init(
      customer: Stripe.Customers.Customer.ID? = nil,
      type: String? = nil,
      endingBefore: String? = nil,
      startingAfter: String? = nil,
      limit: Int? = nil
    ) {
      self.customer = customer
      self.type = type
      self.endingBefore = endingBefore
      self.startingAfter = startingAfter
      self.limit = limit
    }

    private enum CodingKeys: String, CodingKey {
      case customer
      case type
      case endingBefore = "ending_before"
      case startingAfter = "starting_after"
      case limit
    }
  }

  public struct Response: Codable, Sendable {
    public let object: String
    public let url: String
    public let hasMore: Bool
    public let data: [Stripe.PaymentMethods.PaymentMethod]

    private enum CodingKeys: String, CodingKey {
      case object
      case url
      case hasMore = "has_more"
      case data
    }
  }
}

// MARK: - List Customer
extension Stripe.PaymentMethods.PaymentMethods.List {
  // https://docs.stripe.com/api/payment_methods/customer_list.md
  public enum Customer {}
}

extension Stripe.PaymentMethods.PaymentMethods.List.Customer {
  public struct Request: Codable, Equatable, Sendable {
    public let type: String?
    public let endingBefore: String?
    public let startingAfter: String?
    public let limit: Int?
    public let allowRedisplay: String?  // "always", "limited", "unspecified"

    public init(
      type: String? = nil,
      endingBefore: String? = nil,
      startingAfter: String? = nil,
      limit: Int? = nil,
      allowRedisplay: String? = nil
    ) {
      self.type = type
      self.endingBefore = endingBefore
      self.startingAfter = startingAfter
      self.limit = limit
      self.allowRedisplay = allowRedisplay
    }

    private enum CodingKeys: String, CodingKey {
      case type
      case endingBefore = "ending_before"
      case startingAfter = "starting_after"
      case limit
      case allowRedisplay = "allow_redisplay"
    }
  }

  public struct Response: Codable, Sendable {
    public let object: String
    public let url: String
    public let hasMore: Bool
    public let data: [Stripe.PaymentMethods.PaymentMethod]

    private enum CodingKeys: String, CodingKey {
      case object
      case url
      case hasMore = "has_more"
      case data
    }
  }
}

// MARK: - Attach
extension Stripe.PaymentMethods.PaymentMethods {
  // https://docs.stripe.com/api/payment_methods/attach.md
  public enum Attach {}
}

extension Stripe.PaymentMethods.PaymentMethods.Attach {
  public struct Request: Codable, Equatable, Sendable {
    public let customer: Stripe.Customers.Customer.ID

    public init(customer: Stripe.Customers.Customer.ID) {
      self.customer = customer
    }
  }
}
