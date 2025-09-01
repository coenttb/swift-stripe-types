//
//  InvoiceItem.swift
//  Stripe
//
//  Created by Anthony Castelli on 9/5/17.
//
//

import Foundation
import Stripe_Types_Shared
import Tagged

// https://docs.stripe.com/api/invoiceitems/object.md

/// The [InvoiceItem Object](https://stripe.com/docs/api/invoiceitems/object)
extension Stripe.Billing.Invoice {
    public struct Item: Codable, Hashable, Sendable, Identifiable {
    public typealias ID = Tagged<Self, String>
    
    /// Unique identifier for the object.
    public var id: ID
    /// Amount (in the currency specified) of the invoice item. This should always be equal to unit_amount * quantity.
    public var amount: Int?
    /// Three-letter ISO currency code, in lowercase. Must be a supported currency.
    public var currency: Stripe.Currency?
    /// The ID of the customer who will be billed when this invoice item is billed.
    @ExpandableOf<Stripe.Customers.Customer> public var customer: Stripe.Customers.Customer.ID?
    /// An arbitrary string attached to the object. Often useful for displaying to users.
    public var description: String?
    /// Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    public var metadata: [String: String]?
    /// The period associated with this invoice item. When set to different values, the period will be rendered on the invoice. If you have Stripe Revenue Recognition enabled, the period will be used to recognize and defer revenue. See the Revenue Recognition documentation for details.
    public var period: ItemPeriod?
    /// The price of the invoice item.
    public var price: Stripe.Products.Price?
    /// Whether the invoice item was created automatically as a proration adjustment when the customer switched plans.
    public var proration: Bool?
    /// String representing the object’s type. Objects of the same type share the same value.
    public var object: String
    /// Time at which the object was created. Measured in seconds since the Unix epoch.
    public var date: Date?
    /// If true, discounts will apply to this invoice item. Always false for prorations.
    public var discountable: Bool?
    /// The discounts which apply to the invoice item. Item discounts are applied before invoice discounts. Use expand[]=discounts to expand each discount.
    @ExpandableCollection<Stripe.Products.Discount> public var discounts: [String]?
    /// The ID of the invoice this invoice item belongs to.
    @Expandable<Stripe.Billing.Invoice, Stripe.Billing.Invoice.ID> public var invoice: Stripe.Billing.Invoice.ID?
    /// Has the value true if the object exists in live mode or the value false if the object exists in test mode.
    public var livemode: Bool?
    /// Quantity of units for the invoice item. If the invoice item is a proration, the quantity of the subscription that the proration was computed for.
    public var quantity: Int?
    /// The subscription that this invoice item has been created for, if any.
    @ExpandableOf<Stripe.Billing.Subscription> public var subscription: Stripe.Billing.Subscription.ID?
    /// The subscription item that this invoice item has been created for, if any.
    public var subscriptionItem: String?
    /// The tax rates which apply to the invoice item. When set, the default_tax_rates on the invoice do not apply to this invoice item.
    public var taxRates: [Stripe.Tax.Rate]?
    /// ID of the test clock this invoice item belongs to.
    @ExpandableOf<Stripe.Billing.TestClocks.TestClock> public var testClock: Stripe.Billing.TestClocks.TestClock.ID?
    /// Unit Amount (in the currency specified) of the invoice item.
    public var unitAmount: Int?
    /// Same as `unit_amount`, but contains a decimal value with at most 12 decimal places.
    public var unitAmountDecimal: String?

    public init(
        id: ID,
        amount: Int? = nil,
        currency: Stripe.Currency? = nil,
        customer: Stripe.Customers.Customer.ID? = nil,
        description: String? = nil,
        metadata: [String: String]? = nil,
        period: ItemPeriod? = nil,
        price: Stripe.Products.Price? = nil,
        proration: Bool? = nil,
        object: String,
        date: Date? = nil,
        discountable: Bool? = nil,
        discounts: [String]? = nil,
        invoice: Stripe.Billing.Invoice.ID? = nil,
        livemode: Bool? = nil,
        quantity: Int? = nil,
        subscription: Stripe.Billing.Subscription.ID? = nil,
        subscriptionItem: String? = nil,
        taxRates: [Stripe.Tax.Rate]? = nil,
        testClock: Stripe.Billing.TestClocks.TestClock.ID? = nil,
        unitAmount: Int? = nil,
        unitAmountDecimal: String? = nil
    ) {
        self.id = id
        self.amount = amount
        self.currency = currency
        self._customer = Expandable(id: customer)
        self.description = description
        self.metadata = metadata
        self.period = period
        self.price = price
        self.proration = proration
        self.object = object
        self.date = date
        self.discountable = discountable
        self._discounts = ExpandableCollection(ids: discounts)
        self._invoice = Expandable(id: invoice)
        self.livemode = livemode
        self.quantity = quantity
        self._subscription = Expandable(id: subscription)
        self.subscriptionItem = subscriptionItem
        self.taxRates = taxRates
        self._testClock = Expandable(id: testClock)
        self.unitAmount = unitAmount
        self.unitAmountDecimal = unitAmountDecimal
    }
    }

    public struct ItemPeriod: Codable, Hashable, Sendable {
        /// The start of the period. This value is inclusive.
        public var start: Date?
        /// The end of the period, which must be greater than or equal to the start. This value is inclusive.
        public var end: Date?

        public init(
            start: Date? = nil,
            end: Date? = nil
        ) {
            self.start = start
            self.end = end
        }
    }

    public struct ItemList: Codable, Hashable, Sendable {
        public var object: String
        public var hasMore: Bool?
        public var url: String?
        public var data: [Item]?
    }
}
