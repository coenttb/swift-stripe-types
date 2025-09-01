import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe {
    // https://docs.stripe.com/api/confirmation_tokens/retrieve.md
    public enum ConfirmationTokenRetrieve {}
}

extension Stripe.ConfirmationTokenRetrieve {
    // Retrieve operation doesn't have a request body, only the ID in the path
    // Response is the ConfirmationToken object itself
}