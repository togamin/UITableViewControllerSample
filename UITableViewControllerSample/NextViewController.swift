//
//  NextViewController.swift
//  UITableViewControllerSample
//
//  Created by Togami Yuki on 2018/11/20.
//  Copyright © 2018 Togami Yuki. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    var animal:String!
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = animal
    }

}
