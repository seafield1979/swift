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
        case ShowImage1
        case ShowImage2
        case Magnify
        case Shrink
        case Text
        case CGContext
        case CGContext2
    }
    
    
    @IBAction func valueChanged(stepper : UIStepper) {
        label1.text = testTitles[Int(stepper.value)]
        
    }
    
    @IBAction func startButtonTapped(sender: AnyObject) {
        let mode = TestMode.init(rawValue: Int(stepper1.value))!
        
        switch mode {
        case .ShowImage1:
            showImage1()
        case .ShowImage2:
            showImage2()
        case .Magnify:
            magnifyImage()
        case .Shrink:
            shrinkImage()
        case .Text:
            showTextImage()
        case .CGContext:
            showCGContextImage()
        case .CGContext2:
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
        imageView1!.frame.size = CGSizeMake( size.width * 2, size.height * 2 )
    }
    
    // imageView1 を縮小する
    func shrinkImage() {
        let size = imageView1!.frame.size
        imageView1!.frame.size = CGSizeMake( size.width / 2, size.height / 2 )
    }
    
    // テキストからUIImageViewを作成して表示する
    func showTextImage() {
        let textImage = image(text: "hogehoge")
        imageView1?.removeFromSuperview()
        
        imageView1 = UIImageView(image: textImage)
        imageView1!.frame = CGRectMake( 50, 200, 200, 20)
        self.view.addSubview(imageView1!)
    }
    
    // CGContextを使ってUIImageを作成
    func showCGContextImage() {
        imageView1?.removeFromSuperview()
        
        imageView1 = createCGContextImageView(CGPointMake(50, 100), size: CGSizeMake(150.0, 150.0))
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
    
    func image(text text : String) -> UIImage! {
        let size = CGSizeMake(200,20)
        
        // ビットマップ形式のグラフィックスコンテキストの生成
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        
        // 描画する文字列の情報を指定する
        // 文字描画時に反映される影の指定
        let shadow = NSShadow()
        shadow.shadowOffset = CGSizeMake(0, -1)
        shadow.shadowColor = UIColor.darkGrayColor()
        shadow.shadowBlurRadius = 0

        // 文字描画に使用するフォントの指定
        let font = UIFont.boldSystemFontOfSize(20.0)
     
        // パラグラフ関連の情報の指定
        let style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.Center
        style.lineBreakMode = NSLineBreakMode.ByClipping
        
        let textFontAttributes = [
            NSFontAttributeName: font,
            NSParagraphStyleAttributeName: style,
            NSShadowAttributeName: shadow,
            NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSBackgroundColorAttributeName: UIColor.blackColor()
        ]
        // 文字列を描画する
        text.drawInRect(CGRectMake(0,0,size.width,size.height), withAttributes:textFontAttributes)
        // 現在のグラフィックスコンテキストの画像を取得する
        let image = UIGraphicsGetImageFromCurrentImageContext()
        // 現在のグラフィックスコンテキストへの編集を終了
        
        // (スタックの先頭から削除する)
        UIGraphicsEndImageContext()

        return image
    }
    
    // 画像ファイルからUIImageViewを作成する
    func createImageView(pos : CGPoint, imageFile : String) -> UIImageView
    {
        let imageView = UIImageView( image: UIImage(named: imageFile) )
        imageView.frame.origin = pos
        return imageView
    }
    
    // CGContext を使用してUIImage & UIImageViewを作成
    func createCGContextImageView(pos : CGPoint, size : CGSize) -> UIImageView
    {
        var imgView:UIImageView! = nil
        var img:UIImage! = nil
        
        // UIImageViewを準備(iPadの横向きにフルで取ったとした場合．ご自身の要件に合わせて下さい．)
        imgView = UIImageView(frame:CGRectMake(pos.x, pos.y, size.width, size.height))
        
        // UIImageを自前で準備
        UIGraphicsBeginImageContextWithOptions(imgView.frame.size, false, 0)
        // context生成
        let contextImg:CGContextRef = UIGraphicsGetCurrentContext()!
        
        // ■を描画 (CGContextFillRect)
        // この塗りつぶす領域の大きさを指定
        let rect:CGRect = CGRectMake(0, 0, size.width, size.height)
        //　色をRGBAで指定 (r,g,b)
        CGContextSetRGBFillColor(contextImg,CGFloat(0) / 255,CGFloat(0) / 255,CGFloat(255) / 255, 1.0)
        // 指定された領域を塗りつぶす
        CGContextFillRect(contextImg, rect)
        
        // ■を描画 (CGContextFillRect)
        let rect2:CGRect = CGRectMake(10, 10, size.width-20, size.height-20)
        CGContextSetRGBFillColor(contextImg,CGFloat(255) / 255,CGFloat(0) / 255,CGFloat(255) / 255, 1.0)
        CGContextFillRect(contextImg, rect2)
        
        // テキストを描画
        let text = "カレーライス"
        let font = UIFont.boldSystemFontOfSize(20)
        let textRect  = CGRectMake(5, 5, size.width - 5, size.height - 5)
        let textStyle = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
        let textFontAttributes = [
            NSFontAttributeName: font,
            NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSParagraphStyleAttributeName: textStyle
        ]
        text.drawInRect(textRect, withAttributes: textFontAttributes)
        
        
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
    func drawImage(image :UIImage) ->UIImage
    {
        let imageRect = CGRectMake(0,0,image.size.width,image.size.height)
        
        UIGraphicsBeginImageContext(image.size);
        
        image.drawInRect(imageRect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView1 = createImageView(CGPointMake(0,50.0), imageFile: "image/ume_r.png")
        self.view.addSubview(imageView1!)
        
        // stepper
        self.stepper1.maximumValue = Double(testTitles.count - 1)
    }
}
