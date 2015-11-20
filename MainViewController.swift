//
//  MainViewController.swift
//  Add1
//
//  Created by Zachary Conn on 11/17/15.
//  Copyright (c) 2015 ZachConnAppMaking. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var numbersLabel:UILabel?;
    @IBOutlet weak var scoreLabel:UILabel?;
    @IBOutlet weak var inputField:UITextField?;
    var score:Int = 0;

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setRandomNumberLabel();
        updateScoreLabel();
        
        if(inputField != nil){
            inputField!.delegate = self;
            inputField!.font = UIFont(name: "Helvetica", size: 72.0);
            inputField!.frame.size.height = 100.0;
            inputField!.addTarget(self, action: "textFieldDidChange:", forControlEvents:UIControlEvents.EditingChanged);
        }
        
    }
    
    
    func textField(textField:UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string:String) -> Bool {
        
        let newLength = count(textField.text) + count(string) - range.length;
        
        return newLength <= 4
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateScoreLabel(){
        if(scoreLabel != nil){
            scoreLabel!.text = "Score: \(score)";
        }
    }
    
    func setRandomNumberLabel(){
        if(numbersLabel != nil){
            numbersLabel!.text = generateRandomNumber();
        }
    }
    
    func generateRandomNumber() -> String {
        var result:String = "";
        
        for x in 1...4 {
            var digit:Int = Int(arc4random_uniform(8) + 1);
            
            result += "\(digit)"
        }
        
        return result;
    
    }
    
    func textFieldDidChange(textView:UITextView!){
        if(inputField == nil || numbersLabel == nil || count(inputField!.text) < 4 || count(numbersLabel!.text!) < 4){
            return;
        }
        
        var numbers:Int? = numbersLabel!.text!.toInt();
        var input:Int? = inputField!.text.toInt();
        
        if (numbers != nil && input != nil){
            println("Comparing: \(inputField!.text) minus \(numbersLabel!.text!) == \(input! - numbers!)");
            
                if(input! - numbers! == 1111){
                    println("Correct!");
                    score++;
                } else {
                    println("Incorrect!");
                    score--;
                }
            
        }
        
        setRandomNumberLabel();
        updateScoreLabel();
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
