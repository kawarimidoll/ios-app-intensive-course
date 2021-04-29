//
//  ContentView.swift
//  MyJanken
//
//  Created by kawarimidoll on 2021/04/29.
//

import SwiftUI

struct ContentView: View {

    @State var answerNumber = 0
    @State var imageName = ""
    @State var buttonText = "Do Janken!"
    @State var messageText = "Let's Janken!"

    var body: some View {
        VStack {

            if imageName != "" {
                Spacer()
                
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }

            Spacer()

            Text(messageText)
                .padding()

            Button(action: {
                print("tapped!")
                if answerNumber == 0 {
                    buttonText = "One more play!"
                    answerNumber = Int.random(in: 1...3)

                    if answerNumber == 1 {
                        imageName = "gu"
                    } else if answerNumber == 2 {
                        imageName = "choki"
                    } else {
                        imageName = "pa"
                    }
                    messageText = "My hand is " + imageName + "!"
                } else {
                    buttonText = "Do Janken!"
                    answerNumber = 0
                    imageName = ""
                    messageText = "Let's Janken!"
                }

            }) {
                Text(buttonText)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .frame(height: 100)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color.white)
                    .background(Color.pink)
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
