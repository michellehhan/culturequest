import SwiftUI

struct ContentView: View {
    var body: some View {
//        NavigationView {
            ZStack {
                Image("bg_content")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    NavigationLink(destination: IntroView()) {
                        Text("Play!")
                            .foregroundColor(.white)
                            .padding(.horizontal, 100)
                            .padding(.vertical, 15)
                            .background(Color.green)
                            .cornerRadius(13)
                            .font(.system(size: 30))
                    }
                    .padding(.bottom, 135)
                }
            }
//        }
//        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
