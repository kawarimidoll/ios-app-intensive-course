//
//  ContentView.swift
//  MyOkashi
//
//  Created by kawarimidoll on 2021/05/01.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var okashiDataList = OkashiData()
    @State var inputText = ""

    var body: some View {
        VStack {
            TextField("Input keyword", text: $inputText, onCommit: {
                okashiDataList.search(keyword: inputText)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
