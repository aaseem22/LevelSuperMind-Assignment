import SwiftUI

struct RecommendedView: View {
    @State private var selectedTab: Int = 0
    private let totalCards = 3
    
    var body: some View {
        VStack {
            Text("Recommended for you")
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .foregroundStyle(.white)
            
            TabView(selection: $selectedTab) {
                ForEach(0..<totalCards, id: \.self) { index in
                    RotationCardView(cardIndex: index, totalCards: totalCards, selectedTab: $selectedTab)
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: 200)
            
           
           
        }

    }
}

struct RotationCardView: View {
    let cardIndex: Int
    var totalCards: Int

    @Binding var selectedTab: Int

    var body: some View {
        HStack(alignment: .top) {
            Image("staticSquareThumbnailIcon")
                .resizable()
                .frame(width: 150, height: 150)
                .cornerRadius(25, corners: [.allCorners])
                .overlay{
                    Image("play_circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                }
               

            VStack(spacing: 10) {
                Text("Music•Spiritual Mantras")
                    .bold()
                    .foregroundStyle(.teal)
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Om Chanting")
                    .bold()
                    .foregroundStyle(.white)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("30 min • 10 XP")
                    .bold()
                    .foregroundStyle(.white)
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                HStack(spacing: 10) {
                    ForEach(0..<totalCards, id: \.self) { index in
                        Circle()
                            .fill(index == selectedTab ? Color.white : Color.gray)
                            .frame(width: 10, height: 10)
                    }
                }
            }
        }
        .frame(height: 150)
        .padding()
    }
}

#Preview {
    RecommendedView()
}
