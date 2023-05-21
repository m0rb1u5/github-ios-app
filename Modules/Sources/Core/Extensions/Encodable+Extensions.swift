import Foundation

public extension Encodable {
    func asDictionary() throws -> [String: Any] {
        let data: Data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
        else {
            throw GHError("No data")
        }
        return dictionary
    }
}
