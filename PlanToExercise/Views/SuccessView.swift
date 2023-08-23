//
//  SuccessView.swift
//  PlanToExercise
//
//  Created by Kelvin Gao  on 18/8/2566 BE.
//

import SwiftUI

struct SuccessView: View {
    @Binding var selectedTab : Int
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Spacer()
            
               Image("waving-hand")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 100)
                Text("High Five")
                    .font(.title)
                    .foregroundColor(.purple)
                    .bold()
                Text("For the three small lines of text, you could use three Text views. Or refer to our Swift Style Guide bit.ly/30cHeeL to see how to create a multi-line string. Text has a multilineTextAlignment modifier. This text is colored gray")
                    .font(.system(size: 20))
                    .padding()
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
            
            Spacer()
            
                Button("Continue") {
                    selectedTab = 9
                    presentationMode.wrappedValue.dismiss()
                }.padding(.bottom)
        }
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView(selectedTab: .constant(3))
    }
}
