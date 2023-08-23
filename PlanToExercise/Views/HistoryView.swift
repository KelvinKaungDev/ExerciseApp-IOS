import SwiftUI

struct HistoryView: View {
    
    @Binding var showHistory : Bool
    @EnvironmentObject var history : HistoryStore
    
    var today = Date()
    var yesterday = Date().addingTimeInterval(-86400)
    
    var body: some View {
        ZStack (alignment: .topTrailing) {
            VStack {
                Text("History".localized())
                    .font(.title)
                    .padding()
                Form {
                  ForEach(history.exerciseDays) { day in
                    Section(
                      header:
                        Text(day.date.formatted(as: "MMM d"))
                        .font(.headline)) {
                      ForEach(day.exercises, id: \.self) { exercise in
                        Text(exercise)
                      }
                } }
                }
            }
            
            Button (action: {showHistory.toggle()}) {
                Image(systemName: "xmark.circle")
                    .font(.title)
                    .padding(.trailing)
                    .foregroundColor(.black)
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(showHistory: .constant(true))
            .environmentObject(HistoryStore())
    }
}
