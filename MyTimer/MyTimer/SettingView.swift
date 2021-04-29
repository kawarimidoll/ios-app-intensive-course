//
//  SettingView.swift
//  MyTimer
//
//  Created by kawarimidoll on 2021/04/29.
//

import SwiftUI

struct SettingView: View {

    @State var timerValue = 10
    var body: some View {
        VStack {
            ZStack {
                Color("backgroundSetting")
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    Spacer()

                    Text("\(timerValue) sec")
                        .font(.largeTitle)

                    Spacer()

                    Picker(selection: $timerValue,
                           label: Text("Select time")) {
                        Text("10").tag(10)
                        Text("20").tag(20)
                        Text("30").tag(30)
                        Text("40").tag(40)
                        Text("50").tag(50)
                        Text("60").tag(60)
                    }

//                    Spacer()
                }
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
