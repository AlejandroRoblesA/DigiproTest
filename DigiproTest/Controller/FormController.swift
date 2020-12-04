//
//  ViewController.swift
//  DigiproTest
//
//  Created by Alejandro Robles on 03/12/20.
//

import UIKit

extension FormViewController{
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConstraints()
    }
    
    //MARK: - Functions
    @objc func handleSendButton(){
        print("Send Button pressed...")
    }
}
