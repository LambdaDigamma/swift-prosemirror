import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(ProseMirrorTests.allTests),
        testCase(ParagraphTests.allTests),
        testCase(HeadlineTests.allTests),
        testCase(BulletListTests.allTests)
    ]
}
#endif
