#if os(Linux)

import XCTest
@testable import BFKitTests

XCTMain([
    testCase(BFAppTests.allTests),
    testCase(BFDataStructuresTests.allTests),
    testCase(BFLogTests.allTests),
    testCase(BFPasswordTests.allTests),
    testCase(ArrayExtensionTests.allTests),
    testCase(CollectionExtensionTests.allTests),
    testCase(DataExtensionTests.allTests),
    testCase(DateExtensionTests.allTests),
    testCase(DictionaryExtensionTests.allTests),
    testCase(NSObjectExtensionTests.allTests),
    testCase(NumberExtensionTests.allTests),
    testCase(ProcessInfoExtensionTests.allTests),
    testCase(StringExtensionTests.allTests),
    testCase(ThreadExtensionTests.allTests)
])

#endif
