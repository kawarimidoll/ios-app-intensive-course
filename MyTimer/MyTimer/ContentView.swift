//
//  ContentView.swift
//  MyTimer
//
//  Created by kawarimidoll on 2021/04/29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("backgroundTimer")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)

                VStack(spacing: 30.0) {
                    Text("10 sec...")
                        .font(.largeTitle)

                    HStack {
                        CircleButtonView(buttonName: "start")
                        CircleButtonView(buttonName: "stop")
                    }
                }
            }
            .navigationBarItems(trailing:
                                    NavigationLink(destination: SettingView()) {
                                        Text("Set time")
                                    }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
