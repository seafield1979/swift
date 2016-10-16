//
//  ViewController.swift
//  test
//
//  Created by Shusuke Unno on 2016/09/11.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let manager:AFHTTPRequestOperationManager = AFHTTPRequestOperationManager()
        
//        let serializer:AFJSONRequestSerializer = AFJSONRequestSerializer()
//                manager.requestSerializer = serializer
//                manager.GET("http://localhost:3000/members.json", parameters: nil,
//                            success: {(operation: AFHTTPRequestOperation!, responsobject: AnyObject!) in
//                                println("Success!!")
//                                println(responsobject)
//                    },
//                            failure: {(operation: AFHTTPRequestOperation!, error: NSError!) in
//                                println("Error!!")
//                    }
//                )

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

