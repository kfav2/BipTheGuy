//
//  ViewController.swift
//  BipTheGuy
//
//  Created by Korlin Favara on 1/1/22.
//

import UIKit
import AVFAudio

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil )
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
    @IBAction func photoOrCameraButtonPressed(_ sender: UIButton) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let PhotoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { (_) in
            // TO DO: Add button for photo library
        }
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (_) in
            // TO DO: Add button for camera
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
       
        alertController.addAction(PhotoLibraryAction)
        alertController.addAction(cameraAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
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

