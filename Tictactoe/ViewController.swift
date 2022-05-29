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
    
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    
    var firstTurn = Turn.Cross
    var currentTurn = Turn.Cross
    
    var NOUGHT =  "O"
    var CROSS  =  "X"
    var board = [UIButton]()
    
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

      if(fullBoard())
        {
          result(title: "Draw")
      }
    
    
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

