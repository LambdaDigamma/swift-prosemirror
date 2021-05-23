import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(ProseMirrorTests.allTests),
        testCase(ParagraphTests.allTests),
        testCase(HeadlineTests.allTests),
        testCase(BulletListTests.allTests),
        testCase(BoldTests.allTests),
        testCase(ItalicTests.allTests),
        testCase(StrikeTests.allTests),
        testCase(SuperscriptTests.allTests),
        testCase(UnderlineTests.allTests),
    ]
}
#endif
