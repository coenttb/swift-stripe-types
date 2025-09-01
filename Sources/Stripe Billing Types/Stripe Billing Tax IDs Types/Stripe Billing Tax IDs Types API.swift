import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import URLFormCodingURLRouting
import CasePaths
import Tagged

extension Stripe.Billing.TaxIDs {
    @CasePathable
    @dynamicMemberLookup
    public enum API: Equatable, Sendable {
        // https://docs.stripe.com/api/customer_tax_ids/create
        case create(customerId: Stripe.Customers.Customer.ID, request: Create.Request)
        // https://docs.stripe.com/api/customer_tax_ids/retrieve
        case retrieve(customerId: Stripe.Customers.Customer.ID, id: TaxID.ID)
        // https://docs.stripe.com/api/customer_tax_ids/delete
        case delete(customerId: Stripe.Customers.Customer.ID, id: TaxID.ID)
        // https://docs.stripe.com/api/customer_tax_ids/list
        case list(customerId: Stripe.Customers.Customer.ID, request: List.Request)
    }
}

extension Stripe.Billing.TaxIDs.API {
    public struct Router: ParserPrinter, Sendable {
        public init() {}
        
        public var body: some URLRouting.Router<Stripe.Billing.TaxIDs.API> {
            OneOf {
                URLRouting.Route(.case(Stripe.Billing.TaxIDs.API.create)) {
                    Method.post
                    Path.v1
                    Path.customers
                    Path { Parse(.string.representing(Stripe.Customers.Customer.ID.self)) }
                    Path.tax_ids
                    Body(.form(Stripe.Billing.TaxIDs.Create.Request.self, decoder: .stripe, encoder: .stripe))
                }
                
                URLRouting.Route(.case(Stripe.Billing.TaxIDs.API.retrieve)) {
                    Method.get
                    Path.v1
                    Path.customers
                    Path { Parse(.string.representing(Stripe.Customers.Customer.ID.self)) }
                    Path.tax_ids
                    Path { Parse(.string.representing(Stripe.Billing.TaxIDs.TaxID.ID.self)) }
                }
                
                URLRouting.Route(.case(Stripe.Billing.TaxIDs.API.delete)) {
                    Method.delete
                    Path.v1
                    Path.customers
                    Path { Parse(.string.representing(Stripe.Customers.Customer.ID.self)) }
                    Path.tax_ids
                    Path { Parse(.string.representing(Stripe.Billing.TaxIDs.TaxID.ID.self)) }
                }
                
                URLRouting.Route(.case(Stripe.Billing.TaxIDs.API.list)) {
                    Method.get
                    Path.v1
                    Path.customers
                    Path { Parse(.string.representing(Stripe.Customers.Customer.ID.self)) }
                    Path.tax_ids
                    Parse(.memberwise(Stripe.Billing.TaxIDs.List.Request.init)) {
                        URLRouting.Query {
                            Optionally {
                                Field("ending_before") { Parse(.string) }
                            }
                            Optionally {
                                Field("limit") { Digits() }
                            }
                            Optionally {
                                Field("starting_after") { Parse(.string) }
                            }
                        }
                    }
                }
            }
        }
    }
}

extension Path<PathBuilder.Component<String>> {
    nonisolated(unsafe) package static let tax_ids = Path { "tax_ids" }
}