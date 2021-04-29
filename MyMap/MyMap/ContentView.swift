//
//  ContentView.swift
//  MyMap
//
//  Created by kawarimidoll on 2021/04/29.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State var inputText: String = ""
    @State var dispSearchKey: String = ""

    @State var dispMapType: MKMapType = MKMapType.standard

    var body: some View {
        VStack {
            TextField("Input keyword",
                      text: $inputText,
                      onCommit: {
                        dispSearchKey = inputText
                        print("keyword: " + dispSearchKey)
                      })
                .padding()

            ZStack(alignment: Alignment.bottomTrailing) {
                MapView(searchKey: dispSearchKey, mapType: dispMapType)

                Button(action: {
                    if dispMapType == MKMapType.standard {
                    dispMapType = MKMapType.satellite
                    } else if dispMapType == MKMapType.satellite {
                        dispMapType = MKMapType.hybrid
                    } else if dispMapType == MKMapType.hybrid {
                        dispMapType = MKMapType.satelliteFlyover
                    } else if dispMapType == MKMapType.satelliteFlyover {
                        dispMapType = MKMapType.hybridFlyover
                    } else if dispMapType == MKMapType.hybridFlyover {
                        dispMapType = MKMapType.mutedStandard
                    } else {
                        dispMapType = MKMapType.standard
                    }
                }) {
                    Image(systemName: "map")
                        .resizable()
                        .frame(width: 35.0, height: 35.0, alignment: .leading)
                }
                .padding(.trailing, 20.0)
                .padding(.bottom, 30.0)
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
