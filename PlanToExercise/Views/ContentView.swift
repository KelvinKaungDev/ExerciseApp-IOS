import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabView {
                Text("Welcome")
                    .tabItem { Text("Welcome") }
                Text("Exercise")
                    .tabItem { Text("Exercise 1") }
                Text("Exercise")
                    .tabItem { Text("Exercise 2") }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
