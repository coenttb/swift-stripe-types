//
//  File.swift
//  swift-mailgun
//
//  Created by Coen ten Thije Boonkkamp on 24/12/2024.
//

import Foundation
import Parsing
import URLRouting

extension Path<PathBuilder.Component<String>> {
    nonisolated(unsafe) package static let v1 = Path {
        "v1"
    }

    nonisolated(unsafe) package static let v2 = Path {
        "v2"
    }

    nonisolated(unsafe) package static let v3 = Path {
        "v3"
    }

    nonisolated(unsafe) package static let v4 = Path {
        "v4"
    }

    nonisolated(unsafe) package static let v5 = Path {
        "v5"
    }
}
