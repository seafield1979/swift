//
//  ScrollViewController.swift
//  UIViewTest
//
//  Created by Shusuke Unno on 2016/08/31.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//
// UIScrollViewのサンプル
// UIScrollViewは表示領域の中に表示領域より大きい領域を確保していおき、これをスクロールさせて部分的に表示させる仕組み
//

import UIKit

class ScrollViewController: UIViewController, UIScrollViewDelegate {

    var scrollView1 : UIScrollView?
    var label1 : UILabel?
    
    override func loadView() {
        // スクリーンと同じサイズのUIViewを生成して viewに設定
        // これで画面サイズの異なるデバイスでも画面サイズとviewのサイズが一致する
        self.view = UIView(frame: UIScreen.mainScreen().bounds)
    }
    
    func createScrollView() -> UIScrollView
    {
        // UIScrollViewを作成
        let scrollView = UIScrollView( frame: CGRectMake( 0,0, self.view.frame.size.width, self.view.frame.size.height))
        
        scrollView.contentSize = CGSizeMake(2000, 2000)
        
        scrollView.backgroundColor = .blueColor()
        
        // ページごとのスクロールにする
        scrollView.pagingEnabled = true;
        
        // ステータスバータップでトップにスクロールする機能をOFFにする
        scrollView.scrollsToTop = false;
        
        // delegateメソッドを使用できるようにする
        scrollView.delegate = self
        
        // スクロール確認用にViewをたくさん追加
        for x in 0 ..< 10 {
            for y in 0 ..< 10 {
                let tempView = UIView(frame: CGRectMake(CGFloat(x)*200, CGFloat(y)*200, 30, 30))
                tempView.backgroundColor = .greenColor()
                scrollView.addSubview(tempView)
            }
        }
        
        self.view.addSubview(scrollView)
        
        return scrollView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView1 = createScrollView()
        
        // ラベル作成
        label1 = UILabel(frame: CGRectMake( 0, 20, view.frame.size.width, 30))
        label1!.textColor = .whiteColor()
        view.addSubview(label1!)
    }
    
// MARK: UIScrollViewDelegate
    
    // スクロール中に呼ばれるメソッド
    func scrollViewDidScroll( scrollView: UIScrollView) {
        //print("\(scrollView.contentOffset.x) :  \(scrollView.contentOffset.y)")
        label1!.text = String( format:"%.2f %.2f", scrollView.contentOffset.x, scrollView.contentOffset.y)
    }
}
