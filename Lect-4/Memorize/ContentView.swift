//
//  ContentView.swift
//  Memorize
//
//  Created by Avanza on 01/03/2022.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var viewModel: EmojiMemoryGame
    var body: some View {
        
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    ForEach(viewModel.cards){ card in
                        CardView(card: card).aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture{
                                viewModel.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
        
        .padding(.horizontal)
    }
}

struct CardView: View {

    let card: MemoryGame<String>.Card
    var body: some View {
        ZStack{
            let shape =  RoundedRectangle(cornerRadius: 30)
            if card.isFaceUp{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched{
//                0 means transparent , and 1 is fully visible 
                shape.opacity(0)
            }
            else{
                shape.fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
        
    }
}
