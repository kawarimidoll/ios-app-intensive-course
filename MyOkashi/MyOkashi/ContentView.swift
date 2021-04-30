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
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
