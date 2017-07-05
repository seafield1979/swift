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
    func backButtonTapped(_ sender: AnyObject) {
        if webView1!.canGoBack {
            webView1!.goBack()
        }
    }
    
    // Reload ボタンを押した時の処理
    func reloadButtonTapped(_ sender: AnyObject) {
        if !webView1!.isLoading {
            webView1!.reload()
        }
    }
    
    // Yahoo ボタンを押した時の処理
    func yahooButtonTapped(_ sender: AnyObject) {
        if !webView1!.isLoading {
            webView1?.loadRequest(URLRequest(url: URL(string: "http://yahoo.co.jp")!))
        }
    }
    
    override func loadView() {
        // スクリーンと同じサイズのUIViewを生成して viewに設定
        // これで画面サイズの異なるデバイスでも画面サイズとviewのサイズが一致する
        self.view = UIView(frame: UIScreen.main.bounds)
    }
    

    func createWebview() -> UIWebView
    {
        let webView = UIWebView()

        // サイズを設定
        webView.frame = CGRect(x: 0,y: 20,width: view.frame.size.width, height: view.frame.size.height - 100)
        
        // デリゲートを設定
        webView.delegate = self
        
        return webView
    }
    
    // UIButtonを生成
    func createButtonWithTitle(_ title : String, pos: CGPoint) -> UIButton
    {
        let button = UIButton(frame: CGRect(x: pos.x, y: pos.y, width: 80, height: 30))
        button.setTitle(title, for: UIControlState())
        button.setTitleColor(.black, for: UIControlState())
        button.setTitleColor(.white, for: .highlighted)
        button.setTitleColor(.gray, for: .disabled)
        self.view.addSubview(button)
        
        return button
    }

    // テスト用のボタンを追加
    func createButtons()
    {
        backButton = createButtonWithTitle("back", pos: CGPoint(x: 50, y: view.frame.size.height - 50))
        backButton!.addTarget(self, action: #selector(backButtonTapped(_:)), for: .touchUpInside)
        
        reloadButton = createButtonWithTitle("reload", pos: CGPoint(x: 120, y: view.frame.size.height - 50))
        reloadButton!.addTarget(self, action: #selector(reloadButtonTapped(_:)), for: .touchUpInside)
        
        yahooButton = createButtonWithTitle("yahoo!", pos: CGPoint(x: 200, y: view.frame.size.height - 50))
        yahooButton!.addTarget(self, action: #selector(yahooButtonTapped(_:)), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        // UIWebView生成
        webView1 = createWebview()
        self.view.addSubview(webView1!)
        
        // 適当なWebページを表示してみる
        let requestURL = URL(string: "http://www.nintendo.co.jp")
        let req = URLRequest(url: requestURL!)
        webView1!.loadRequest(req)
        
        // テスト用のボタンを追加
        createButtons()
    }
    
    
// MARK: UIWebViewDelegate
    
    // ページを読み込みリクエストが来た時の処理
    // そのページを読み込んでもOKな場合は true を、NGな場合はfalseを返す
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool
    {
        // リクエストを表示してみる
        print("+++shouldStartLoadWithRequest:")
        print(request.description)
        
        return true
    }
    
    // ページ読み込み完了時の処理
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("+++webViewDidFinishLoad")
        print(webView.request!.url!.absoluteString)
        
        if webView.canGoBack {
            backButton!.isEnabled = true
        }
        else {
            backButton!.isEnabled = false
        }
    }
}
