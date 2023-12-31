import SwiftUI
import AVKit

struct ExerciseView: View {
    @Binding var selectedTab: Int
    
    @State private var rating = 0
    @State var showSuccess : Bool = false
    
    @Binding var showHistory : Bool
    @EnvironmentObject var history : HistoryStore
//    @EnvironmentObject var history : HistoryStore
    
    let index : Int
    @State private var timerDone = false
    @State private var showTimer = false
    
    var lastExercise : Bool {
        index + 1 == Exercise.exercises.count
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HeaderView(selectedTab: $selectedTab,titleText: Exercise.exercises[index].exerciseName)
                    .previewLayout(.sizeThatFits)
                    .padding(.bottom, 30)
                
                if let url = Bundle.main.url(forResource: Exercise.exercises[index].videoName, withExtension: "mp4") {
                    VideoPlayer(player: AVPlayer(url: url))
                        .frame(height: geometry.size.height * 0.45)
                } else {
                    Text("Couldn’t find \(Exercise.exercises[index].videoName).mp4")
                        .foregroundColor(.red)
                }
                
                HStack(spacing: 150) {
                    Button("Start Exercise") {
                        showTimer.toggle()
                    }
                    Button("Done") {
                        history.addDoneExercise(Exercise.exercises[index].exerciseName)
                        timerDone = false
                        showTimer.toggle()
                        
                        if lastExercise {
                            showSuccess.toggle()
                        } else {
                            selectedTab += 1
                        }
                    }.disabled(!timerDone)
                    .sheet(isPresented: $showSuccess) {
                        SuccessView(selectedTab: $selectedTab)
                      }
                }
                
                if showTimer {
                    TimerView(timerDone: $timerDone)
                }
  
                RatingView(rating: $rating)
                    .padding()
                Spacer()
                Button("History".localized()) {
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

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(selectedTab: .constant(9),showHistory: .constant(false), index: 1)
            .environmentObject(HistoryStore())
    }
}


