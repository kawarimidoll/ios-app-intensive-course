//
//  ContentView.swift
//  MyMap
//
//  Created by kawarimidoll on 2021/04/29.
//

import SwiftUI

struct ContentView: View {
    @State var inputText: String = ""
    @State var dispSearchKey: String = ""

    var body: some View {
        VStack {
            TextField("Input keyword",
                      text: $inputText,
                      onCommit: {
                        dispSearchKey = inputText
                        print("keyword: " + dispSearchKey)
                      })
                .padding()

            MapView(searchKey: dispSearchKey)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
