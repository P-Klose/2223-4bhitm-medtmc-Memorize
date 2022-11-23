//
//  ContentView.swift
//  Memorize
//
//  Created by Peter Klose on 28.09.22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))],
                      content: {
                ForEach(viewModel.cards) { card in
                    CardView(card: card).onTapGesture {
                        viewModel.choose(card)
                    }
                }
            })
        }
        
    }
}

struct CardView: View {
    var card: ViewModel.Card
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if !card.isMached{
                if card.isFaceUp {
                shape
                        .strokeBorder(lineWidth: 5,antialiased: true)
                        .padding()
                Text(card.content)
                }else{
                    shape
                        .fill()
                        .padding()
                }
            }
    
        }
        .foregroundColor(.red)
        .aspectRatio(2/3, contentMode: .fit)
    }
}

struct ContentView_Previews: PreviewProvider {
    static let viewModel = ViewModel()
    static var previews: some View {
        ContentView(viewModel: viewModel)
            .previewInterfaceOrientation(.portrait)
        //ContentView()
        //    .preferredColorScheme(.dark)
    }
}
