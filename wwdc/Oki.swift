//
//  Oki.swift
//  wwdc
//
//  Created by Michelle Han on 2/22/24.
//

import SwiftUI

struct OkiView: View {
    let ingredients: [Ingredient] = japanIngredients
    
    let boardImages = ["boardo", "boardo1", "boardo2", "boardo3", "boardo4", "boardo5", "boardo6", "boardo7", "boardo8", "boardo9", "boardo10", "boardo11", "boardo12", "boardo13", "boardo14", "boardo15"]
    @State private var currentBoardIndex = 0
    @State private var selectedIngredient: Ingredient? = nil
    @State private var isShowingDetail = false
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let recipeSteps = [
        "Okonomiyaki Recipe! ",
        "1. Chop cabbage and green onion finely.",
        "1. Chop cabbage and green onion finely.",
        "1. Chop cabbage and green onion finely.",
        "1. Chop cabbage and green onion finely.",
        "2. Mix cabbage, green onion, flour, and eggs to form a batter.",
        "2. Mix cabbage, green onion, flour, and eggs to form a batter.",
        "2. Mix cabbage, green onion, flour, and eggs to form a batter.",
        "3. Pour the batter onto a hot griddle.",
        "4. Add the sliced pork belly on top.",
        "4. Add the sliced pork belly on top.",
        "5. Flip the pancake once the bottom is browned and cook until the other side is done.",
        "5. Flip the pancake once the bottom is browned and cook until the other side is done.",
        "6. Drizzle with Okonomiyaki sauce, mayonnaise, and sprinkle bonito flakes.",
        "6. Drizzle with Okonomiyaki sauce, mayonnaise, and sprinkle bonito flakes.",
        "Enjoy your Okonomiyaki!! "
    ]
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack(alignment: .topLeading) {
                    Image("background")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                    
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "arrow.left.circle.fill")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .foregroundColor(.blue)
                            .padding(.leading, 35).padding(.top, 24)
                        }
                    
                    VStack {
                        Spacer().frame(height: geometry.safeAreaInsets.top)
                        
                        Text("🇯🇵 Okonomiyaki")
                            .font(.system(size: geometry.size.width * 0.05))
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal)
                            .padding(.bottom, 10)
                        
                        Text("INGREDIENTS")
                            .font(.system(size: geometry.size.width * 0.014))
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding(12).padding(.horizontal, 7)
                            .background(Color(red: 223/255, green: 138/255, blue: 138/255))
                            .cornerRadius(10)
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal)
                            .padding(.bottom, 20)
                        
                        // Ingredients List
                        HStack{
                            ForEach(ingredients) { ingredient in
                                VStack {
                                    Image(ingredient.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: geometry.size.width / CGFloat(ingredients.count) - 50, height: 105)
                                    
                                    Button(action: {
                                        self.selectedIngredient = ingredient
                                        self.isShowingDetail = true
                                    }) {
                                        Image(systemName: "info.circle")
                                            .foregroundColor(.blue)
                                    }.padding(.top, 15)
                                }.padding(.top, 10)
                            }
                        }
                        .padding(.horizontal).padding(.bottom, 40)
                        
                        
                        Text(recipeSteps[currentBoardIndex])
                            .font(.system(size: 30, weight: .semibold))
                            .padding(.bottom, 10)
                            .transition(.slide)

                        Image(boardImages[currentBoardIndex])
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.4)
                                                    .padding()
                                                

                        
                        Button("Next Step!") {
                            if currentBoardIndex < boardImages.count - 1 {
                                currentBoardIndex += 1
                            } else {
                                currentBoardIndex = 0
                            }
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                                               
                        
                        Spacer()
                    }
                }
                .overlay(
                    Group {
                        if let ingredient = selectedIngredient, isShowingDetail {
                            IngredientDetailView(ingredient: ingredient, onFavoriteToggle: {
                                // Handle the favorite toggle action here.
                                // Update the ingredient's favorite status in your data model.
                            }, onDismiss: {
                                self.isShowingDetail = false
                            })
                        }
                    }, alignment: .center
                )
            }
        }.navigationBarHidden(true) 
    }
}


struct IngredientDetailView: View {
    var ingredient: Ingredient
    var onFavoriteToggle: () -> Void
    var onDismiss: () -> Void
    
    var body: some View {
        ScrollView {
        VStack {
            HStack {
                Spacer()
                Button(action: onDismiss) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.red)
                        .padding()
                }
            }
            .padding(.top, 10)
            .padding(.trailing, 10)
            .cornerRadius(20)

            
                VStack(alignment: .leading, spacing: 18) {
                    HStack {
                        Text(ingredient.name)
                            .font(.system(size: 45))
                            .fontWeight(.bold)
                        Image(ingredient.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 45)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                    HStack{
                        Button(action: onFavoriteToggle) {
                            Image(systemName: ingredient.isFavorite ? "heart.fill" : "heart")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(ingredient.isFavorite ? .red : .gray)
                        }.padding(.trailing, 8)
                        Button(action: {}) {
                            Image(systemName: "square.and.arrow.up")
                                .foregroundColor(.gray)
                                .font(.system(size: 25))
                        }
                    }.frame(maxWidth: .infinity, alignment: .center)

                    SectionView(title: "Description", text: ingredient.info)
                    SectionView(title: "Cultural Significance", text: ingredient.culture)

                    Text("Origin")
                        .font(.headline)

                    Image(ingredient.mapImage)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)

                    SectionView(title: "Nutritional Info", text: ingredient.nutr)
                    SectionView(title: "Recipes & Uses", text: ingredient.recAndUse)

                }
                .padding()
            }
        }
        .frame(width: 600, height: 420)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}



struct SectionView: View {
    let title: String
    let text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .padding(.top, 10)
            Text(text)
                .padding(.top, 5)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}

struct OkiView_Previews: PreviewProvider {
    static var previews: some View {
        OkiView()
    }
}
