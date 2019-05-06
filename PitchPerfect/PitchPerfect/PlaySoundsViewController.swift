//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Apple on 06/05/2019.
//  Copyright © 2019 RR Inc. All rights reserved.
//

import UIKit

class PlaySoundsViewController: UIViewController {
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioUrl: URL!
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        print("Play sound button pressed")
    }
    
    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        print("stop button pressed")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
