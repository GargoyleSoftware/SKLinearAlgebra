//
//  Vector4Tests.swift
//  SKLinearAlgebra
//
//  Created by Cameron Little on 2/24/15.
//  Copyright (c) 2015 Cameron Little. All rights reserved.
//

import XCTest
import SceneKit

class Vector4Tests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testEquatable() {
        let b = SCNVector4(x: 9, y: 5, z: 2, w: 1)
        let B = SCNVector4(x: 9, y: 5, z: 2, w: 1)
        let C = SCNVector4(x: 8, y: 5, z: 2, w: 1)

        XCTAssertTrue(b == b, "Vector4 is equitable (==)")
        XCTAssertTrue(b != C, "Vector4 is equitable (!=)")
    }

    func testCopy() {
        let a = SCNVector4(x: 9, y: 5, z: 2, w: 1)
        let b = a.copy()

        XCTAssertEqual(a, b, "Vector 4 copy test 1")

        /*b.x = 3
        let c = SCNVector4(x: 3, y: 5, z: 2, w: 1)
        XCTAssertEqual(b, c, "Vector 4 didn't mutate first")
        XCTAssertNotEqual(a, b, "Vector 4 copy didn't mutate.")*/
    }

    func testVectorConversion4to3() {
        let a = SCNVector4(x: 9, y: 5, z: 2, w: 1)
        let ac = a.to3()

        let b = SCNVector3(x: 9, y: 5, z: 2)

        XCTAssertTrue(SCNVector3EqualToVector3(ac, b), "Converted Vector4 to Vector3")
    }

    func testDotProduct() {
        // This is an example of a functional test case.
        let a = SCNVector4(x: 0, y: 3, z: -7, w: 0)
        let b = SCNVector4(x: 2, y: 3, z: 1, w: 0)

        XCTAssertEqual(a * b, 2, "Dot product of Vector4 correct")
    }

    func testCrossProduct() {
        let a = SCNVector4(x: 3, y: -3, z: 1, w: 0)
        let b = SCNVector4(x: 4, y: 9, z: 2, w: 0)
        let c = SCNVector4(x: -15, y: -2, z: 39, w: 0)

        XCTAssertEqual(a × b, c, "Cross product successful")
        XCTAssertEqual(cross(a, b), c, "Cross product convenience method successful")

        let d = SCNVector4(x: 3, y: -3, z: 1, w: 0)
        let e = SCNVector4(x: -12, y: 12, z: 4, w: 0)

        XCTAssertEqual(d × e, SCNVector4Zero, "Cross product successful")
    }

    func testScalarMultiplication() {
        let a = SCNVector4(x: 2, y: 3, z: 1, w: 0)
        let cf: Float = 4.0
        let ci: Int = 4

        let result = SCNVector4(x: 8, y: 12, z: 4, w: 0)

        XCTAssertEqual(a * cf, result, "Float scalar right multiplication")
        XCTAssertEqual(cf * a, result, "Float scalar left multiplication")
        XCTAssertEqual(a * ci, result, "Int scalar right multiplication")
        XCTAssertEqual(ci * a, result, "Int scalar left multiplication")
    }

    func testScalarDivision() {
        let a = SCNVector4(x: 9, y: 12, z: -3, w: 0)
        let cf: Float = 3
        let ci: Int = 3

        let result = SCNVector4(x: 3, y: 4, z: -1, w: 0)

        XCTAssertEqual(a / cf, result, "Float scalar division correct")
        XCTAssertEqual(a / ci, result, "Int scalar division correct")
    }

    func testVectorSubtraction() {
        let a = SCNVector4(x: 12, y: 2, z: 4, w: 0)
        let b = SCNVector4(x: 3, y: -4, z: 3, w: 0)

        let resultab = SCNVector4(x: 9, y: 6, z: 1, w: 0)
        let resultba = SCNVector4(x: -9, y: -6, z: -1, w: 0)

        XCTAssertEqual(a - b, resultab, "subtraction test 1")
        XCTAssertEqual(b - a, resultba, "subtraction test 2")
    }

    func testVectorAddition() {
        let a = SCNVector4(x: 12, y: 2, z: 4, w: 0)
        let b = SCNVector4(x: 3, y: -4, z: 3, w: 0)

        let result = SCNVector4(x: 15, y: -2, z: 7, w: 0)

        XCTAssertEqual(a + b, result, "addition test 1")
        XCTAssertEqual(b + a, result, "addition test 2")
    }

}
