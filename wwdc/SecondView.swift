//
//  Second.swift
//  wwdc
//
//  Created by Michelle Han on 2/22/24.
//

import SwiftUI

struct SecondView: View {
    @State private var showDishDetail = false
    
    var body: some View {
        ZStack {
            Image("bg2")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Pick A Cuisine: ")
                    .font(.system(size: 45))
                    .fontWeight(.bold)
                    .padding(.bottom, 40)
                
                HStack(spacing: 15) {
                    NavigationLink(destination: OkiView()) {
                        Text("Japanese Cuisine: Okonomiyaki")
                            .foregroundColor(.white)
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 30)
                            .padding(.vertical, 25)
                            .background(Color(red: 246/255, green: 145/255, blue: 145/255))
                            
                    }
                    
                    Button(action: {
                        showDishDetail.toggle()
                    }) {
                        Image(systemName: "book")
                            .foregroundColor(.white)
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 30)
                            .padding(.vertical, 25)
                            .background(Color(red: 129/255, green: 174/255, blue: 149/255))
                            
                    }
                }
                .cornerRadius(15)
                .padding(.bottom, 20)
                
                Text("+ More dishes coming soon!")
                    .font(.system(size: 28))
                    .padding()
            }
            .padding()
        }
        .overlay(
            Group {
                if showDishDetail {
                    DishDetailView(onDismiss: { showDishDetail = false })
                        .frame(width: 600, height: 420)
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(radius: 10)
                        .padding()
                        .transition(.scale)
                }
            }, alignment: .center
        )
    }
}


struct DishDetailView: View {
    var onDismiss: () -> Void
    
    var body: some View {
        ScrollView {
                VStack {
                    HStack {
                        Spacer()
                        Button(action: onDismiss) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.red)
                                .font(.system(size: 22))
                                .padding()
                        }
                    }
                    .padding(.top, 10)
                    .padding(.trailing, 10)
                    .cornerRadius(20)
        
                    VStack(alignment: .leading, spacing: 18) {
                        HStack {
                            Text("🇯🇵 Okonomiyaki")
                                .font(.system(size: 35))
                                .fontWeight(.bold)
                            Image("oko")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 38)
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        
                        HStack(spacing: 5) {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(.white)

                            Text("EASY")
                                .font(.system(size: 12))
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                        }
                        .padding(10)
                        .background(Color(red: 223/255, green: 138/255, blue: 138/255))
                        .cornerRadius(10)                         .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.horizontal)
                        .padding(.bottom, 15)


                        HStack {
                            VStack{
                                Text("Description")
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    .font(.system(size: 20)).fontWeight(.bold).padding(.bottom, 8)
                                Text("Okonomiyaki is a Japanese pancake made with flour, eggs, and shredded cabbage, often mixed with seafood, meat, and vegetables.")
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.trailing, 15)
                            }
                            Image("okono")
                                .resizable()
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding(.trailing, 25)
                        }
                        .padding(.horizontal).padding(.bottom, 15)
        
                        HStack {
                            VStack{
                                Text("Origin")
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    .font(.system(size: 20)).fontWeight(.bold).padding(.bottom, 8)
                                Text("Originating from Japan, Okonomiyaki's name means \"grilled as you like it,\" reflecting its customizable nature.")
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.trailing, 15)
                            }
                            Image("japanmap")
                                .resizable()
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding(.trailing, 30)
                        }
                        .padding(.horizontal).padding(.bottom, 15)
                        
                        HStack {
                            VStack{
                                Text("Culture")
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    .font(.system(size: 20)).fontWeight(.bold).padding(.bottom, 8)
                                Text("Okonomiyaki is a social dish, and it embodies the communal aspect of Japanese dining culture, bringing people together through the shared experience of cooking and eating.")
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.trailing, 15)
                            }
                            Image("eato")
                                .resizable()
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding(.trailing, 30)
                        }
                        .padding(.horizontal).padding(.bottom, 15)
        
                    }
                    .padding(.horizontal).padding(.bottom, 35)
                }
            }
            .frame(width: 600, height: 420)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 10)
        }
        }

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}

