import XCTest
@testable import Library

final class StyledLabelTests: XCTestCase {

  func testDefaultStyle() {
    let label = StyledLabel()

    XCTAssertEqual("Body", label.fontStyle)
    XCTAssertEqual("TextDefault", label.color)
    XCTAssertEqual("Default", label.weight)
  }

  func testValidStyles() {
    let label = StyledLabel()

    label.fontStyle = "Headline"
    XCTAssertNotNil(label.fontStyle)
    XCTAssertEqual(FontStyle.Headline.toUIFont(), label.font)

    label.color = "Blue"
    XCTAssertNotNil(label.color)
    XCTAssertEqual(Color.Blue.toUIColor(), label.textColor)

    label.weight = "Medium"
    XCTAssertEqual("Medium", label.weight)
  }

  func testInvalidStyles() {
    let label = StyledLabel()
    
    label.color = "Blu"
    XCTAssertEqual("", label.color)
    XCTAssertEqual(Color.mismatchedColor, label.textColor)

    label.weight = "Med"
    XCTAssertEqual("Default", label.weight)
    XCTAssertEqual(FontStyle.Body.toUIFont(), label.font)

    label.fontStyle = "Head"
    XCTAssertEqual("", label.fontStyle)
    XCTAssertEqual(FontStyle.mismatchedFont, label.font)
  }
}