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
			XCTAssertEqual(result, output, "Failed to demangle \(input). Got \(result), expected \(output)")
		} catch {
			XCTFail("Failed to demangle \(input). Got \(error), expected \(output)")
		}
	}
	
	func test__ZdaPv() {
		let input = "__ZdaPv"
		do {
			let result = try CxxDemangle(input)
			XCTFail("Expected throw, got \(result) instead")
		} catch CxxDemangleErrors.mangledNameInvalid {
			//Passed
		} catch {
			XCTFail("Unknown throw. Got \(error), expected \(CxxDemangleErrors.mangledNameInvalid)")
		}
	}

	func test_ZdlPv() {
		let input = "_ZdlPv"
		let output = "operator delete(void*)"
		do {
			let result = try CxxDemangle(input)
			XCTAssertEqual(result, output, "Failed to demangle \(input). Got \(result), expected \(output)")
		} catch {
			XCTFail("Failed to demangle \(input). Got \(error), expected \(output)")
		}
	}
	
	func test_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6assignEPKc() {
		let input = "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6assignEPKc"
		let output = "std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> >::assign(char const*)"
		do {
			let result = try CxxDemangle(input)
			XCTAssertEqual(result, output, "Failed to demangle \(input). Got \(result), expected \(output)")
		} catch {
			XCTFail("Failed to demangle \(input). Got \(error), expected \(output)")
		}
	}
}
