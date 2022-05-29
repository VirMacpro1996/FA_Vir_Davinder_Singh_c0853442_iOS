//
//  ViewController.swift
//  Tictactoe
//
//  Created by Vir Davinder Singh on 2022-05-29.
//

import UIKit

class ViewController: UIViewController {

    
    enum Turn {
        
        case Nought
        case Cross
    }
    
    
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
    
    var NOUGHT =  "O"
    var CROSS  =  "X"
    var board = [UIButton]()
    var crossesScore = 0
    var noughtsScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       initBoard()
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
        }
    
    
    func fullBoard() -> Bool
        {
            for button in board
            {
                if button.title(for: .normal) == nil
                {
                    return false
                }
            }
            return true
        }
    
    
    
    @IBAction func boardTapAction(_ sender: UIButton) {
        
        addToBoard(sender)
       
        if checkForVictory(CROSS)
                {
                    crossesScore += 1
            CrossScore.text = String(crossesScore)
            
            result(title: "Crosses Win!")
                }
                
                if checkForVictory(NOUGHT)
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
    
    func checkForVictory(_ s :String) -> Bool
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
    
    func thisSymbol(_ button: UIButton, _ symbol: String) -> Bool
        {
            return button.title(for: .normal) == symbol
        }
    
    
    func result(title : String)
    {
        
        let ac = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
                ac.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (_) in
                    self.resetBoard()
                }))
                self.present(ac, animated: true)
    }
    
    func resetBoard()
    {
        
        for button in board
        {
            button.setTitle(nil, for: .normal)
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
        
        
        if (sender.title(for: .normal) == nil )
        {
            if(currentTurn == Turn.Nought)
                        {
               
                sender.setTitle(NOUGHT, for: .normal)
                            currentTurn = Turn.Cross
                        }
                        else if(currentTurn == Turn.Cross)
                        {
                            sender.setTitle(CROSS, for: .normal)
                           
                            currentTurn = Turn.Nought
                            
                        }
                        sender.isEnabled = false        }
        
    }
}

