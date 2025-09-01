//
//  Stripe Balance Types Retrieve.swift
//  swift-stripe-types
//
//  Created by Coen ten Thije Boonkkamp on 13/01/2025.
//

import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

// https://docs.stripe.com/api/balance/retrieve.md
extension Stripe.Balance {
    // The Balance API only has a retrieve endpoint
    // No request parameters are needed for retrieve
    // The response is the Stripe.Balance model itself (defined in Stripe Types Models)
}