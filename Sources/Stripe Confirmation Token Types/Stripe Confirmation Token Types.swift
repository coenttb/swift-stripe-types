import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe {
    // https://docs.stripe.com/api/confirmation_tokens/retrieve.md
    public struct ConfirmationToken: Sendable, Hashable, Identifiable {
        public typealias ID = Tagged<Self, String>

        public let id: ID

        public init(id: ID) {
            self.id = id
        }
    }
}

extension Stripe.ConfirmationToken {
    enum Retrieve {

    }
}
