//
//  CwlDemangleAdditionalTests.swift
//  CwlDemangleTests
//
//  Created by Matt Gallagher on 15/2/20.
//  Copyright © 2020 Matt Gallagher. All rights reserved.
//

#if SWIFT_PACKAGE
@testable import CwlDemangle
#endif

import Foundation
import XCTest

class CwlDemangleAdditionalTests: XCTestCase {
	func testUnicodeProblem() {
		let input = "_T0s14StringProtocolP10FoundationSS5IndexVADRtzrlE10componentsSaySSGqd__11separatedBy_tsAARd__lF"
		let output = "(extension in Foundation):Swift.StringProtocol<>.components<A where A1: Swift.StringProtocol>(separatedBy: A1) -> [Swift.String]"
		do {
			let parsed = try parseMangledSwiftSymbol(input)
			let result = parsed.print(using: SymbolPrintOptions.default.union(.synthesizeSugarOnTypes))
			XCTAssert(result == output, "Failed to demangle \(input). Got \(result), expected \(output)")
		} catch {
			XCTFail("Failed to demangle \(input). Got \(error), expected \(output)")
		}
	}
	func test_T011CryptoSwift3AESC0017sBoxstorage_wEEFc33_2FA9B7ACC72B80C564A140F8079C9914LLSays6UInt32VGSgvpWvd() {
		let input = "_T011CryptoSwift3AESC0017sBoxstorage_wEEFc33_2FA9B7ACC72B80C564A140F8079C9914LLSays6UInt32VGSgvpWvd"
		let output = "direct field offset for CryptoSwift.AES.(sBox.storage in _2FA9B7ACC72B80C564A140F8079C9914) : [Swift.UInt32]?"
		do {
			let parsed = try parseMangledSwiftSymbol(input)
			let result = parsed.print(using: SymbolPrintOptions.default.union(.synthesizeSugarOnTypes))
			XCTAssert(result == output, "Failed to demangle \(input). Got \(result), expected \(output)")
		} catch {
			XCTFail("Failed to demangle \(input). Got \(error), expected \(output)")
		}
	}
}
