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
  package static let v1 = Path {
    "v1"
  }

  package static let v2 = Path {
    "v2"
  }

  package static let v3 = Path {
    "v3"
  }

  package static let v4 = Path {
    "v4"
  }

  package static let v5 = Path {
    "v5"
  }
}
