//
//  File.swift
//  swift-stripe-types
//
//  Created by Coen ten Thije Boonkkamp on 13/08/2025.
//

import Foundation
import URLFormCoding

extension Form.Decoder {
    package static var stripe: Form.Decoder {
        .init(arrayParsingStrategy: .bracketsWithIndices)
    }
}

extension Form.Encoder {
    package static var stripe: Form.Encoder {
        .init(arrayEncodingStrategy: .bracketsWithIndices)
    }
}
