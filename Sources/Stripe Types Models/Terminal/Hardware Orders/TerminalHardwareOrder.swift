//
//  TerminalHardwareOrder.swift
//
//
//  Created by Andrew Edwards on 5/17/23.
//

import Foundation
import Stripe_Types_Shared

// https://docs.stripe.com/api/terminal/hardware_orders/object.md

public struct TerminalHardwareOrder: Codable, Hashable, Sendable, Identifiable {
  public typealias ID = Tagged<Self, String>
  /// Unique identifier for the object.
  public var id: ID
  /// A positive integer in the smallest currency unit. Represents the total cost for the order.
  public var amount: Int?
  /// Three-letter ISO currency code, in lowercase. Must be a supported currency.
  public var currency: Stripe.Currency?
  /// An array of line items ordered.
  public var hardwareOrderItems: [TerminalHardwareOrderLineItem]?
  /// Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  public var metadata: [String: String]?
  /// One of `monthly_invoice`, `payment_intent`, or `none`.
  public var paymentType: TerminalHardwareOrderPaymentType?
  /// Shipping address for the order.
  public var shipping: TerminalHardwareOrderShipping?
  /// The Shipping Method for the order.
  public var shippingMethod: String?
  /// The status of the terminal hardware order.
  public var status: TerminalHardwareOrderStatus?
  /// String representing the object’s type. Objects of the same type share the same value.
  public var object: String
  /// Time at which the object was created. Measured in seconds since the Unix epoch.
  public var created: Date
  /// Has the value true if the object exists in live mode or the value false if the object exists in test mode.
  public var livemode: Bool
  /// Returns the tracking information for each shipment.
  public var shipmentTracking: [TerminalHardwareOrderShipmentTracking]?
  /// The amount of tax on this order, summed from all the tax amounts.
  public var tax: Int?
  /// The aggregate amounts calculated per tax rate for all of the items on the order.
  public var totalTaxAmounts: [TerminalHardwareOrderTotalTaxAmount]?
  /// Time at which the object was last updated. Measured in seconds since the Unix epoch.
  public var updated: Date?

  public init(
    id: ID,
    amount: Int? = nil,
    currency: Stripe.Currency? = nil,
    hardwareOrderItems: [TerminalHardwareOrderLineItem]? = nil,
    metadata: [String: String]? = nil,
    paymentType: TerminalHardwareOrderPaymentType? = nil,
    shipping: TerminalHardwareOrderShipping? = nil,
    shippingMethod: String? = nil,
    status: TerminalHardwareOrderStatus? = nil,
    object: String,
    created: Date,
    livemode: Bool,
    shipmentTracking: [TerminalHardwareOrderShipmentTracking]? = nil,
    tax: Int? = nil,
    totalTaxAmounts: [TerminalHardwareOrderTotalTaxAmount]? = nil,
    updated: Date? = nil
  ) {
    self.id = id
    self.amount = amount
    self.currency = currency
    self.hardwareOrderItems = hardwareOrderItems
    self.metadata = metadata
    self.paymentType = paymentType
    self.shipping = shipping
    self.shippingMethod = shippingMethod
    self.status = status
    self.object = object
    self.created = created
    self.livemode = livemode
    self.shipmentTracking = shipmentTracking
    self.tax = tax
    self.totalTaxAmounts = totalTaxAmounts
    self.updated = updated
  }
}

public struct TerminalHardwareOrderLineItem: Codable, Hashable, Sendable {
  /// A positive integer that represents the cost of the order in the smallest currency unit.
  public var amount: Int?
  /// Three-letter ISO currency code, in lowercase. Must be a supported currency.
  public var currency: Stripe.Currency?
  /// The quantity to be ordered.
  public var quantity: Int?
  /// The `TerminalHardwareSKU`.
  public var terminalHardwareSku: TerminalHardwareSKU?

  public init(
    amount: Int? = nil,
    currency: Stripe.Currency? = nil,
    quantity: Int? = nil,
    terminalHardwareSku: TerminalHardwareSKU? = nil
  ) {
    self.amount = amount
    self.currency = currency
    self.quantity = quantity
    self.terminalHardwareSku = terminalHardwareSku
  }
}

public enum TerminalHardwareOrderPaymentType: String, Codable, Sendable {
  case monthlyInvoice = "monthly_invoice"
  case paymentIntent = "payment_intent"
  case `none`
}

public struct TerminalHardwareOrderShipping: Codable, Hashable, Sendable {
  /// Shipping address.
  public var address: Address?
  /// A positive integer in the smallest currency unit. Represents the cost for shippingthe order.
  public var amount: Int?
  /// Company name.
  public var company: String?
  /// Three-letter ISO currency code, in lowercase. Must be a supported currency.
  public var currency: Stripe.Currency?
  /// Customer email. This email will receive Stripe-branded update emails when the status of the order changes.
  public var email: String?
  /// Customer name.
  public var name: String?
  /// Customer phone (including extension).
  public var phone: String?

  public init(
    address: Address? = nil,
    amount: Int? = nil,
    company: String? = nil,
    currency: Stripe.Currency? = nil,
    email: String? = nil,
    name: String? = nil,
    phone: String? = nil
  ) {
    self.address = address
    self.amount = amount
    self.company = company
    self.currency = currency
    self.email = email
    self.name = name
    self.phone = phone
  }
}

public enum TerminalHardwareOrderStatus: String, Codable, Sendable {
  /// Order has been received and can still be canceled.
  case pending
  /// Order was canceled. Please create a new order to receive these items.
  case canceled
  /// Order has been shipped, and can no longer be canceled.
  case shipped
  /// Order has been delivered!
  case delivered
  /// One or more of the order’s items could not be delivered.
  case undeliverable
}

public struct TerminalHardwareOrderShipmentTracking: Codable, Hashable, Sendable {
  /// The name of the carrier delivering the order.
  public var carrier: TerminalHardwareOrderShipmentTrackingCarrier?
  /// The number used to identify the shipment with the carrier responsible for delivery.
  public var trackingNumber: String?

  public init(
    carrier: TerminalHardwareOrderShipmentTrackingCarrier? = nil,
    trackingNumber: String? = nil
  ) {
    self.carrier = carrier
    self.trackingNumber = trackingNumber
  }
}

public enum TerminalHardwareOrderShipmentTrackingCarrier: String, Codable, Sendable {
  /// A placeholder to catch new carriers in your integration as we introduce them.
  case other
  /// UPS
  case ups
  /// Purolator
  case purolator
  /// FedEx
  case fedex
  /// Australia Post
  case australiaPost = "australia_post"
  /// USPS
  case usps
  /// Canada Post
  case canadaPost = "canada_post"
  /// DHL
  case dhl
  /// DPD
  case dpd
}

public struct TerminalHardwareOrderTotalTaxAmount: Codable, Hashable, Sendable {
  /// A positive integer that represents the cost of tax in the smallest currency unit.
  public var amount: Int?
  /// Whether the tax rate is inclusive or exclusive
  public var inclusive: Bool?
  /// The tax rate that applies to this order.
  public var rate: TerminalHardwareOrderTotalTaxAmountRate?

  public init(
    amount: Int? = nil,
    inclusive: Bool? = nil,
    rate: TerminalHardwareOrderTotalTaxAmountRate? = nil
  ) {
    self.amount = amount
    self.inclusive = inclusive
    self.rate = rate
  }
}

public struct TerminalHardwareOrderTotalTaxAmountRate: Codable, Hashable, Sendable {
  /// The display name of the tax rate.
  public var displayName: String?
  /// Tax jurisdiction.
  public var jurisdiction: String?
  /// The percentage associated with the tax rate.
  public var percentage: String?

  public init(
    displayName: String? = nil,
    jurisdiction: String? = nil,
    percentage: String? = nil
  ) {
    self.displayName = displayName
    self.jurisdiction = jurisdiction
    self.percentage = percentage
  }
}

public struct TerminalHardwareOrderList: Codable, Hashable, Sendable {
  public var object: String
  public var hasMore: Bool?
  public var url: String?
  public var data: [TerminalHardwareOrder]?

  public init(
    object: String,
    hasMore: Bool? = nil,
    url: String? = nil,
    data: [TerminalHardwareOrder]? = nil
  ) {
    self.object = object
    self.hasMore = hasMore
    self.url = url
    self.data = data
  }
}
