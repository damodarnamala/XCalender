import XCTest
@testable import XCalender

final class XCalenderTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(XCalender().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
