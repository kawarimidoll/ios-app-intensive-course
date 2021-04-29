//
//  ContentView.swift
//  MyMusic
//
//  Created by kawarimidoll on 2021/04/29.
//

import SwiftUI

struct ContentView: View {

    let soundPlayer = SoundPlayer()

    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)

            HStack {
                Button(action: {
                    soundPlayer.cymbalPlay()
                }) {
                    Image("cymbal")
                }

                Button(action: {
                    soundPlayer.guitarPlay()
                }) {
                    Image("guitar")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
