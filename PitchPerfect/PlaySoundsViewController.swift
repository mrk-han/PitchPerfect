//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Mark Han on 2/7/22.
//  Copyright © 2022 Udacity. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet var snailButton: UIButton!
    @IBOutlet var rabbitButton: UIButton!
    
    @IBOutlet var chipmunkButton: UIButton!
    @IBOutlet var vaderButton: UIButton!
    @IBOutlet var echoButton: UIButton!
    @IBOutlet var reverbButton: UIButton!
    
    @IBOutlet var stopButton: UIButton!
    
    var recordedAudioURL:URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!

    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }

    @IBAction func playSoundForButton(_ sender: UIButton) {
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }

        configureUI(.playing)
    }

    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        stopAudio()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
    
}
