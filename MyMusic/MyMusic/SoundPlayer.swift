//
//  SoundPlayer.swift
//  MyMusic
//
//  Created by kawarimidoll on 2021/04/29.
//

import UIKit
import AVFoundation

class SoundPlayer: NSObject {
    let cymbalData = NSDataAsset(name: "cymbalSound")!.data
    var cymbalPlayer: AVAudioPlayer!

    let guitarData = NSDataAsset(name: "guitarSound")!.data
    var guitarPlayer: AVAudioPlayer!

    func cymbalPlay() {
        do {
            cymbalPlayer = try AVAudioPlayer(data: cymbalData)
            cymbalPlayer.play()
        } catch {
            print("error is occurred on playing cymbal...")
        }
    }

    func guitarPlay() {
        do {
            guitarPlayer = try AVAudioPlayer(data: guitarData)
            guitarPlayer.play()
        } catch {
            print("error is occurred on playing guitar...")
        }
    }

}
