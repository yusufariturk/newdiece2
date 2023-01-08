//
//  ViewController.swift
//  myDiecePlayGame
//
//  Created by yusuf ariturk on 1/7/23.
//

import UIKit

class ViewController: UIViewController {
    
    //Labels and Images my Connections
    
    @IBOutlet weak var labelPlayerfirst: UILabel!
    @IBOutlet weak var labelPlayerSecond: UILabel!
    @IBOutlet weak var labelPlayerFirstPuan: UILabel!
    @IBOutlet weak var labelPlayerSeconsPuan: UILabel!
    @IBOutlet weak var ImageStatusleft: UIImageView!
    @IBOutlet weak var ImageStatusRight: UIImageView!
    @IBOutlet weak var ImageDieceLeft: UIImageView!
    @IBOutlet weak var ImageDieceRight: UIImageView!
    @IBOutlet weak var labelResult: UILabel!
    
    var playerPuans  = (firstplayir : 0, secondplayer : 0)
    var playerScors = (firstPlayerScor : 0, seconPlayerScor : 0)
    var playerSequence : Int = 1
    
    var maxSet : Int = 5
    var nowSet : Int = 1
    
    
    
    
    
//    IMAGE ESKİ YÖNTEM
//    var zar1 = UIImage(named: "1")
//    var zar2 = UIImage(named: "2")
//    var zar3 = UIImage(named: "3")
//    var zar4 = UIImage(named: "4")
//    var zar5 = UIImage(named: "5")
//    var zar6 = UIImage(named: "6")
    
    
    
    
    
    
//VİEW CONTROL İÇERİĞİ
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
    }
    
    
    
//    SALLAMA METODU VE KODU (motionend)
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        print("sallandı")
        
        
//        IMAGE ESKİ YÖNTEM
//        let ImagesDieces = [zar1, zar2, zar3, zar4, zar5, zar6]
//        ImageDieceLeft.image = ImagesDieces[Int.random(in: 0...5)]
//        ImageDieceRight.image = ImagesDieces[Int.random(in: 0...5)]
        
        if nowSet > maxSet {
            if playerScors.firstPlayerScor > playerScors.seconPlayerScor {
                labelResult.text = "winner of the game first player"
            } else {
                labelResult.text = "winner of the game second player"
            }
        }

        madeDiece()
        
    }
    
    
    
    
//    FUNC OLUŞTURARAK INT DEĞER SONUÇŞARI YAPIYORUZ
    
   
    //  IMAGE YENİ YÖNTEM
//    FUNC OLUŞTURARAK IMAGES ÇALIŞIYOR
    func madeDiece(){

//        Rakamlardam ımage oluşturduğum için kolay bir şekilde okudu
        let diece1 = arc4random_uniform(6) + 1
        let diece2 = arc4random_uniform(6) + 1

        ImageDieceLeft.image = UIImage(named: String(diece1))
        ImageDieceRight.image = UIImage(named: String(diece2))
        
        resultDieces(diece1: Int(diece1), diece2: Int(diece2))
        
    }
    
    func resultDieces(diece1 : Int, diece2 : Int){
        if playerSequence == 1 {
            playerPuans.firstplayir = diece1 + diece2
            labelPlayerFirstPuan.text = String(playerPuans.firstplayir)
            ImageStatusleft.image = UIImage(named: "bekle")
            ImageStatusRight.image = UIImage(named: "onay")
            labelResult.text = "second player's turn"
            playerSequence = 2
            labelPlayerSeconsPuan.text = "0"
        } else {
            
            playerPuans.secondplayer = diece1 + diece2
            labelPlayerSeconsPuan.text = String(playerPuans.secondplayer)
            ImageStatusleft.image = UIImage(named: "onay")
            ImageStatusRight.image = UIImage(named: "bekle")
            labelResult.text = "first player's turn"
            playerSequence = 1

            
            if playerPuans.firstplayir > playerPuans.secondplayer{
                //first player won
                
                playerScors.firstPlayerScor += 1
                labelResult.text = "\(nowSet). first player won the set"
                nowSet += 1
                labelPlayerfirst.text = String(playerScors.firstPlayerScor)
                
                
            } else if playerPuans.secondplayer > playerPuans.firstplayir {
                // second player won
                
                playerScors.seconPlayerScor += 1
                labelResult.text = "\(nowSet).second player won the set"
                nowSet += 1
                labelPlayerSecond.text = String(playerScors.seconPlayerScor)
                
            } else {
//                EĞER İKİSİDE KAZANIRSA
                
                labelResult.text = "YOU WIN TOGETHER"
                
                
            }
            
            if playerScors.firstPlayerScor + playerScors.seconPlayerScor ==  maxSet {
                
                labelResult.text = "Play game end"
                
            }
        }
        
    }


}

