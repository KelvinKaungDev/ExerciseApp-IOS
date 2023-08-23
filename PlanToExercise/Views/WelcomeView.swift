import SwiftUI

struct WelcomeView: View {
    @Binding var selectedTab: Int
    @Binding var showHistory : Bool
    @EnvironmentObject var history : HistoryStore
    var body: some View {
        ZStack {
            VStack {
                Text("Welcome".localized())
                Spacer()
                HStack {
                    VStack(alignment: .leading) {
                        Text("Get Fit".localized())
                            .font(.largeTitle)
                      Text("with high intensity interval training")
                        .font(.headline)
                    }
                    Image("step-up")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width : 200, height : 200)
                        .clipShape(Circle())
                }
                Button(action: { selectedTab = 0 }) {
                    Label("Get Started".localized(), systemImage: "arrow.right.circle")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray, lineWidth: 2)
                        )
                }
                Spacer()
                Button("History") {
                    showHistory.toggle()
                }
                .sheet(isPresented: $showHistory) {
                    HistoryView(showHistory: $showHistory)
                }
                .padding(.bottom)
            }
        }
    }
}

//extension Image {
//    func resizedToFill(width : CGFloat, height : CGFloat) -> some View{
//        return self
//            .resizable()
//            .aspectRatio(contentMode: .fill)
//            .frame(width : width, height : height)
//    }
//}


struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(selectedTab: .constant(9), showHistory: .constant(false))
            .environmentObject(HistoryStore())
    }
}
