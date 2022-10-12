//
//  ViewController.swift
//  ABCD Ap
//
//  Created by UKTechian on 01/10/2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player : AVAudioPlayer!
    
    let dict = ["a": "apple","b": "baseball","c": "clock","d": "donkey","e":"elephant","f": "father","g": "grand-mother","h":"hungry","i": "internet","j": "justice","k": "kangaroo","l": "london","m": "monkey","n": "norway","o": "overtime","p": "pillow","q": "question",
        "r": "rabbit","s": "superman","t": "telephone","u": "umbrella","v": "vacinate","w": "world-wide-web","x": "xylophone","y": "yogurt","z": "zebra"]

    @IBOutlet weak var textView: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    }
    
    @IBAction func pressToPlayASound(_ sender: UIButton){
        
        let sound = sender.titleLabel?.text
        
        imageView.image = UIImage.init(imageLiteralResourceName: dict[sound!.lowercased()]!)
        textView.text = dict[sound!.lowercased()]!.uppercased()
        playSound(val: sound!.lowercased())
        
    }
    
    func playSound(val sound: String) {
        
        guard let path = Bundle.main.path(forResource: sound, ofType:"mp3") else {
            return }
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }


}

