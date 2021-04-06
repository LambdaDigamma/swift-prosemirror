import XCTest

import ProseMirrorTests

var tests = [XCTestCaseEntry]()
tests += ProseMirrorTests.allTests()
tests += ParagraphTests.allTests()
tests += HeadlineTests.allTests()
tests += BulletListTests.allTests()
XCTMain(tests)
