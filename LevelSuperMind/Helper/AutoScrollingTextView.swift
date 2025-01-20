
import SwiftUI

struct AutoScrollingTextView: View {
    let audioName: String
    var width: CGFloat = 240
    @State private var scrollOffset: CGFloat = 0
    @State private var timer: Timer? = nil

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            Text(audioName)
                .font(.title2)
                .foregroundStyle(.white)
                .bold()
                .padding(.horizontal, width)
        }
        .frame(width: width)
        .scrollIndicators(.hidden)
        .onAppear {
            startScrolling()
        }
        .onDisappear {
            stopScrolling()
        }
        .offset(x: -scrollOffset)
    }

    private func startScrolling() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { _ in
            withAnimation(.linear(duration: 0.02)) {
                scrollOffset += 1
            }

            
            if scrollOffset > CGFloat(audioName.count * 12) {
                scrollOffset = 0
            }
        }
    }

    private func stopScrolling() {
        timer?.invalidate()
        timer = nil
    }
}
