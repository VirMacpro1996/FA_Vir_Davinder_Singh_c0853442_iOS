//
//  ViewController.swift
//  Tictactoe
//
//  Created by Vir Davinder Singh on 2022-05-29.


import UIKit

class ViewController: UIViewController {

    
//    enum Turn {
//
//        case Nought
//        case Cross
//    }
//    
    
    @IBOutlet weak var a1: UIButton!
    
    @IBOutlet weak var a2: UIButton!
    
    @IBOutlet weak var a3: UIButton!
    
    @IBOutlet weak var b1: UIButton!
    
    @IBOutlet weak var b2: UIButton!
    
    @IBOutlet weak var b3: UIButton!
    
    @IBOutlet weak var c1: UIButton!
    
    
    @IBOutlet weak var NoughtScore: UILabel!
    @IBOutlet weak var CrossScore: UILabel!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    
    var firstTurn = Turn.Cross
    var currentTurn = Turn.Cross
    var lastTurn = Turn.Cross
    
    var NOUGHT =  "O"
    var noughtImage = UIImage(named: "nought")
    var crossImage = UIImage(named : "cross")
    var blank = UIImage(named: "bb")
    var CROSS  =  "X"
    var board = [UIButton]()
    var crossesScore = 0
    var noughtsScore = 0
    var last = 0
    var i = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       initBoard()
       swipeGesture()
        becomeFirstResponder()
        
        
        let background = UIImage(named: "bb1")

                var imageView : UIImageView!
                imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
                imageView.clipsToBounds = true
                imageView.image = background
        view.addSubview(imageView)
               self.view.sendSubviewToBack(imageView)
        
    }
    
    func swipeGesture()
    {
    let swipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_ :)))
      
         swipe.direction = .right
        
            view.addGestureRecognizer(swipe)
        
    }
    
    @objc func handleSwipe(_ sender: UISwipeGestureRecognizer)
    {
        resetBoard()
    }


    override var canBecomeFirstResponder: Bool
    {
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            
            
            for button in board
            {
                if button.tag == last
                {
                    button.setImage(blank, for: .normal)
                    button.isEnabled = true
                }

            }
            if(currentTurn == Turn.Nought)
                        {
               
                            currentTurn = Turn.Cross
                        }
                        else if(currentTurn == Turn.Cross)
                        {
                            
                            currentTurn = Turn.Nought
                        
                        }
            let alert = UIAlertController(title: "Detected shake", message: "User shakes", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            present(alert, animated: true)
        }
    }
    func initBoard()
        {
            board.append(a1)
            board.append(a2)
            board.append(a3)
            board.append(b1)
            board.append(b2)
            board.append(b3)
            board.append(c1)
            board.append(c2)
            board.append(c3)
            
            for button in board
            {
                button.setImage(blank, for: .normal)
            }
        }
    
    
    func fullBoard() -> Bool
        {
            for button in board
            {
                if button.image(for: .normal) == blank
                {
                    return false
                }
            }
            return true
        }
    
    
    
    @IBAction func boardTapAction(_ sender: UIButton) {
        
        
        i = i + 1
        
        addToBoard(sender)
       
        sender.tag = i
        last = i
        
        if checkForVictory(crossImage!)
                {
                    crossesScore += 1
            CrossScore.text = String(crossesScore)
            
            result(title: "Crosses Win!")
                }
                
                if checkForVictory(noughtImage!)
                {
                    noughtsScore += 1
                    NoughtScore.text = String(noughtsScore)
                    result(title: "Noughts Win!")
                }
        
      if(fullBoard())
        {
          result(title: "Draw")
      }
    }
    
    func checkForVictory(_ s : UIImage) -> Bool
        {
            // Horizontal Victory
            if thisSymbol(a1, s) && thisSymbol(a2, s) && thisSymbol(a3, s)
            {
                return true
            }
            if thisSymbol(b1, s) && thisSymbol(b2, s) && thisSymbol(b3, s)
            {
                return true
            }
            if thisSymbol(c1, s) && thisSymbol(c2, s) && thisSymbol(c3, s)
            {
                return true
            }
            
            // Vertical Victory
            if thisSymbol(a1, s) && thisSymbol(b1, s) && thisSymbol(c1, s)
            {
                return true
            }
            if thisSymbol(a2, s) && thisSymbol(b2, s) && thisSymbol(c2, s)
            {
                return true
            }
            if thisSymbol(a3, s) && thisSymbol(b3, s) && thisSymbol(c3, s)
            {
                return true
            }
            
            // Diagonal Victory
            if thisSymbol(a1, s) && thisSymbol(b2, s) && thisSymbol(c3, s)
            {
                return true
            }
            if thisSymbol(a3, s) && thisSymbol(b2, s) && thisSymbol(c1, s)
            {
                return true
            }
            
            return false
        }
    
    func thisSymbol(_ button: UIButton, _ image: UIImage) -> Bool
        {
            return button.image(for: .normal) == image
        }
    
    
    func result(title : String)
    {
        
        let result = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
                result.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (_) in
                    self.resetBoard()
                }))
                self.present(result, animated: true)
    }
    
    func resetBoard()
    {
        i = 0
        
        for button in board
        {
           // button.setTitle(nil, for: .normal)
           button.setImage(blank, for: .normal)
            
          // button.setImage(nil, for: .normal)
         
            
            button.isEnabled = true
        }
        
        if firstTurn == Turn.Nought
                {
                    firstTurn = Turn.Cross
                }
                else if firstTurn == Turn.Cross
                {
                    firstTurn = Turn.Nought
                   
                }
                currentTurn = firstTurn


    }
    
    func addToBoard(_ sender: UIButton)
    {
        
        
        if (sender.image(for: .normal) == blank)
        {
            if(currentTurn == Turn.Nought)
                        {
               
           
                sender.setImage(noughtImage, for: .normal)
         
                
                            currentTurn = Turn.Cross
                        }
                        else if(currentTurn == Turn.Cross)
                        {
                            
                            sender.setImage(crossImage , for: .normal)
                            currentTurn = Turn.Nought
                            
                        }
                        sender.isEnabled = false        }
        
    }
}

