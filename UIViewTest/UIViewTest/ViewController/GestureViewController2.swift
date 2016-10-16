//
//  GestureViewController2.swift
//  UIViewTest
//
//  Created by Shusuke Unno on 2016/08/29.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
// 
// ジェスチャーのサンプル
//    タップ
//    スワイプ(押したまま指定の方向にドラッグ)
//    ピンチイン＆アウト
//    長押し
//    ドラッグ

import UIKit

class GestureViewController2: UIViewController {
    var tapView1 : UIView?
    var tapView2 : UIView?
    var swipeView : UIView?
    
    let topY : CGFloat = 50.0
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var label1: UILabel!
    
// MARK:タップジェスチャー
    // Viewの色を変更するジェスチャー用のメソッド
    func changeViewColor(gestureRecognizer: UITapGestureRecognizer){
        // タップされた view を取得する
        let view : UIView? = gestureRecognizer.view!
        
        // タップviewの色を変える (White <=> Black)
        if(view!.backgroundColor  == UIColor.whiteColor()) {
            view!.backgroundColor = UIColor.blackColor()
        }
        else {
            view!.backgroundColor = UIColor.whiteColor()
        }
    }
    
    // タップジェスチャーのテスト用のViewを追加
    func addTapGesture() {
        self.titleLabel.text = "Tap Gesture"
        
        // Viewを追加
        self.tapView1 = UIView(frame: CGRect(x:0, y:topY, width:100, height:100))
        tapView1!.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(tapView1!)
        
        self.tapView2 = UIView(frame: CGRect(x:100, y:topY, width:100, height:100))
        tapView2!.backgroundColor = UIColor.blackColor()
        self.view.addSubview(tapView2!)
        
        
        // viewのジェスチャーを有効化
        self.tapView1!.userInteractionEnabled = true
        self.tapView2!.userInteractionEnabled = true
        
        //ジェスチャーを作成
        let recognizer : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.changeViewColor(_:)));
        
        //ジェスチャーをUIViewオブジェクトに登録する
        self.tapView1!.addGestureRecognizer(recognizer)
        
        // ２つ目
        let recognizer2 : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.changeViewColor(_:)));
        self.tapView2!.addGestureRecognizer(recognizer2)
    }
    
    
// MARK: スワイプジェスチャー
    // スワイプテスト用のViewを追加
    func addSwipeGesture() {
        self.titleLabel.text = "Swipe Gesture"
        
        self.swipeView = UIView(frame: CGRect(x:0, y:0, width:view.frame.size.width, height:view.frame.size.height))
//        swipeView!.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(swipeView!)
        
        // left
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swiped(_:)))
        swipeLeft.numberOfTouchesRequired = 1
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.swipeView?.addGestureRecognizer(swipeLeft)
        
        // right
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.swiped(_:)))
        swipeRight.numberOfTouchesRequired = 1
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.swipeView?.addGestureRecognizer(swipeRight)
        
        // up
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.swiped(_:)))
        swipeUp.numberOfTouchesRequired = 1
        swipeUp.direction = UISwipeGestureRecognizerDirection.Up
        self.swipeView?.addGestureRecognizer(swipeUp)
        
        // down
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.swiped(_:)))
        swipeDown.numberOfTouchesRequired = 1
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        self.swipeView?.addGestureRecognizer(swipeDown)
    }
    
    /**
     * スワイプ
     */
    func swiped(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Left:
                // 左
                self.label1.text = "Left"
            case UISwipeGestureRecognizerDirection.Right:
                // 右
                self.label1.text = "Right"
            case UISwipeGestureRecognizerDirection.Up:
                // 上
                self.label1.text = "Up"
            case UISwipeGestureRecognizerDirection.Down:
                // 下
                self.label1.text = "Down"
            default:
                // その他
                self.label1.text = "Center"
                break
            }
        }
    }

// MARK: ピンチイン、ピンチアウトジェスチャー
    /*
        UIPinchGestureRecognizer
          public var scale: CGFloat // ピンチイン、アウトの拡大率。ピンチインはマイナスの値、ピンチアウトは正の値
          public var velocity: CGFloat  // 加速度
     
     */
    func pinchGesture(gesture: UIGestureRecognizer) {
        if let pinchGesture = gesture as? UIPinchGestureRecognizer {
            label1.text = String(format: "%.4f", pinchGesture.scale)
//            label1.text = String(format: "%.4f", pinchGesture.velocity)
        }
    }
    func addPinchGesture() {
        //ジェスチャーを作成
        let recognizer : UIPinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(self.pinchGesture(_:)));
        
        //ジェスチャーをUIViewオブジェクトに登録する
        self.view!.addGestureRecognizer(recognizer)
    }
    
// MARK: 長押しジェスチャー
    /*
     UILongPressGestureRecognizer

     state : UIGestureRecognizerState  状態
     numberOfTapsRequired   最小何本指のタップで反応するか
     numberOfTouchesRequired  最小何本指のタッチで反応するか(move時)
     minimumPressDuration   長押しの反応時間(デフォルトは 0.5秒)
     allowableMovement   長押し中の指のズレを許容する範囲
 
     */
    // 長押し時に呼ばれるメソッド
    // 注意点として長押し開始、長押し時にカーソル移動、長押し完了時にそれぞれ呼ばれる
    func longPressGesture(gesture: UIGestureRecognizer) {
        if let pressGesture = gesture as? UILongPressGestureRecognizer
        {
            // 押し始めの一回だけ pressGesture.state == UIGestureRecognizerState.Began になる
            if pressGesture.state == UIGestureRecognizerState.Began {
                            }
            switch (pressGesture.state) {
            case UIGestureRecognizerState.Began:
                let view : UIView? = gesture.view!
                view?.backgroundColor = UIColor.redColor()
            case UIGestureRecognizerState.Changed:
                label1.text = "moving"
                
            case UIGestureRecognizerState.Ended:
                gesture.view!.backgroundColor = UIColor.blackColor()
                
            default:
                break;
            }
        }
    }
    func addLognPressGesture() {
        self.titleLabel.text = "LongPress Gesture"
        
        // Viewを追加
        self.tapView1 = UIView(frame: CGRect(x:0, y:topY, width:100, height:100))
        tapView1!.backgroundColor = UIColor.blackColor()
        self.view.addSubview(tapView1!)
        
        self.tapView2 = UIView(frame: CGRect(x:100, y:topY, width:100, height:100))
        tapView2!.backgroundColor = UIColor.blackColor()
        self.view.addSubview(tapView2!)
       
        //ジェスチャーを作成
        let recognizer : UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.longPressGesture(_:)));
        
        //ジェスチャーをUIViewオブジェクトに登録する
        self.tapView1!.addGestureRecognizer(recognizer)
        
        // ２つ目
        let recognizer2 : UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.longPressGesture(_:)));
        self.tapView2!.addGestureRecognizer(recognizer2)
    }
    
// MARK: ドラッグ(パン)ジェスチャー
    // ドラッグ時に呼ばれるメソッド
    /*
        UIPanGestureRecognizer 
         minimumNumberOfTouches: Int // ドラッグ判定される最小の指の数
         maximumNumberOfTouches: Int // ドラッグ判定される最大の指の数
         
         func translationInView(view: UIView?) -> CGPoint // ドラッグの移動量を取得。クリアしない場合はドラッグ開始位置からの差分を返す
         func setTranslation(translation: CGPoint, inView view: UIView?)
         func velocityInView(view: UIView?) -> CGPoint // １秒あたりの移動量(ピクセス数)

     
     */
    func dragGesture(gesture : UIGestureRecognizer) {
        if let gestureDrag = gesture as? UIPanGestureRecognizer {
            // ドラッグ移動量を取得
            let move : CGPoint = gestureDrag.translationInView(gesture.view!)
            label1.text = String(format: "%.4f %.4f", move.y,move.x)
            
            // 移動をクリアする（枚フレームごとの移動量を参照できる）
            gestureDrag.setTranslation(CGPointZero,inView: self.view)
            
            // View移動
            let frame = gesture.view!.frame
            gesture.view!.frame = CGRectMake(frame.origin.x + move.x, frame.origin.y + move.y, frame.size.width, frame.size.height)
        }
    }
    
    // ドラッグテスト用のViewを作成
    func addDragGesture() {
        self.titleLabel.text = "Drag Gesture"
        
        // Viewを追加
        self.tapView1 = UIView(frame: CGRect(x:0, y:topY, width:100, height:100))
        tapView1!.backgroundColor = UIColor.blackColor()
        self.view.addSubview(tapView1!)
        
        self.tapView2 = UIView(frame: CGRect(x:100, y:topY, width:100, height:100))
        tapView2!.backgroundColor = UIColor.blackColor()
        self.view.addSubview(tapView2!)
        
        //ジェスチャーを作成
        let recognizer : UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(self.dragGesture(_:)));
        recognizer.minimumNumberOfTouches = 1
        
        //ジェスチャーをUIViewオブジェクトに登録する
        self.tapView1!.addGestureRecognizer(recognizer)
        
        // ２つ目
        let recognizer2 : UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(self.dragGesture(_:)));
        self.tapView2!.addGestureRecognizer(recognizer2)

    }
    
    enum testMode {
        case Tap
        case Swipe
        case Pinch
        case LongPress
        case Drag
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mode = testMode.Pinch
        
        switch mode {
        case .Tap:
            // タップのジェスチャーを追加
            self.addTapGesture()
        case .Swipe:
            // スワイプのジェスチャーを追加
            self.addSwipeGesture()
        case .Pinch:
            // ピンチイン＆アウト
            self.addPinchGesture()
        case .LongPress:
            // 長押しジェスチャーを追加
            self.addLognPressGesture()
        case .Drag:
            self.addDragGesture()
        }
    }
}
