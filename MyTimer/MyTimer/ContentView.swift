//
//  ContentView.swift
//  MyTimer
//
//  Created by kawarimidoll on 2021/04/29.
//

import SwiftUI

struct ContentView: View {

    @State var timerHandler: Timer?
    @State var count = 0
    @AppStorage("timer_value") var timerValue = 10

    var body: some View {
        NavigationView {
            ZStack {
                Image("backgroundTimer")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)

                VStack(spacing: 30.0) {
                    Text("\(timerValue - count) sec...")
                        .font(.largeTitle)

                    HStack {
                        CircleButtonView(
                            buttonName: "start",
                            buttonAction: startTimer)

                        CircleButtonView(
                            buttonName: "stop",
                            buttonAction: {
                                if let unwrapedTimerHandler = timerHandler {
                                    if unwrapedTimerHandler.isValid == true {
                                        // stop timer
                                        timerHandler?.invalidate()
                                    }
                                }
                            })
                    }
                }
            }
            .navigationBarItems(
                trailing:
                    NavigationLink(destination: SettingView()) {
                        Text("Set time")
                    }
            )
        }
    }

    func countDownTimer() {
        count += 1

        if timerValue - count <= 0 {
            // stop timer
            timerHandler?.invalidate()
        }
    }

    func startTimer() {
        if let unwrapedTimerHandler = timerHandler {
            // isValid means the timier is running
            if unwrapedTimerHandler.isValid == true {
                return
            }
        }

        if timerValue - count <= 0 {
            count = 0
        }


        // schedule to call countDownTimer(),
        // repeatedly, with interval 1 second
        timerHandler = Timer.scheduledTimer(
            withTimeInterval: 1,
            repeats: true) {
            _ in
            countDownTimer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
