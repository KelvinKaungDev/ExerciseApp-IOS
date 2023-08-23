import SwiftUI

struct RatingView: View {
    @Binding var rating : Int
    let maxRating : Int = 5
    let onColor = Color.red
    let offColor = Color.gray
    
    var body: some View {
        HStack {
          ForEach(1 ..< (maxRating + 1)) { index in
            Image(systemName: "waveform.path.ecg")
              .foregroundColor(
                index > rating ? offColor : onColor
              )
              .onTapGesture {
                  print("rating \(rating)")
                  rating = index
                  print(index)
                  print("rating \(rating)")
              }
        }
        }.font(.largeTitle)
    }
}
