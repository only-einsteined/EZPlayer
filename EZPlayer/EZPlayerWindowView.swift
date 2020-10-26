//
//  EZPlayerFloatView.swift
//  EZPlayer
//
//  Created by yangjun zhu on 2016/12/28.
//  Copyright © 2016年 yangjun zhu. All rights reserved.
//

import UIKit

open class EZPlayerWindowView: UIView, EZPlayerCustomAction {
    public var autohidedControlViews = [UIView]()


    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */

    weak public var player: EZPlayer?
    public func playPauseButtonPressed(_ sender: Any){
    }
    public func fullEmbeddedScreenButtonPressed(_ sender: Any){
    }
    public func audioSubtitleCCButtonPressed(_ sender: Any){
    }

    @IBAction public func backButtonPressed(_ sender: Any){
        guard let player = self.player else {
            return
        }
        let displayMode = player.displayMode
        if displayMode == .float {
            if player.lastDisplayMode == .embedded{
                player.toEmbedded()
            }else  if player.lastDisplayMode == .fullscreen{
                player.toFull()
            }
        }
        self.player?.backButtonBlock?(.float)
    }

    @IBAction public func closeButtonPressed(_ sender: Any){
        self.player?.stop()
    }

}


extension EZPlayerWindowView: EZPlayerGestureRecognizer {

    public func player(_ player: EZPlayer, singleTapGestureTapped singleTap: UITapGestureRecognizer)
    {
        if player.isPlaying {
            player.pause()
        }else{
            player.play()
        }
    }

    public func player(_ player: EZPlayer, doubleTapGestureTapped doubleTap: UITapGestureRecognizer) {
        player.toFull()
    }


}
