//
//  ContentView.swift
//  Memorize
//
//  Created by Avanza on 01/03/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 30)
                .stroke(lineWidth: 3)
            Text("Hello, World!")
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
       
        
    }
}
