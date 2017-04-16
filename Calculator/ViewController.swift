//
//  ViewController.swift
//  Calculator
//
//  Created by MAC on 2017/3/30.
//  Copyright © 2017年 MAC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberDisplayed:Double = 0;
    var previousNumber:Double = 0;
    var performingMath = false;
    var operation = 0;
    
    @IBOutlet weak var resultNumber: UILabel!

    @IBAction func numberBtnClicked(_ sender: UIButton) {
        if sender.tag <= 10{    //number
            if performingMath == true{
                resultNumber.text = String(sender.tag-1);
                numberDisplayed = Double(resultNumber.text!)!;
                performingMath = false;
            }
            
            else {
                if resultNumber.text == "0"||resultNumber.text == "-0"{
                    resultNumber.text?.remove(at: (resultNumber.text?.endIndex)!);
                    resultNumber.text = resultNumber.text! + String(sender.tag-1);
                }else{
                    resultNumber.text = resultNumber.text! + String(sender.tag-1);

                }
            }
        }
        else{
            if sender.tag == 17{    //dot
                if performingMath == true{
                    
                    if !resultNumber.text!.characters.contains("."){
                        resultNumber.text = resultNumber.text! + ".";
                    }
                }
                else{
                    if !resultNumber.text!.characters.contains("."){
                        resultNumber.text = resultNumber.text! + ".";
                    }
                
                }
            }
            else if sender.tag == 18{    //+-
                if performingMath == true{
                    if resultNumber.text!.hasPrefix("-"){
                        resultNumber.text?.remove(at: (resultNumber.text?.startIndex)!);
                    }else{
                        resultNumber.text = "-0";
                    }
                
                }
                else{
                    if resultNumber.text!.hasPrefix("-"){
                        resultNumber.text?.remove(at: (resultNumber.text?.startIndex)!);
                    }else{
                        resultNumber.text = "-" + resultNumber.text!;
                    }
                
                }
            }
            else if sender.tag == 19{    //%
                if !(resultNumber.text?.isEmpty)!{
                    resultNumber.text = String(Double(resultNumber.text!)! * 0.01);
                    numberDisplayed = Double(resultNumber.text!)!;
                }

            
            }
            else if sender.tag == 24 {    //π
                resultNumber.text = String(Double.pi);
                numberDisplayed = Double(resultNumber.text!)!;

            }
        
        
        }
    }
    
    @IBAction func methodBtnClicked(_ sender: UIButton) {
        if resultNumber.text != "" && sender.tag != 11 && sender.tag != 16 && sender.tag != 22 && sender.tag != 23 {
            if operation != 0{
                if operation == 12{
                    previousNumber = previousNumber / numberDisplayed;
                    
                }
                else if operation == 13{
                    previousNumber = previousNumber * numberDisplayed;
                    
                }
                else if operation == 14 {
                    previousNumber = previousNumber - numberDisplayed;
                    
                }
                else if operation == 15 {
                    previousNumber = previousNumber + numberDisplayed;
                }
                else if operation == 20 {
                    previousNumber = pow(previousNumber,numberDisplayed);
                }
                else if operation == 21 {
                    previousNumber = pow(previousNumber, (1/numberDisplayed));
                }
                operation = sender.tag;
                performingMath = true;

            }
            else{
                previousNumber = Double(resultNumber.text!)!;
                if sender.tag == 12{
                    resultNumber.text = "/";

                }
                else if sender.tag == 13{
                    resultNumber.text = "*";

                }
                else if sender.tag == 14 {
                    resultNumber.text = "-";

                }
                else if sender.tag == 15 {
                    resultNumber.text = "+";
                }
                else if sender.tag == 20{
                    resultNumber.text = "^";
                }
                else if sender.tag == 21{
                    resultNumber.text = "√";
                }
                operation = sender.tag;
                performingMath = true;
            }
        }
        else if sender.tag == 16{
            if operation == 12{
                resultNumber.text = String(previousNumber / numberDisplayed);
    
            }
            else if operation == 13{
                resultNumber.text = String(previousNumber * numberDisplayed);
                
            }
            else if operation == 14 {
                resultNumber.text = String(previousNumber - numberDisplayed);
                
            }
            else if operation == 15 {
                resultNumber.text = String(previousNumber + numberDisplayed);
            }
            else if operation == 20 {
                resultNumber.text = String(pow(previousNumber,numberDisplayed));
            }
            else if operation == 21 {
                resultNumber.text = String(pow(previousNumber, (1/numberDisplayed)));
            }
        }
        else if sender.tag == 11{
            resultNumber.text = "";
            previousNumber = 0;
            numberDisplayed = 0;
            operation = 0;
        }
        else if sender.tag == 22{
            resultNumber.text = String(log10(Double(resultNumber.text!)!));
            
        }
        else if sender.tag == 23{
            resultNumber.text = String(exp(Double(resultNumber.text!)!));
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

