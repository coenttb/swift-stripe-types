import CasePaths
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import URLFormCodingURLRouting

extension Stripe.Billing.Customer.Portal.Session {
    @CasePathable
    @dynamicMemberLookup
    public enum API: Equatable, Sendable {
        // https://docs.stripe.com/api/customer_portal/sessions/create.md
        case create(request: Create.Request)
    }
}

extension Stripe.Billing.Customer.Portal.Session.API {
    public struct Router: ParserPrinter, Sendable {
        public init() {}

        public var body: some URLRouting.Router<Stripe.Billing.Customer.Portal.Session.API> {
            OneOf {
                URLRouting.Route(.case(Stripe.Billing.Customer.Portal.Session.API.create)) {
                    Method.post
                    Path.v1
                    Path.billing_portal
                    Path.sessions
                    Body(
                        .form(
                            Stripe.Billing.Customer.Portal.Session.Create.Request.self,
                            decoder: .stripe,
                            encoder: .stripe
                        )
                    )
                }
            }
        }
    }
}

// MARK: - Path Extensions
extension Path<PathBuilder.Component<String>> {
    public static let billing_portal = Path {
        "billing_portal"
    }

    public static let sessions = Path {
        "sessions"
    }
}
