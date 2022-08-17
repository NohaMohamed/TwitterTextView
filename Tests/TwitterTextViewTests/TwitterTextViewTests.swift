import XCTest
@testable import TwitterTextView

final class TwitterTextViewTests: XCTestCase {
    var twitterTextView: TwitterTextView!
    override func setUp() {
        super.setUp()
        
        twitterTextView = TwitterTextView()
    }
    func test_user_exceed_limit()  {
        // Given
        let oldString = "Write your twitter here"
        let newString = "Hello"
        // When
        let isAllowed = twitterTextView.textLimit(existingText: oldString, newText: newString, limit: 10)
        //Then
        XCTAssertFalse(isAllowed)
    }
    func test_user_canType()  {
        // Given
        let oldString = "Write your twitter here"
        let newString = "Hello"
        // When
        let isAllowed = twitterTextView.textLimit(existingText: oldString, newText: newString, limit: 280)
        //Then
        XCTAssertTrue(isAllowed)
    }
}
