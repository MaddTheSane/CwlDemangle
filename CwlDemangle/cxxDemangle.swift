//
//  cxxDemangle.swift
//  CwlDemangle
//
//  Created by C.W. Betts on 5/16/16.
//  Copyright © 2016 Matt Gallagher. All rights reserved.
//

import Foundation

@_silgen_name("__cxa_demangle") private func CXXDemangle(_ mangled_name: UnsafePointer<Int8>, outputBuffer: UnsafeMutablePointer<CChar>?, length: UnsafeMutablePointer<size_t>?, status: UnsafeMutablePointer<Int32>) -> UnsafeMutablePointer<CChar>


enum CxxDemangleErrors: Int32, Error {
	/// The demangling operation succeeded.
	case succeeded = 0
	/// A memory allocation failiure occurred.
	case outOfRAM = -1
	/// mangled_name is not a valid name under the C++ ABI mangling rules.
	case mangledNameInvalid = -2
	/// One of the arguments is invalid.
	case invalidArgument = -3
	
	case characterEncoding = -4
	
	var _code: Int {
		return Int(rawValue)
	}
}

func CxxDemangle(_ cxxSymbol: String) throws -> String {
	var status: Int32 = 0
	var toRet = CXXDemangle(cxxSymbol, outputBuffer: nil, length: nil, status: &status)
	defer {
		if toRet != nil {
			free(toRet)
		}
	}
	if let errVal = CxxDemangleErrors(rawValue: status), errVal != .succeeded {
		throw errVal
	}
	
	guard let swiftString = String(validatingUTF8: toRet) else {
		throw CxxDemangleErrors.characterEncoding
	}
	
	return swiftString
}
