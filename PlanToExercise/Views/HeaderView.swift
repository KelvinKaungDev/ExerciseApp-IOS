//
//  HeaderView.swift
//  PlanToExercise
//
//  Created by Kelvin Gao  on 15/8/2566 BE.
//

import SwiftUI

struct HeaderView: View {
    @Binding var selectedTab : Int
    let titleText : String
    
    var body: some View {
        VStack {
            Text(titleText)
                .font(.largeTitle)
            HStack {
                ForEach(0..<Exercise.exercises.count, id : \.self) { index in
                    let imageFill = index == selectedTab ? ".fill" : ""
                    Image(systemName: "\(index + 1).circle\(imageFill)")
                        .onTapGesture {
                            selectedTab = index
                        }
                }
            }
            .font(.title2)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeaderView(selectedTab: .constant(1), titleText: "Squat")
            .previewLayout(.sizeThatFits)
        }
    }
}
