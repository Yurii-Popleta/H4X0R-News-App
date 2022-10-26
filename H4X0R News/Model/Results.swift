
import Foundation

//MARK: - Here we create struct for decoding JSON format, and in struct Post we use protoloc Identifiable in order to put this data into ContentView struct in method List. and because we use this protocol we should have var id.

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
  }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}

