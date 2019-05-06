//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by Apple on 04/05/2019.
//  Copyright © 2019 RR Inc. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    private var audioRecorder: AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        stopRecordingButton.isEnabled = false
    }

    private func updateRecordingState(_ isRecording: Bool) {
        recordButton.isEnabled = !isRecording
        stopRecordingButton.isEnabled = isRecording
    }
    
    @IBAction func recordAudio(_ sender: Any) {
        recordingLabel.text = "Recording in Progress..."
        updateRecordingState(true)
        
        //start recording
        recordAudio()
    }
    
    @IBAction func stopRecording(_ sender: Any) {
        recordingLabel.text = "Recording stopped"
        updateRecordingState(false)
        stopAudioRecording()
    }
    
    private func recordAudio() {
        let directoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [directoryPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        print(filePath!)
        
        //get shared instance AV session
        let avAudioSession = AVAudioSession.sharedInstance()
        try! avAudioSession.setCategory(AVAudioSession.Category.playAndRecord, options: AVAudioSession.CategoryOptions.defaultToSpeaker)
        
        //initialize audio recorder
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.isMeteringEnabled = true
        audioRecorder.delegate = self
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    private func stopAudioRecording() {
        audioRecorder.stop()
        let avAudioSession = AVAudioSession.sharedInstance()
        try! avAudioSession.setActive(false)
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        } else {
            print("recording was not successful")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "stopRecording":
            let playSoundsViewController = segue.destination as! PlaySoundsViewController
            let recordedSoundUrl = sender as! URL
            playSoundsViewController.recordedAudioUrl = recordedSoundUrl
        default:
            print("Uknown segue")
        }
    }
}

