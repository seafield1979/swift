//
//  MyTabBarController.swift
//  ViewController
//
//  Created by Shusuke Unno on 2016/09/07.
//  Copyright © 2016年 B02681. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {
    var Tab1View: Tab1ViewController!
    var Tab2View: Tab2ViewController!
    var Tab3View: Tab3ViewController!
    var Tab4View: Tab4ViewController!
    
    var tabButtonBGView : [UIView]?
    
    @IBAction func tabButtonTapped(button : UIButton) {
        selectTabForId(button.tag - 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        Tab1View = Tab1ViewController()
        Tab2View = Tab2ViewController()
        Tab3View = Tab3ViewController()
        Tab4View = Tab4ViewController()
        
        tabBar.backgroundColor = .grayColor()
                
        // タブで表示するViewControllerを配列に格納する
        let myTabs = [Tab1View!, Tab2View!, Tab3View!, Tab4View!]
        
        // 配列をTabにセット
        self.setViewControllers(myTabs, animated: false)

        let mode = 1
        // TabBarにボタンを追加する
        // ※xibを使う方法はうまくいかないので諦めた
        if mode == 1 {
            createTabBarView()
            selectTabForId(0)
        }
        else if mode == 2 {
            setTabBarItemsIcon()
        }
        else if mode == 3 {
            setTabBarItemsImage()
        }
    }
    
    // TabBarにカスタムしたViewを配置する
    func createTabBarView() {
        // bg
        let baseView = UIView(frame: CGRectMake(0,0,tabBar.frame.size.width, tabBar.frame.size.height))
        baseView.backgroundColor = .blackColor()
        
        // buttons
        let width = tabBar.frame.size.width / 4
        
        self.tabButtonBGView = []
        
        for index in 0...3 {
            let bgView = UIView(frame: CGRectMake(width * CGFloat(index), 0, width, 49))
            bgView.backgroundColor = .purpleColor()
            baseView.addSubview(bgView)
            tabButtonBGView!.append(bgView)
            
            let button = UIButton(frame: CGRectMake(0, 0, width, 49))
            button.setTitle("button\(index)", forState: .Normal)
            button.setTitleColor(.blackColor(), forState: .Highlighted)
            button.addTarget(self, action: #selector(self.tabButtonTapped(_:)), forControlEvents: .TouchUpInside)
            button.tag = index + 1
            
            bgView.addSubview(button)
        }
        self.tabBar.addSubview(baseView)
    }
    
    // タブバーのアイコンを変更する
    func setTabBarItemsIcon() {
        // デフォルトのアイコンを設定
        Tab1View.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Featured, tag: 1)
        Tab2View.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Bookmarks, tag: 2)
        Tab3View.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Search, tag: 3)
        Tab4View.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Downloads, tag: 4)
    }
    
    func setTabBarItemsImage() {
        // アイコン画像を設定
        Tab1View.tabBarItem = UITabBarItem(title: "contact", image: UIImage(named:"image/Contacts-30.png"), selectedImage: UIImage(named:"image/Contacts-30.png"))
        Tab2View.tabBarItem = UITabBarItem(title: "bowing", image: UIImage(named:"image/Bowing Man-30.png"), selectedImage: UIImage(named:"image/Bowing Man-30.png"))
        Tab3View.tabBarItem = UITabBarItem(title: "contact", image: UIImage(named:"image/Baseball Cap-30.png"), selectedImage: UIImage(named:"image/Baseball Cap-30.png"))
        Tab4View.tabBarItem = UITabBarItem(title: "contact", image: UIImage(named:"image/Facebook-30.png"), selectedImage: UIImage(named:"image/Facebook-30.png"))
    }
    
    func selectTabForId(id : Int) {
        if id >= 0 && id < 4 {
            print("button \(id+1)")
            self.selectedIndex = id
            clearTabBGSelected(id)
            self.tabButtonBGView![id].backgroundColor = .grayColor()
        }
    }
    
    func clearTabBGSelected(except : Int) {
        for index in 0..<tabButtonBGView!.count {
            if except != index {
                tabButtonBGView![index].backgroundColor = .purpleColor()
            }
        }
    }
    
    func addView1(){
        let _view = UIView()
        _view.frame = CGRectMake(0,0,100,100)
        _view.backgroundColor = .blackColor()
        self.tabBar.addSubview(_view)
    }
}


