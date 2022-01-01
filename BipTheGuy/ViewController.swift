//
//  ViewController.swift
//  BipTheGuy
//
//  Created by Korlin Favara on 1/1/22.
//

import UIKit
import AVFAudio

class ViewController: UIViewController {
    @IBOutlet weak var UIButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func playSound(name: String) {
        if let sound = NSDataAsset(name: name) {
            do{
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch{
                print("ERROR: \(error.localizedDescription) Did not initialize AV Player")
            }
        } else{
            print("ERROR: Did not read sound")
        }
    }
    
    @IBAction func punchButtonPressed(_ sender: UIButton) {
        let originalFrame = imageView.frame
        let widthShrink: CGFloat = 30
        let heightShrink: CGFloat = 10
        let smallerFrame = CGRect(
            x: imageView.frame.origin.x + widthShrink,
            y: imageView.frame.origin.y + heightShrink,
            width: imageView.frame.width - (2 * widthShrink),
            height: imageView.frame.height - (2 * heightShrink))
        
        imageView.frame = smallerFrame
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10.0, animations: {self.imageView.frame = originalFrame})
        playSound(name: "punchSound")
        
    }
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        let originalFrame = imageView.frame
        let widthShrink: CGFloat = 30
        let heightShrink: CGFloat = 10
        let smallerFrame = CGRect(
            x: imageView.frame.origin.x + widthShrink,
            y: imageView.frame.origin.y + heightShrink,
            width: imageView.frame.width - (2 * widthShrink),
            height: imageView.frame.height - (2 * heightShrink))
        
        imageView.frame = smallerFrame
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10.0, animations: {self.imageView.frame = originalFrame})
        playSound(name: "punchSound")
        
    }
    
}

