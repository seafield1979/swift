//
//  TopTableViewController.swift
//  UIViewTest
//
//  Created by Shusuke Unno on 2017/07/06.
//  Copyright © 2017年 Shusuke Unno. All rights reserved.
//

import UIKit

class TopTableViewController: UITableViewController {
    enum testMode : String, EnumEnumerable{
        case vc = "ViewController"
        case gesture = "ジェスチャー"
        case gesture2 = "ジェスチャー2"
        case button = "ボタン"
        case button2 = "ボタン2"
        case imageView = "ImageView"
        case label = "ラベル"
        case scrollView = "スクロールビュー"
        case progress = "プログレスバー"
        case pageControl = "ページコントロール"
        case picker = "ピッカー"
        case segmented = "セグメント"
        case slider = "スライダー"
        case `switch` = "スイッチ"
        case stepper = "ステッパー"
        case textField = "テキスト"
        case webview = "WebView"
        case autolayout = "AutoLayout1"
        case autolayout2 = "AutoLayout2"
        case alertView = "アラート"
        case tableView = "テーブルビュー"
    }
    
    var items : [String]
    let cellIdentifier = "Cell"
    
    override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        items = []
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        items = []
        super.init(coder: aDecoder)
        
    }

    // View表示前
    // 表示の準備を行う
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for mode in testMode.cases {
            items.append(mode.rawValue)
        }
        
        print(String(testMode.count))
        
        // セルを表示する準備
        tableView.register(CustomCell.self, forCellReuseIdentifier: cellIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    // MARK: - Table view data source

    // セクションの数
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // 指定のセクションに含まれる絡む数を取得
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    // セルを返す
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CustomCell
        
        cell.textLabel!.text = items[indexPath.row]

        return cell
    }
    
    // セルが選択された(タップされた)
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("didSelectRowAt:" + String(indexPath.row))
        let mode = testMode.cases[indexPath.row]
        var viewController : UIViewController? = nil
        
        switch mode {
                case .alertView:
                    viewController = AlertViewController(nibName: "AlertViewController", bundle: nil)
            
                case .autolayout:
                    viewController = AutolayoutViewController(nibName: "AutolayoutViewController", bundle: nil)
            
                case .autolayout2:
                    viewController = Autolayout2ViewController()
            
                case .vc:
                    viewController = ViewController(nibName: "ViewController", bundle: nil)
        
                    // Viewの色を変える
                    viewController!.view.backgroundColor = UIColor.yellow
            
                case .gesture:
                    viewController = GestureViewController(nibName: "GestureViewController", bundle: nil)
        
                    // Viewの色を変える
                    viewController!.view.backgroundColor = UIColor.yellow
                case .gesture2:
                    viewController = GestureViewController2(nibName: "GestureViewController2", bundle: nil)
        
                    // Viewの色を変える
                    viewController?.view.backgroundColor = UIColor.yellow
            
                case .button:
                    viewController = ButtonViewController(nibName: "ButtonViewController", bundle: nil)
        
                    // Viewの色を変える
                    viewController?.view.backgroundColor = UIColor.white
                case .button2:
                    viewController = Button2ViewController(nibName: "Button2ViewController", bundle: nil)
                    
                    // Viewの色を変える
                    viewController?.view.backgroundColor = UIColor.white
                case .imageView:
                    viewController = ImageViewController(nibName: "ImageViewController", bundle: nil)
                    // Viewの色を変える
                    viewController?.view.backgroundColor = UIColor.white
            
                case .label:
                    viewController = LabelViewController(nibName: "LabelViewController", bundle: nil)
            
                case .progress:
                    viewController = ProgressViewController(nibName: "ProgressViewController", bundle: nil)
            
                case .pageControl:
                    viewController = PageControlViewController(nibName: "PageControlViewController", bundle: nil)
            
                case .picker:
                    viewController = PickerViewController(nibName: "PickerViewController", bundle: nil)
            
                case .scrollView:
                    viewController = ScrollViewController(nibName: "ScrollViewController", bundle: nil)
            
                case .segmented:
                    viewController = SegmentedViewController(nibName: "SegmentedViewController", bundle: nil)
            
                case .slider:
                    viewController = SliderViewController(nibName: "SliderViewController", bundle: nil)
            
                case .switch:
                    viewController = SwitchViewController(nibName: "SwitchViewController", bundle: nil)
            
                case .stepper:
                    viewController = StepperViewController(nibName: "StepperViewController", bundle: nil)
            
                case .textField:
                    viewController = TextViewController(nibName: "TextViewController", bundle: nil)
            
                case .webview:
                    viewController = WebViewController(nibName: "WebViewController", bundle: nil)
                case .tableView:
                    viewController = TableViewController(nibName:"TableViewController", bundle: nil)
        default:
            break
                }
        if let vc = viewController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
