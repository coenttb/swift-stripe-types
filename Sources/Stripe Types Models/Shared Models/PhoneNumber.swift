//
//  File.swift
//  swift-stripe
//
//  Created by Coen ten Thije Boonkkamp on 08/01/2025.
//

import Foundation
import Stripe_Types_Shared

public enum PhoneNumber {}

extension PhoneNumber {
    public struct Collection: Codable, Hashable, Sendable {
        /// Indicates whether phone number collection is enabled
        public var enabled: Bool

        public init(
            enabled: Bool
        ) {
            self.enabled = enabled
        }
    }
}
