//
//  Second.swift
//  wwdc
//
//  Created by Michelle Han on 2/22/24.
//

import SwiftUI

import Foundation

struct SecondView: View {
    var body: some View {
        VStack {
            Text("Pick the cuisine you want to cook today!").font(.system(size: 35))
            NavigationLink(destination: OkiView()) {
                Text("Japanese Cuisine: Okonomiyaki")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }
            Text("+ More dishes coming soon! ").font(.system(size: 25))
            .padding()
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
