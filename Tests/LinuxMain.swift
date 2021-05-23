import XCTest

import ProseMirrorTests

var tests = [XCTestCaseEntry]()
tests += ProseMirrorTests.allTests()
tests += ParagraphTests.allTests()
tests += HeadlineTests.allTests()
tests += BulletListTests.allTests()
tests += BoldTests.allTests()
tests += ItalicTests.allTests()
tests += StrikeTests.allTests()
tests += Superscript.allTests()
tests += UnderlineTests.allTests()
XCTMain(tests)
