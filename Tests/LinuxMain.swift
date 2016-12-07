#if os(Linux)

import XCTest
@testable import BFKitTests

XCTMain([
    testCase(BFDataStructuresTests.allTests),
    testCase(ArrayExtensionTests.allTests),
    testCase(CollectionExtensionTests.allTests),
    testCase(DataExtensionTests.allTests),
    testCase(DateExtensionTests.allTests),
    testCase(DictionaryExtensionTests.allTests),
    testCase(NSObjectExtensionTests.allTests),
    testCase(NumberExtensionTests.allTests),
    testCase(StringExtensionTests.allTests),
    testCase(ThreadExtensionTests.allTests)
])

#endif
