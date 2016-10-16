//
//  WebViewController.swift
//  UIViewTest
//
//  Created by Shusuke Unno on 2016/08/31.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//
//  iOS9からデフォルトでhttpのサイトが表示できなくなったので、Info.plist に以下の設定を追加する
//  ATSを無効
//  <key>NSAppTransportSecurity</key>
//  <dict>
//      <key>NSAllowsArbitraryLoads</key>
//      <true/>
//  </dict>
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {
    
    var webView1 : UIWebView?
    var backButton : UIButton?
    var reloadButton : UIButton?
    var yahooButton : UIButton?
    
    // Back ボタンを押した時の処理
    func backButtonTapped(sender: AnyObject) {
        if webView1!.canGoBack {
            webView1!.goBack()
        }
    }
    
    // Reload ボタンを押した時の処理
    func reloadButtonTapped(sender: AnyObject) {
        if !webView1!.loading {
            webView1!.reload()
        }
    }
    
    // Yahoo ボタンを押した時の処理
    func yahooButtonTapped(sender: AnyObject) {
        if !webView1!.loading {
            webView1?.loadRequest(NSURLRequest(URL: NSURL(string: "http://yahoo.co.jp")!))
        }
    }
    
    override func loadView() {
        // スクリーンと同じサイズのUIViewを生成して viewに設定
        // これで画面サイズの異なるデバイスでも画面サイズとviewのサイズが一致する
        self.view = UIView(frame: UIScreen.mainScreen().bounds)
    }
    

    func createWebview() -> UIWebView
    {
        let webView = UIWebView()

        // サイズを設定
        webView.frame = CGRectMake(0,20,view.frame.size.width, view.frame.size.height - 100)
        
        // デリゲートを設定
        webView.delegate = self
        
        return webView
    }
    
    // UIButtonを生成
    func createButtonWithTitle(title : String, pos: CGPoint) -> UIButton
    {
        let button = UIButton(frame: CGRectMake(pos.x, pos.y, 80, 30))
        button.setTitle(title, forState: .Normal)
        button.setTitleColor(.blackColor(), forState: .Normal)
        button.setTitleColor(.whiteColor(), forState: .Highlighted)
        button.setTitleColor(.grayColor(), forState: .Disabled)
        self.view.addSubview(button)
        
        return button
    }

    // テスト用のボタンを追加
    func createButtons()
    {
        backButton = createButtonWithTitle("back", pos: CGPointMake(50, view.frame.size.height - 50))
        backButton!.addTarget(self, action: #selector(backButtonTapped(_:)), forControlEvents: .TouchUpInside)
        
        reloadButton = createButtonWithTitle("reload", pos: CGPointMake(120, view.frame.size.height - 50))
        reloadButton!.addTarget(self, action: #selector(reloadButtonTapped(_:)), forControlEvents: .TouchUpInside)
        
        yahooButton = createButtonWithTitle("yahoo!", pos: CGPointMake(200, view.frame.size.height - 50))
        yahooButton!.addTarget(self, action: #selector(yahooButtonTapped(_:)), forControlEvents: .TouchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .whiteColor()
        
        // UIWebView生成
        webView1 = createWebview()
        self.view.addSubview(webView1!)
        
        // 適当なWebページを表示してみる
        let requestURL = NSURL(string: "http://www.nintendo.co.jp")
        let req = NSURLRequest(URL: requestURL!)
        webView1!.loadRequest(req)
        
        // テスト用のボタンを追加
        createButtons()
    }
    
    
// MARK: UIWebViewDelegate
    
    // ページを読み込みリクエストが来た時の処理
    // そのページを読み込んでもOKな場合は true を、NGな場合はfalseを返す
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool
    {
        // リクエストを表示してみる
        print("+++shouldStartLoadWithRequest:")
        print(request.description)
        
        return true
    }
    
    // ページ読み込み完了時の処理
    func webViewDidFinishLoad(webView: UIWebView) {
        print("+++webViewDidFinishLoad")
        print(webView.request!.URL!.absoluteString)
        
        if webView.canGoBack {
            backButton!.enabled = true
        }
        else {
            backButton!.enabled = false
        }
    }
}
