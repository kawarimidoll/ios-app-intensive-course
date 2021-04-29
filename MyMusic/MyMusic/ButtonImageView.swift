//
//  ButtonImageView.swift
//  MyMusic
//
//  Created by kawarimidoll on 2021/04/29.
//

import SwiftUI

struct ButtonImageView: View {

    let imageName: String

    var body: some View {
        Image(imageName)
    }
}

struct ButtonImageView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonImageView(imageName: "cymbal")
    }
}
