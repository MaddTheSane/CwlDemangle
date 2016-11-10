//
//  CxaDemangleTests.swift
//  CwlDemangle
//
//  Created by C.W. Betts on 11/9/16.
//  Copyright © 2016 Matt Gallagher. All rights reserved.
//

import XCTest

class CxaDemangleTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

	func test_ZdaPv() {
		let input = "_ZdaPv"
		let output = "operator delete[](void*)"
		do {
			let result = try CxxDemangle(input)
			XCTAssertEqual(input, output, "Failed to demangle \(input). Got \(result), expected \(output)")
		} catch {
			XCTFail("Failed to demangle \(input). Got \(error), expected \(output)")
		}
	}
}