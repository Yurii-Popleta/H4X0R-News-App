
//MARK: - Here we create struct that have struct WebView that we use in struct ContentView in order to switch user on second screen and upload url for current cell in browser.

import SwiftUI

struct DetailView: View {
    let url: String?
    
    var body: some View {
       WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}

