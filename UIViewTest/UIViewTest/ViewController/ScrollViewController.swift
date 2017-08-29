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

class ScrollViewController: UNViewController, UIScrollViewDelegate {

    var scrollView1 : UIScrollView?
    var label1 : UILabel?
    
    @IBOutlet weak var scrollView2: UIScrollView!
    
//    @IBOutlet weak var contentView: UIView!
    
//    override func loadView() {
//        // スクリーンと同じサイズのUIViewを生成して viewに設定
//        // これで画面サイズの異なるデバイスでも画面サイズとviewのサイズが一致する
//        self.view = UIView(frame: UIScreen.main.bounds)
//    }
    
    func createScrollView() -> UIScrollView
    {
        // UIScrollViewを作成
        let scrollView = UIScrollView( frame: CGRect( x: 0,y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        
        scrollView.contentSize = CGSize(width: 2000, height: 2000)
        
        scrollView.backgroundColor = .blue
        
        // ページごとのスクロールにする
        scrollView.isPagingEnabled = true;
        
        // ステータスバータップでトップにスクロールする機能をOFFにする
        scrollView.scrollsToTop = false;
        
        // delegateメソッドを使用できるようにする
//        scrollView.delegate = self
        
        // スクロール確認用にViewをたくさん追加
        for x in 0 ..< 10 {
            for y in 0 ..< 10 {
                let tempView = UIView(frame: CGRect(x: CGFloat(x)*200, y: CGFloat(y)*200, width: 30, height: 30))
                tempView.backgroundColor = .green
                scrollView.addSubview(tempView)
            }
        }
        
        self.view.addSubview(scrollView)
        
        return scrollView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView2.delegate = self
//        scrollView1 = createScrollView()
        
        // ラベル作成
//        label1 = UILabel(frame: CGRect( x: 0, y: 20, width: view.frame.size.width, height: 30))
//        label1!.textColor = .white
//        view.addSubview(label1!)
    }
    
    // オートレイアウトを使用する場合は viewDidLayoutSubviews でcontentSizeを設定する
    override func viewDidLayoutSubviews() {
        scrollView2.contentSize = CGSize(width: 1000, height: 1000)
        scrollView2.flashScrollIndicators()
    }
    
// MARK: UIScrollViewDelegate
    
    // スクロール中に呼ばれるメソッド
    func scrollViewDidScroll( _ scrollView: UIScrollView) {
        print("\(scrollView.contentOffset.x) :  \(scrollView.contentOffset.y)")
//        label1!.text = String( format:"%.2f %.2f", scrollView.contentOffset.x, scrollView.contentOffset.y)
    }
}
