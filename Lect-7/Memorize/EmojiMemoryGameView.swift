//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Avanza on 01/03/2022.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        _AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
            if card.isMatched && !card.isFaceUp {
                Rectangle().opacity(0)
            }else{
                CardView(card: card)
                    .padding(4)
                    .onTapGesture{
                        game.choose(card)
                    }
            }
        }
        .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
        .padding(.horizontal)
    }
}

struct CardView: View {
    let card: EmojiMemoryGame.Card
     
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 100-90))
                    .padding(5)
                    .opacity(0.5)
                Text(card.content)
                    .rotationEffect(Angle.degrees(card.isMatched ? 360: 0))
//                placement of the animation-modifier do effect the overall picture.
                    .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
//                    .font(font(in: geometry.size))
                    .font(Font.system(size: DrawingConstants.fontSize))
                                        .scaleEffect(scale(thatFits: geometry.size))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    private func font(in size : CGSize) -> Font{
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    private func scale(thatFits size: CGSize) -> CGFloat{
           min(size.width, size.height) / (DrawingConstants.fontSize / DrawingConstants.fontScale)
       }
    private struct DrawingConstants {
        static let fontScale: CGFloat = 0.7
        static let fontSize: CGFloat = 32
    }
}
















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(game.cards.first!)
        return EmojiMemoryGameView(game: game)
        
    }
}
