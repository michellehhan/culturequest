//
//  IntroView.swift
//  wwdc
//
//  Created by Michelle Han on 2/25/24.
//

import Foundation

import SwiftUI

struct IntroView: View {
    @State private var isNavigationActive = false

    var body: some View {
//        NavigationStack {
            ZStack {
                Image("bg3")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)

                VStack{
                    Spacer()
                    Spacer()
                    Spacer()

                    NavigationLink(destination: SecondView()) {
                        Text("Start Exploring!")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 50)
                            .padding(.vertical, 20)
                            .background(Color.green)
                            .cornerRadius(15)
                            .font(.system(size: 30))
                    }
                    .padding(.bottom, 65)
                    Spacer()

                }
//            }
//            .navigationBarHidden(true)
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}

