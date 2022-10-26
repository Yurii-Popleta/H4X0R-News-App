
import Foundation

//MARK: - Here we appropriated ObservableObject protocol for class NetworkManager to published some properties for struct ContentView in SwiftUI file.

class NetworkManager: ObservableObject {
  
    @Published var posts = [Post]()
    
//MARK: - Here we create Decodable JSON format into struct Results adn then we put this data into variable posts array that we published for struct ContentView.
    
    func fetchData() {
        
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                     let results = try decoder.decode(Results.self, from: safeData)
                          
                        DispatchQueue.main.async {
                            self.posts = results.hits
                        }
                           
                    } catch {
                        print(error)
                    }
                }
            }
        }
            task.resume()
    }
  }
}
