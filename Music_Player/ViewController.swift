//
//  ViewController.swift
//  Music_Player
//
//  Created by Kimaya Desai on 10/10/17.
//  Copyright © 2017 SDSU. All rights reserved.
//

import UIKit
import MediaPlayer


class ViewController: UIViewController {

    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func genreButtonTapped(_ sender: UIButton) {
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized{
                self.playGenre(genre: sender.currentTitle!)
            }
        }
    }
        
    @IBAction func stopTapp(_ sender: UIButton) {
        musicPlayer.stop()
    }
    
    @IBAction func nextTapp(_ sender: UIButton) {
        musicPlayer.skipToNextItem()
    }
    
    func playGenre(genre: String){
        musicPlayer.stop()
        
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value:genre,forProperty:MPMediaItemPropertyGenre)
        query.addFilterPredicate(predicate)
        
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
        
        
    }

}

