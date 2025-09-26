import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import URLFormCodingURLRouting
import CasePaths

extension Stripe {
    @CasePathable
    @dynamicMemberLookup
    public enum ConfirmationTokenAPI: Equatable, Sendable {
        // https://docs.stripe.com/api/confirmation_tokens/retrieve.md
        case retrieve(id: ConfirmationToken.ID)
    }
}

extension Stripe.ConfirmationTokenAPI {
    public struct Router: ParserPrinter, Sendable {
        public init() {}
        
        public var body: some URLRouting.Router<Stripe.ConfirmationTokenAPI> {
            OneOf {
                Route(.case(Stripe.ConfirmationTokenAPI.retrieve)) {
                    Method.get
                    Path.v1
                    Path.confirmationTokens
                    Path { Parse(.string.representing(ConfirmationToken.ID.self)) }
                }
            }
        }
    }
}

extension Path<PathBuilder.Component<String>> {
    public static let confirmationTokens = Path {
        "confirmation_tokens"
    }
}
