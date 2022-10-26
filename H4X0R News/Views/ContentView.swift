
import SwiftUI

struct ContentView: View {
    
//MARK: - Here we initial class NetworkManager() where we listen "posts" property by using @ObservedObject.
    
    @ObservedObject var networkingManager = NetworkManager()
    
//MARK: - Here we create view with button "Update" that trigger fuction fetchData() that update data for property "posts". Also on this view we create NavigationView with List of cells where we put data that we get from var networkingManager.posts and also when user tap on this cell we use NavigationLink method to switch him on the second screen where we upload url with this cell.
    
    var body: some View {
        VStack{
            Button("Update") {
                networkingManager.fetchData()
            }
            NavigationView {
                List(networkingManager.posts) { post in
                    NavigationLink(destination: DetailView(url: post.url)) {
                        HStack {
                            Text(String(post.points))
                            Text(post.title)
                        }
                    }
                }
                .navigationBarTitle("H4X0R NEWS ")
            }
            
//MARK: - Here we trigger networkingManager.fetchData() function when view did load. This function upload data for networkingManager.posts that we use in cells.
            
            .onAppear {
                self.networkingManager.fetchData()
            }
        }
    }
}

//MARK: - Here we initial this struct ContentView on the screen.
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
 
    
