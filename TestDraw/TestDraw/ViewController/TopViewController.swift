//
//  TopViewController.swift
//  TestDraw
//
//  Created by Shusuke Unno on 2017/07/17.
//  Copyright © 2017年 Sun Sun Soft. All rights reserved.
//

import UIKit

class TopViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickedButton1(_ sender: Any)
    {
        self.edgesForExtendedLayout = []
        
        let viewController = ViewController(nibName: "ViewController", bundle: nil)
        viewController.view.backgroundColor = UIColor.white
        viewController.title = "hoge"
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }

    @IBAction func clickedButton2(_ sender: Any)
    {
        self.edgesForExtendedLayout = []
        
        let viewController = ViewController2(nibName: "ViewController2", bundle: nil)
        viewController.view.backgroundColor = UIColor.white
        viewController.title = "test2"
        self.navigationController?.pushViewController(viewController, animated: true)

    }
    
    @IBAction func clickedButton3(_ sender: Any)
    {
        
    }
    
    @IBAction func clickedButton4(_ sender: Any)
    {
        
    }
    
    @IBAction func clickedButton5(_ sender: Any)
    {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
