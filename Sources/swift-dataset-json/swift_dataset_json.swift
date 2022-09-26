import Foundation
import TabularData

public class DatasetJson {
    public init() {
    }

    @available(macOS 12, *)
    public func ReadFile(path: String) throws -> DataFrame {
        let json_data = try String(contentsOfFile: path, encoding: String.Encoding.utf8).data(using: .utf8)!
        let json = try! JSONSerialization.jsonObject(with: json_data)
        let jsonData = json as! [String: Any]

        let clinicalData = jsonData["clinicalData"]! as! [String: Any]
        let itemGroupData = clinicalData["itemGroupData"]! as! [String: Any]
        let itemGroupData_item_group = itemGroupData[itemGroupData.keys.first!]! as! [String: Any]

        let items = itemGroupData_item_group["items"]! as! [[String: Any]]
        let itemData = itemGroupData_item_group["itemData"]! as! [[Any]]

        let col_names: [String] = items.compactMap { $0["name"] as? String }
        var idx: Int = 0
        var df: DataFrame = DataFrame()
        for col in col_names {
            var aa = [String]()
            for rcd in itemData {
                //        let rcstr = rcd[idx]
                aa.append(String(describing: rcd[idx]))
            }
            idx += 1
            df.append(column: Column(name: col, contents: aa))
        }

        return (df)
    }
}
