import SwiftUI

struct TimerView: View {
    @State private var timeRemaining = 7
    @Binding var timerDone: Bool
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Text("\(timeRemaining)") // 5
          .font(.system(size: 90, design: .rounded))
          .padding()
          .onReceive(timer) { _ in
              if timeRemaining > 0 {
                  timeRemaining -= 1
              } else {
                  timerDone = true
              }
          }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(timerDone: .constant(false))
    }
}
