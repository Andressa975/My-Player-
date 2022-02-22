//
//  PlayerViewController.swift
//  My Player
//
//  Created by Andressa Santos on 17/02/22.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {
    
    @IBOutlet weak var sliderVolume: UISlider!
    @IBAction func volume(_ sender: Any) {
        player?.volume = sliderVolume.value
    }
    
    var player: AVAudioPlayer?
    var arinaButton = "pov"
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func arianaButton(_ sender: UIButton) {
    
        if (sender.titleLabel?.text! == "Play"){
            playSound(musicName:"positions")
            
            
        }
    }

    
       
    
    func playSound(musicName: String){
        guard let url = Bundle.main.url(forResource: musicName, withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            guard let player = player else {return}
            
            player.play()
            
        }catch let error{
            print(error.localizedDescription)
        }
        


    }
    @IBAction func stopButton(_ sender: Any) {
        player?.stop()
        player?.currentTime = 0
        
        let alerta = UIAlertController(title: "Por que parou?", message: "Parou por quê? ", preferredStyle: .alert)
        
        let confirmar = UIAlertAction(title: "Confirmar", style: .default) { acao in
            print("Botao confirmar pressionado ")        }
        
        alerta.addAction(confirmar)
        
        present(alerta, animated: true, completion: nil)
        
    }

}
