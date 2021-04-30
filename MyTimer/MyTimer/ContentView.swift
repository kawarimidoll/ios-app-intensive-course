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

    @State var showAlert = false

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
                                if timerRunning() {
                                    // stop timer
                                    timerHandler?.invalidate()
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
            .onAppear{
                count = 0
                timerHandler?.invalidate()
            }
            .alert(isPresented: $showAlert) {Alert(title: Text("Finish!"),
                             message: Text("It's time!"),
                             dismissButton: .default(Text("OK")))
            }
        }
    }

    func countDownTimer() {
        count += 1

        if timerValue - count <= 0 {
            // stop timer
            timerHandler?.invalidate()

            showAlert = true
//            count = 0
        }
    }

    func timerRunning() -> Bool {
        // isValid means the timier is running
        if let unwrapedTimerHandler = timerHandler,
           unwrapedTimerHandler.isValid {
            return true
        }
        return false
    }

    func startTimer() {
        if timerRunning() {
            return
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
