//
//  String+IncludesForTesting.swift
//  ApolloTests
//
//  Created by Ellen Shapiro on 9/21/20.
//  Copyright © 2020 Apollo GraphQL. All rights reserved.
//

import ApolloGatewayUtils
import Foundation
import XCTest

extension ApolloExtension where Base == String {
  
  func checkIncludes(expectedString: String,
                     file: StaticString = #filePath,
                     line: UInt = #line) {
    XCTAssertTrue(base.contains(expectedString),
                  "Expected string:\n\n\(expectedString)\n\ndid not appear in string\n\n\(base)",
                  file: file,
                  line: line)
  }
}
