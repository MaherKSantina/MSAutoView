import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(MSAutoViewTests.allTests),
    ]
}
#endif
