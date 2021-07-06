//
//  WordCloudViewController.swift
//  TIL
//
//  Created by Sanya Chawla on 7/6/21.
//

import UIKit

class WordCloudViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var mainBubble: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainBubble.textColor = UIColor.white
        mainBubble.text = passText
        
    }
    
    
    

}
