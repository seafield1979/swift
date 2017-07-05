//
//  ImageViewController.swift
//  UIViewTest
//
//  Created by Shusuke Unno on 2016/08/31.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//
// UIImageViewのテスト
//    UIImage(named:)で 画像を生成
//    UIImageView(image:)で 画像のViewを生成
//    UIImageViewの画像を変更
//

import UIKit

class ImageViewController: UIViewController {

    var imageView1 : UIImageView?
    var imageView2 : UIImageView?
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var stepper1: UIStepper!
    
    let testTitles : [String] = ["show image1",
                                 "show image2",
                                 "magnify image",
                                 "shrink image",
                                 "text image",
                                 "show CGContext image",
                                 "show CGContext image2"]
    
    enum TestMode : Int{
        case showImage1
        case showImage2
        case magnify
        case shrink
        case text
        case cgContext
        case cgContext2
    }
    
    
    @IBAction func valueChanged(_ stepper : UIStepper) {
        label1.text = testTitles[Int(stepper.value)]
        
    }
    
    @IBAction func startButtonTapped(_ sender: AnyObject) {
        let mode = TestMode.init(rawValue: Int(stepper1.value))!
        
        switch mode {
        case .showImage1:
            showImage1()
        case .showImage2:
            showImage2()
        case .magnify:
            magnifyImage()
        case .shrink:
            shrinkImage()
        case .text:
            showTextImage()
        case .cgContext:
            showCGContextImage()
        case .cgContext2:
            drawCGContextImage()
        }
    }

    // UIImage を imageView1 に表示する
    func showImage1() {
        let image = UIImage(named: "image/miro_s.jpg")
        if let imageOK = image {
            imageView1!.image = imageOK
            imageView1!.frame.size = imageOK.size
        }
    }
    
    // UIImage を imageView1 に表示する
    func showImage2() {
        let image = UIImage(named: "image/ume_r.png")
        if let imageOK = image {
            imageView1!.image = imageOK
            imageView1!.frame.size = imageOK.size
        }
    }
    
    // imageView1 を拡大する
    func magnifyImage() {
        let size = imageView1!.frame.size
        imageView1!.frame.size = CGSize( width: size.width * 2, height: size.height * 2 )
    }
    
    // imageView1 を縮小する
    func shrinkImage() {
        let size = imageView1!.frame.size
        imageView1!.frame.size = CGSize( width: size.width / 2, height: size.height / 2 )
    }
    
    // テキストからUIImageViewを作成して表示する
    func showTextImage() {
        let textImage = image(text: "hogehoge")
        imageView1?.removeFromSuperview()
        
        imageView1 = UIImageView(image: textImage)
        imageView1!.frame = CGRect( x: 50, y: 200, width: 200, height: 20)
        self.view.addSubview(imageView1!)
    }
    
    // CGContextを使ってUIImageを作成
    func showCGContextImage() {
        imageView1?.removeFromSuperview()
        
        imageView1 = createCGContextImageView(CGPoint(x: 50, y: 100), size: CGSize(width: 150.0, height: 150.0))
        self.view.addSubview(imageView1!)
    }
    
    // CGContextを使ってUIImageからUIImageを作成
    func drawCGContextImage() {
        imageView1?.removeFromSuperview()
        
        let image = UIImage(named: "image/miro_s.jpg")
        if let _image = image {
            let newImage = drawImage(_image)
            let newImageView = UIImageView(image: newImage)
            self.view.addSubview(newImageView)
            imageView1 = newImageView
        }
    }
    
    func image(text : String) -> UIImage! {
        let size = CGSize(width: 200,height: 20)
        
        // ビットマップ形式のグラフィックスコンテキストの生成
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        
        // 描画する文字列の情報を指定する
        // 文字描画時に反映される影の指定
        let shadow = NSShadow()
        shadow.shadowOffset = CGSize(width: 0, height: -1)
        shadow.shadowColor = UIColor.darkGray
        shadow.shadowBlurRadius = 0

        // 文字描画に使用するフォントの指定
        let font = UIFont.boldSystemFont(ofSize: 20.0)
     
        // パラグラフ関連の情報の指定
        let style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.center
        style.lineBreakMode = NSLineBreakMode.byClipping
        
        let textFontAttributes = [
            NSFontAttributeName: font,
            NSParagraphStyleAttributeName: style,
            NSShadowAttributeName: shadow,
            NSForegroundColorAttributeName: UIColor.white,
            NSBackgroundColorAttributeName: UIColor.black
        ]
        // 文字列を描画する
        text.draw(in: CGRect(x: 0,y: 0,width: size.width,height: size.height), withAttributes:textFontAttributes)
        // 現在のグラフィックスコンテキストの画像を取得する
        let image = UIGraphicsGetImageFromCurrentImageContext()
        // 現在のグラフィックスコンテキストへの編集を終了
        
        // (スタックの先頭から削除する)
        UIGraphicsEndImageContext()

        return image
    }
    
    // 画像ファイルからUIImageViewを作成する
    func createImageView(_ pos : CGPoint, imageFile : String) -> UIImageView
    {
        let imageView = UIImageView( image: UIImage(named: imageFile) )
        imageView.frame.origin = pos
        return imageView
    }
    
    // CGContext を使用してUIImage & UIImageViewを作成
    func createCGContextImageView(_ pos : CGPoint, size : CGSize) -> UIImageView
    {
        var imgView:UIImageView! = nil
        var img:UIImage! = nil
        
        // UIImageViewを準備(iPadの横向きにフルで取ったとした場合．ご自身の要件に合わせて下さい．)
        imgView = UIImageView(frame:CGRect(x: pos.x, y: pos.y, width: size.width, height: size.height))
        
        // UIImageを自前で準備
        UIGraphicsBeginImageContextWithOptions(imgView.frame.size, false, 0)
        // context生成
        let contextImg:CGContext = UIGraphicsGetCurrentContext()!
        
        // ■を描画 (CGContextFillRect)
        // この塗りつぶす領域の大きさを指定
        let rect:CGRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        //　色をRGBAで指定 (r,g,b)
        contextImg.setFillColor(red: CGFloat(0) / 255,green: CGFloat(0) / 255,blue: CGFloat(255) / 255, alpha: 1.0)
        // 指定された領域を塗りつぶす
        contextImg.fill(rect)
        
        // ■を描画 (CGContextFillRect)
        let rect2:CGRect = CGRect(x: 10, y: 10, width: size.width-20, height: size.height-20)
        contextImg.setFillColor(red: CGFloat(255) / 255,green: CGFloat(0) / 255,blue: CGFloat(255) / 255, alpha: 1.0)
        contextImg.fill(rect2)
        
        // テキストを描画
        let text = "カレーライス"
        let font = UIFont.boldSystemFont(ofSize: 20)
        let textRect  = CGRect(x: 5, y: 5, width: size.width - 5, height: size.height - 5)
        let textStyle = NSMutableParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
        let textFontAttributes = [
            NSFontAttributeName: font,
            NSForegroundColorAttributeName: UIColor.white,
            NSParagraphStyleAttributeName: textStyle
        ]
        text.draw(in: textRect, withAttributes: textFontAttributes)
        
        
        //　現在のcontextの情報取得
        img = UIGraphicsGetImageFromCurrentImageContext()
        //　contextを終了
        UIGraphicsEndImageContext()
        
        // imgをUIImageViewで表示
        imgView.image = img
        
        return imgView
    }
    
    
    // UIImageをCGContextに描画
    //
    func drawImage(_ image :UIImage) ->UIImage
    {
        let imageRect = CGRect(x: 0,y: 0,width: image.size.width,height: image.size.height)
        
        UIGraphicsBeginImageContext(image.size);
        
        image.draw(in: imageRect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView1 = createImageView(CGPoint(x: 0,y: 50.0), imageFile: "image/ume_r.png")
        self.view.addSubview(imageView1!)
        
        // stepper
        self.stepper1.maximumValue = Double(testTitles.count - 1)
    }
}
