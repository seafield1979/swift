//
//  Autolayout2ViewController.swift
//  UIViewTest
//
//  Created by Shusuke Unno on 2016/09/03.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//
// コードでAutolayoutの制約を追加する
//
/*
    // 制約を作成する
    let toConstraint = NSLayoutConstraint(
         item: view1,
         attribute: .Top,
         relatedBy: .Equal,
         toItem: self.view,
         attribute: .Top,
         multiplier: 1.0,
         constant: 100
     )
 
    // 制約を追加する
    view.addConstraint(toConstraint)
 */

import Foundation

import UIKit

class Autolayout2ViewController: UIViewController {
    
    var view1 : UIView?
    var view2 : UIView?
    var view3 : UIView?
    var view4 : UIView?
    
    override func loadView() {
        // スクリーンと同じサイズのUIViewを生成して viewに設定
        // これで画面サイズの異なるデバイスでも画面サイズとviewのサイズが一致する
        self.view = UIView(frame: UIScreen.mainScreen().bounds)
    }
    
    // addConstraint で１つづつ制約を追加
    func createView1() -> UIView
    {
        let view1 = UIView()
        view1.backgroundColor = .redColor()
        
        view.addSubview(view1)
        
        view1.translatesAutoresizingMaskIntoConstraints = false
        
        // Top
        let topConstraint = NSLayoutConstraint(
            item: view1,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self.view,
            attribute: .Top,
            multiplier: 1.0,
            constant: 10
        )
        
        // Left
        let leftConstraint = NSLayoutConstraint(
            item: view1,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: self.view,
            attribute: .Left,
            multiplier: 1.0,
            constant: 10
        )
        
        // Width
        let widthConstraint = NSLayoutConstraint(
            item: view1,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: self.view,
            attribute: .Width,
            multiplier: 0,
            constant: 100
        )
        
        // Heigth
        let heightConstraint = NSLayoutConstraint(
            item: view1,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: self.view,
            attribute: .Height,
            multiplier: 0,
            constant: 100
        )
        
        view.addConstraint(topConstraint)
        view.addConstraint(leftConstraint)
        view.addConstraint(widthConstraint)
        view.addConstraint(heightConstraint)
        
        return view1
    }
    
    // addConstraints でまとめて制約を追加
    func createView2() -> UIView
    {
        let view1 = UIView()
        view1.backgroundColor = .orangeColor()
        
        view.addSubview(view1)
        
        view1.translatesAutoresizingMaskIntoConstraints = false
        
        // Top
        view.addConstraints([
            NSLayoutConstraint(
                item: view1,
                attribute: .Top,
                relatedBy: .Equal,
                toItem: self.view,
                attribute: .Top,
                multiplier: 1.0,
                constant: 120
            ),
            NSLayoutConstraint(
                item: view1,
                attribute: .Left,
                relatedBy: .Equal,
                toItem: self.view,
                attribute: .Left,
                multiplier: 1.0,
                constant: 10
            ),
        
            NSLayoutConstraint(
                item: view1,
                attribute: .Width,
                relatedBy: .Equal,
                toItem: self.view,
                attribute: .Width,
                multiplier: 0,
                constant: 100
            ),
        
            NSLayoutConstraint(
                item: view1,
                attribute: .Height,
                relatedBy: .Equal,
                toItem: self.view,
                attribute: .Height,
                multiplier: 0,
                constant: 100
            )]
        )
        return view1
    }
    
    // 指定のViewを基準にした制約のViewを作成
    func createView3(baseView : UIView) -> UIView
    {
        let view1 = UIView()
        view1.backgroundColor = .orangeColor()
        
        view.addSubview(view1)
        
        view1.translatesAutoresizingMaskIntoConstraints = false
        
        // Top
        view.addConstraints([
            NSLayoutConstraint(
                item: view1,
                attribute: .CenterY,  // 中心(垂直)
                relatedBy: .Equal,
                toItem: baseView,
                attribute: .CenterY,
                multiplier: 1.0,
                constant: 0  // オフセット
            ),
            NSLayoutConstraint(
                item: view1,
                attribute: .CenterX,  // 中心(水平)
                relatedBy: .Equal,
                toItem: baseView,
                attribute: .CenterX,
                multiplier: 1.0,
                constant: 0 // オフセット
            ),
            NSLayoutConstraint(
                item: view1,
                attribute: .Width,
                relatedBy: .Equal,
                toItem: baseView,
                attribute: .Width,
                multiplier: 0.2,    // 親の幅の割合
                constant: 0
            ),
            NSLayoutConstraint(
                item: view1,
                attribute: .Height,
                relatedBy: .Equal,
                toItem: baseView,
                attribute: .Height,
                multiplier: 0.2,    // 親の高さの割合
                constant:0
            )]
        )
        return view1
    }
    
    // 指定のViewと同じサイズ
    func createView4(baseView :UIView) -> UIView
    {
        let view1 = UIView()
        view1.backgroundColor = .yellowColor()
        
        view.addSubview(view1)
        
        view1.translatesAutoresizingMaskIntoConstraints = false
        
        // Top
        view.addConstraints([
            NSLayoutConstraint(
                item: view1,
                attribute: .Top,
                relatedBy: .Equal,
                toItem: self.view,
                attribute: .Top,
                multiplier: 1.0,
                constant: 10  // オフセット
            ),
            NSLayoutConstraint(
                item: view1,
                attribute: .Left,
                relatedBy: .Equal,
                toItem: self.view,
                attribute: .Left,
                multiplier: 1.0,
                constant: 220 // オフセット
            ),
            NSLayoutConstraint(
                item: view1,
                attribute: .Width,
                relatedBy: .Equal,
                toItem: baseView,
                attribute: .Width,
                multiplier: 1.0,
                constant: 0
            ),
            NSLayoutConstraint(
                item: view1,
                attribute: .Height,
                relatedBy: .Equal,
                toItem: baseView,
                attribute: .Height,
                multiplier: 1.0,
                constant:0
            )]
        )
        return view1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .whiteColor()
        
        self.view1 = createView1()
        self.view2 = createView2()
        self.view3 = createView3(self.view)
        self.view4 = createView4(self.view3!)
    }
}