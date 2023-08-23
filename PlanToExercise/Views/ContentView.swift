import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 9
    @State var showHistory : Bool = false
    
    var body: some View {
        VStack {
            TabView(selection: $selectedTab) {
                WelcomeView(selectedTab: $selectedTab, showHistory: $showHistory)
                ForEach(0 ..< 4) { index in
                    ExerciseView(selectedTab: $selectedTab, showHistory: $showHistory, index: index)
                }
            }
            .environmentObject(HistoryStore())
        }
        
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
