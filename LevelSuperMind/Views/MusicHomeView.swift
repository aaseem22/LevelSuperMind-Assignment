import SwiftUI

struct MusicHomeView: View {
    @State private var textInput = ""
    
    let ViewButtons = ["Free", "For Study", "For Work", "For Focus"]
    
    var continuePlaying:[MusicCardData] = [
        MusicCardData( title: "Rain", songs: "2", xp: "5"),
        MusicCardData (title: "Sea", songs: "4", xp: "25"),
        MusicCardData( title: "Sand", songs: "6", xp: "45"),
        MusicCardData( title: "Wind", songs: "10", xp: "50"),
        MusicCardData( title: "Breezzee", songs: "2", xp: "5")
    ]
    
    var body: some View {
        NavigationStack{
            GeometryReader{ geometry in
                let screenWidth = geometry.size.width
                ZStack{
           
                    Color(.background).ignoresSafeArea()
                    Image("topBannerImage")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: .infinity, alignment: .top)
                        .ignoresSafeArea()
                    
                    VStack{
                        TopBar()
                        ScrollView{
                            SearchBar()
                                .padding()
                            
                            NavigationButtons()
                            
                            ContinuePlaying()
                            
                            RecommendedView()
                                .padding()
                            
                            Playlists(screenWidth: screenWidth)
                            
                            TrendingView()
                                .padding()
                            
                            Watermark()
                                .padding()
                            
                        }
                    }
                    
                    
                }
                
            }
        }
    }
    //MARK: - TopBar
    @ViewBuilder
    private func TopBar() -> some View{
        HStack{
            Image(systemName: "arrowshape.backward.fill")
                .foregroundColor(.white)
                .padding(.trailing,12)
            Text("Music")
                .font(.title2)
                .frame(maxWidth:.infinity,alignment: .leading)
                .foregroundStyle(.white)
            Spacer()
            Image("topFavoriteIcon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
                .frame(width: 34,height: 34)
                .padding(.trailing,8)
            Image("topDownloadIcon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
                .frame(width: 34,height: 34)
            
        }
    }
    //MARK: - SearchBar
    private func SearchBar() -> some View{
        HStack{
            Image(systemName: "magnifyingglass")
                .padding(.horizontal)
            TextField(
                "Enter First Name..",
                text: $textInput
            )
        }
        .padding()
        .background(.white)
        .cornerRadius(30)
        .textFieldStyle(PlainTextFieldStyle())
        
    }
    //MARK: - Navigation Buttons
    @ViewBuilder
    private func ViewButtons(name:String) -> some View{
        
        Text(name)
            .font(.callout)
            .foregroundStyle(.white)
            .frame(height: 10)
            .padding()
            .background{
                
                ZStack{
                    Capsule()
                        .foregroundStyle(.viewbutton)
                    
                    Capsule()
                        .stroke(lineWidth: 2)
                        .foregroundStyle(.white.opacity(0.2))
                    
                    
                }
                
            }
    }
    
    @ViewBuilder
    private func NavigationButtons() -> some View{
        HStack{
            ForEach(ViewButtons, id: \.self){ button in
                NavigationLink(destination: PlaylistView()){
                    ViewButtons(name: button)
                }
            }
        }
    }
    //MARK: - Continue Playing
    @ViewBuilder
    private func ContinuePlaying() -> some View{
        VStack{
            Text("Continue Playing")
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.white)
                .padding()
            
            ScrollView(.horizontal){
                HStack(spacing:10){
                    ForEach(continuePlaying,id:\.self){ card in
                        NavigationLink(destination: AudioPlaybackView( audioName: "Connect Mind")){
                            MusicCard(card: card)
                        }
                        
                    }
                } .padding(.horizontal)
            }
            .padding(.horizontal)
            .scrollContentBackground(.hidden)
            .scrollIndicators(.hidden)
        }
    }
    
    //MARK: - Playlists
    @ViewBuilder
    private func Playlists(screenWidth: CGFloat) -> some View{
        ZStack{
            Image("musicPlaylistBackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: screenWidth)
                .frame(height: 350)
            PlaylistScrollView()
        }
    }
    
    //MARK: - watermark
    @ViewBuilder
    private func Watermark() -> some View {
        VStack(spacing:4){
            Text("Made Mindfully in 🇮🇳")
                .foregroundStyle(.white.opacity(0.4))
                .font(.system(size: 16, weight: .regular))
                .frame(maxWidth: .infinity,alignment:.leading)
            
            
            
            Text("Supercharge")
                .foregroundStyle(.white.opacity(0.4))
                .font(.system(size: 36, weight: .bold))
                .frame(maxWidth: .infinity,alignment:.leading)
            
            
            Text("your Mind")
                .foregroundStyle(.white.opacity(0.4))
                .font(.system(size: 36, weight: .bold))
                .frame(maxWidth: .infinity,alignment:.leading)
            
            
        }
    }
}

#Preview {
    MusicHomeView()
}
