//
//  ViewController.swift
//  TestRealm
//
//  Created by Shusuke Unno on 2017/07/18.
//  Copyright © 2017年 Sun Sun Soft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func selectButtonClicked(_ sender: Any) {
        // Selectテストページに遷移
        let viewController = ViewController2(nibName: "ViewController2", bundle: nil)
        viewController.title = "select test"
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func addButtonClicked(_ sender: Any) {
        // Addテストページに遷移
        let viewController = ViewController3(nibName: "ViewController3", bundle: nil)
        viewController.title = "add test"
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func updateButtonClicked(_ sender: Any) {
        // Updateテストページに遷移
        let viewController = ViewController4(nibName: "ViewController4", bundle: nil)
        viewController.title = "update test"
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func deleteButtonClicked(_ sender: Any) {
        // Deleteテストページに遷移
        let viewController = ViewController5(nibName: "ViewController5", bundle: nil)
        viewController.title = "delete test"
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func testButtonClicked(_ sender: Any) {
        // Selectテストページに遷移
        let viewController = ViewController6(nibName: "ViewController6", bundle: nil)
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

