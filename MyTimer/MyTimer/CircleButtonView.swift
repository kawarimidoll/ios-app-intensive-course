//
//  CircleButtonView.swift
//  MyTimer
//
//  Created by kawarimidoll on 2021/04/30.
//

import SwiftUI

struct CircleButtonView: View {

    let buttonName: String
    let buttonAction: (() -> Void);

    var body: some View {
        Button(action: buttonAction) {
            Text("\(buttonName.capitalized)!")
                .font(.title)
                .foregroundColor(Color.white)
                .frame(width: 140, height: 140)
                .background(Color("\(buttonName.lowercased())Color"))
                .clipShape(Circle())
        }
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonView(
            buttonName: "start",
            buttonAction: {})
    }
}
