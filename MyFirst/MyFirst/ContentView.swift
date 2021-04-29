//
//  ContentView.swift
//  MyFirst
//
//  Created by kawarimidoll on 2021/04/29.
//

import SwiftUI

struct ContentView: View {

    @State var outputText = "Hello, world!"
    @State var flg = true

    var body: some View {
        
        VStack {
            Text(outputText)
                .font(.largeTitle)
                .padding()
            
            Button(action: {
                outputText = flg ? "Hi, SwiftUI!" : "Hello, world!"
                flg = !flg

                print("Debug")
                print(outputText, flg)
            }) {
                Text("Change text")
                    .foregroundColor(Color.white)
                    .padding()
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

// ContentView_Previews doesn't make any part of real app.
// This is only needed to preview UI in Xcode.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
