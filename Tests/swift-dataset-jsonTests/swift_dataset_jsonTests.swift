@testable import swift_dataset_json
import XCTest

@available(macOS 12, *)
final class DatasetJsonTests: XCTestCase {
    func testNumberOfRecord() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.

        let path = NSHomeDirectory() + "/develop/data/DataExchange-DatasetJson-master/examples/sdtm/dm.json"
        let bb = DatasetJson()

        let df = try bb.ReadFile(path: path)
        XCTAssertEqual(df.shape.rows, 18)
    }
}
