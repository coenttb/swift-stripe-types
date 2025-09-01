import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import Dependencies

extension Stripe {
    @DependencyClient
    public struct ConfirmationTokenClient: Sendable {
        // https://docs.stripe.com/api/confirmation_tokens/retrieve.md
        @DependencyEndpoint
        public var retrieve: @Sendable (_ id: ConfirmationToken.ID) async throws -> ConfirmationToken
    }
}
