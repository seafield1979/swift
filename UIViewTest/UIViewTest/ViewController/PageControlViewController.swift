//
//  PageControlViewController.swift
//  UIViewTest
//
//  Created by Shusuke Unno on 2016/08/31.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//
/*
 UIPageControl のサンプル
 UIPageControl自体はシンプルで複数の選択項目の位置の１つが選択された状態を保持するだけ
 選択項目が変更された時などに呼ばれるイベントを登録しておいてページの切り替えを実現する
 
 UIScrollViewのdelegateメソッドを呼び出す設定
    １. クラスの宣言でプロトコルに UIScrollViewDelegate を追加
    class PageControlViewController: UIViewController, UIScrollViewDelegate
 
    2. UIScrollViewのdeleteプロパティにdelegateを渡す先(今回はこのViewControllerで受け取りたいのでself)を設定
    scrollView delegate = self
 */


import UIKit

class PageControlViewController: UNViewController, UIScrollViewDelegate{

    @IBOutlet weak var pageCtrl1: UIPageControl!
    
    var scrollView : UIScrollView?
    
    let pageMax = 6
    
    @IBAction func prevButtonTapped(_ sender: AnyObject) {
        pageCtrl1.currentPage -= 1
        pageChanged(pageCtrl1.currentPage)
    }
    @IBAction func nextButtonTapped(_ sender: AnyObject) {
        pageCtrl1.currentPage += 1
        pageChanged(pageCtrl1.currentPage)
    }
    
    @IBAction func pageControlChanged(_ sender: AnyObject) {
        if let pageControl = sender as? UIPageControl {
            pageChanged(pageControl.currentPage)
        }
    }
    
    func pageChanged(_ page : Int) {
        print(page)
        
        // ScrollViewの表示をスクロールする
        var frame = self.scrollView!.frame
        frame.origin.x = CGFloat(page) * scrollView!.frame.size.width
        frame.origin.y = 0
        scrollView!.scrollRectToVisible(frame, animated: true)
    }
    
    // ソースコードだけでUIPageControlを生成
    func createPageControl(_ pos : CGPoint) -> UIPageControl{
        let pageControl = UIPageControl(frame: CGRect(x: pos.x, y: pos.y, width: 200, height: 30))
        
        // ページ数
        pageControl.numberOfPages = 3
        
        // 現在のページ
        pageControl.currentPage = 0
        
        // 現在のページを示す●の色
        pageControl.currentPageIndicatorTintColor = .yellow
        
        // ページを示す●の色
        pageControl.pageIndicatorTintColor = .blue
        
        // ページが変更された時のイベントを登録
        pageControl.addTarget(self, action: #selector(self.pageControlChanged(_:)), for: UIControlEvents.valueChanged)
        
        return pageControl
    }
    
    // ページコントロール連動のScrollView
    func createScrollView() -> UIScrollView
    {
        // UIScrollViewを作成
        let scrollView = UIScrollView( frame: CGRect( x: 0,y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        
        scrollView.contentSize = CGSize(width: view.frame.size.width * CGFloat(pageMax), height: view.frame.size.height)
        
        scrollView.backgroundColor = .blue
        
        // ページごとのスクロールにする
        scrollView.isPagingEnabled = true;
        
        // ステータスバータップでトップにスクロールする機能をOFFにする
        scrollView.scrollsToTop = false;
        
        // delegateメソッドを使用できるようにする
        scrollView.delegate = self
        
        // ScrollViewにページごとのViewを貼り付ける
        for index in 0..<pageMax {
            let viewTemp = UIView(frame: CGRect(x: CGFloat(index) * view.frame.size.width, y: 0, width: view.frame.size.width, height: view.frame.size.height))
            viewTemp.backgroundColor = UIColor(red: 0.4 + CGFloat(index) * 0.1, green: 0, blue: 0, alpha: 1.0)
            
            // test
            let view1 = UIView(frame: CGRect(x: 0,y: 20,width: 100,height: 100))
            view1.backgroundColor = .white
            viewTemp.addSubview(view1)

            scrollView.addSubview(viewTemp)
        }
        
        return scrollView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        scrollView = createScrollView()
        self.view.addSubview(scrollView!)
        
        let pageControl = createPageControl(CGPoint(x: 100, y: view.frame.size.height))
        self.view.addSubview(pageControl)
    }
    
// MARK: UIScrollViewDelegate
    // スクロール時の処理（スクロール中に毎フレーム呼ばれる）
    func scrollViewDidScroll( _ scrollView: UIScrollView) {
        // 現在のページ数を UIPageControl に設定
        pageCtrl1.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        
        print("\(scrollView.contentOffset.x) :  \(scrollView.contentOffset.y)")
    }
}
