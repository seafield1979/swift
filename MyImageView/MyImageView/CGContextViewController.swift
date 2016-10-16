//
//  CGContextViewController.swift
//  MyImageView
//
//  Created by Shusuke Unno on 2016/09/08.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//
// CGContextを使用したサンプル
/*
 CGContextを使用すると
    画像(UIImage)の描画
    図形(矩形、ライン、円等）の描画
    テキスト(フォント、サイズ指定)の描画
 等を行い、結果をUIImageで取得することができる
 */

import UIKit

class CGContextViewController: UIViewController {

    @IBOutlet weak var stepper1: UIStepper!
    @IBOutlet weak var label1: UILabel!
    
    let testTitles = ["DrawImage",
                      "CropImage",
                      "ResizeImage",
                      "ResizeCrop",
                      "DrawRect",
                      "DrawLine",
                      "DrawCircle",
                      "DrawText"]
    
    enum TestMode : Int {
        case DrawImage      // シンプルなUIImageの描画
        case CropImage      // 画像の切り抜き
        case ResizeImage    // 画像のリサイズ(拡大縮小)
        case ResizeCrop     // 画像の切り抜き＆リサイズ
        case DrawRect       // 矩形(長方形)の描画
        case DrawLine       // 線の描画
        case DrawCircle     // 円の描画
        case DrawText       // テキストの描画
    }
    
    var imageView : UIImageView?  // 画面に表示中の画像
    
    @IBAction func stepperValueChanged(sender: AnyObject) {
        label1.text = testTitles[Int(stepper1.value)]
    }
    @IBAction func button1Tapped(sender: AnyObject) {
        let _mode = TestMode.init(rawValue: Int(stepper1.value))!
        
        testImage( _mode )
    }
    
    // MARK: Test func
    
    func testImage(mode : TestMode) {
        
        // 現在表示中の imageView を削除
        if let _imageView = self.imageView {
            _imageView.removeFromSuperview()
            self.imageView = nil
        }
        
        // 新しいUIImageを元にimageViewを作成する
        var image : UIImage! = nil
        
        switch mode {
        case .DrawImage:
            image = createImage(UIImage(named: "image/ume.png")!)
            
        case .CropImage:
            image = cropImage(UIImage(named: "image/ume.png")!,cropRect: CGRectMake(50,50,100,100))
            
        case .ResizeImage:
            image = resizeImage(UIImage(named: "image/ume.png")!, size: CGSizeMake(200,200))
            
        case .ResizeCrop:
            image = resizeCropImage(UIImage(named: "image/ume.png")!,
                                    srcRect: CGRectMake( 50, 50, 100, 100),
                                    scale: 0.5)
            
        case .DrawRect:
            image = createRectImage(CGSizeMake(200,200))
            
        case .DrawLine:
            image = createLineImage()
            
        case .DrawCircle:
            image = createCircleImage()
            
        case .DrawText:
            image = createTextImage("Hoge Hoge")
        }
        
        let imageView = UIImageView(image: image)
        imageView.frame.origin = CGPointMake(50, 100)
        self.view.addSubview(imageView)
        self.imageView = imageView
    }
    
    // MARK: CGContext func
    
    // UIImageをCGContextに描画(画像の描画のみ、コンテキストを取得しない)
    func createImage(image :UIImage) ->UIImage
    {
        // 画像コンテキスト作成(Canvasみたいなもの)
        let imageRect = CGRectMake(0,0,image.size.width,image.size.height)
        
        UIGraphicsBeginImageContext(image.size);
        
        // コンテキストにUIImageを描画
        image.drawInRect(imageRect)

        // ~~~ ここにテキストや図形等を描画 ~~~

        // 出力UIImageを取得
        let newImage = UIGraphicsGetImageFromCurrentImageContext();
        
        // コンテキストを解放
        UIGraphicsEndImageContext()
        
        return newImage
    }

    // 一部分を切り抜いた画像を取得
    func cropImage(image: UIImage, cropRect : CGRect) -> UIImage
    {
        let srcRect = CGRectMake(0,0,image.size.width,image.size.height)
        
        // 切り抜き領域が元画像をはみ出していたら修正
        var _cropRect = cropRect
        if cropRect.origin.x + cropRect.size.width > srcRect.size.width {
            _cropRect.size.width = srcRect.size.width - cropRect.origin.x
        }
        if cropRect.origin.y + cropRect.size.height > srcRect.size.height {
            _cropRect.size.height = srcRect.size.height - cropRect.origin.y
        }
        
        // resizeImage にリサイズ済みの画像を生成する
        UIGraphicsBeginImageContext(srcRect.size);
        image.drawInRect(CGRectMake(0, 0, image.size.width, image.size.height))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // 切り抜き処理
        let cropedRef   = CGImageCreateWithImageInRect(resizedImage.CGImage, _cropRect)
        let cropedImage = UIImage(CGImage: cropedRef!)
        
        UIGraphicsEndImageContext()
        
        return cropedImage
    }

    // サイズを変更
    // 元の画像(image)を width, height のサイズに変更する
    // width, height が元の画像より小さいなら縮小、大きいなら拡大される
    func resizeImage(image: UIImage, size: CGSize) -> UIImage
    {
        let srcRect = CGRectMake(0,0,image.size.width,image.size.height)
        
        // resizeImage にリサイズ済みの画像を生成する
        UIGraphicsBeginImageContext(srcRect.size);
        image.drawInRect(CGRectMake(0, 0, size.width, size.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    
    // リサイズ＆切り抜き
    // 画像(image)を srcRectで切り抜き、 scale倍にリサイズする
    // 処理的にはリサイズしてからそのリサイズ画像の一部分を切り抜いている
    func resizeCropImage(image: UIImage, srcRect : CGRect, scale : CGFloat) -> UIImage
    {
        // resizeImage にリサイズ済みの画像を生成する
        let scaledSize = CGSizeMake(image.size.width * scale, image.size.height * scale)

        UIGraphicsBeginImageContext(scaledSize);
        
        // リサイズ処理
        image.drawInRect(CGRectMake(0, 0, scaledSize.width, scaledSize.height))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // 切り抜き処理
        let cropRect = CGRectMake( srcRect.origin.x * scale,
                                   srcRect.origin.y * scale,
                                   srcRect.size.width * scale,
                                   srcRect.size.height * scale)
        
        let cropedRef   = CGImageCreateWithImageInRect(resizedImage.CGImage, cropRect)
        let cropedImage = UIImage(CGImage: cropedRef!)
        
        UIGraphicsEndImageContext()
        
        return cropedImage
    }
 
    // 矩形描画
    func createRectImage(size : CGSize) -> UIImage
    {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        
        let context:CGContextRef = UIGraphicsGetCurrentContext()!
        
        // ■を描画 (CGContextFillRect)
        // この塗りつぶす領域の大きさ
        let rect:CGRect = CGRectMake(0, 0, size.width, size.height)
        //　色をRGBAで指定
        CGContextSetRGBFillColor(context,CGFloat(0) / 255,CGFloat(0) / 255,CGFloat(255) / 255, 1.0)
        // 矩形塗りつぶし
        CGContextFillRect(context, rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    
    // ライン描画
    func createLineImage() -> UIImage
    {
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(300,300), false, 0)
        let context:CGContextRef = UIGraphicsGetCurrentContext()!
        
        // ラインの色、太さを指定
        CGContextSetRGBFillColor(context, 1.0, 1.0, 0.0, 1.0);
        CGContextSetLineWidth(context, 10.0);
        
        // ライン描画
        // 色
        CGContextSetRGBStrokeColor(context, 1.0, 0.0, 1.0, 1.0);
        CGContextMoveToPoint(context, 50, 100);
        CGContextAddLineToPoint(context, 150, 100);
        CGContextAddLineToPoint(context, 150, 150);
        CGContextAddLineToPoint(context, 50, 150);
        CGContextAddLineToPoint(context, 50, 200);
        CGContextAddLineToPoint(context, 150, 200);
        CGContextStrokePath(context);

        // ライン2描画
        // 色
        CGContextSetRGBStrokeColor(context, 0.0, 1.0, 1.0, 1.0);
        CGContextMoveToPoint(context, 250, 50);
        CGContextAddLineToPoint(context, 250, 200);
        
        CGContextStrokePath(context);
        
        // ベジェ曲線
        // 色
        CGContextSetRGBStrokeColor(context, 0.0, 0.5, 1.0, 1.0);
        CGContextMoveToPoint(context,50, 50);
        CGContextAddCurveToPoint(context, 100, 250,  // cp1
                                 100, 200,           // cp2
                                 150, 200);          // x,y
        CGContextAddCurveToPoint(context, 200, 350,
                                 50, 250,
                                 250, 50);
        CGContextStrokePath(context);
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }

    // 円描画
    func createCircleImage() -> UIImage
    {
        // コンテキストを開く
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(400,400), false, 0)
        // コンテキストを得る
        let context:CGContextRef = UIGraphicsGetCurrentContext()!
        
        if false {
            //描画の中心点
            let cx : CGFloat = 100.0
            let cy : CGFloat = 100.0
            
            //円の半径
            let R : CGFloat = 50.0
            
            //円の範囲
            let rectEllipse = CGRectMake(cx - R, cy - R, R*2, R*2);
            
            //円の中身を描画
            CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 0.1);
            CGContextFillEllipseInRect(context, rectEllipse);
            
            //円の線を描画
            CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 0.5);
            CGContextSetLineWidth(context, 2.0);  
            CGContextStrokeEllipseInRect(context, rectEllipse);  
        }
        
        if true {
            //透明レイヤー開始
            CGContextBeginTransparencyLayer(context, nil)
            
            //パスの描画を開始
            CGContextBeginPath(context)
            
            //開始角度
            let startAngle : CGFloat = 0//-(90 * CGFloat(M_PI)/180);
            
            //円グラフの角度
            let endAngle : CGFloat = CGFloat(M_PI) / 180 * 90.0
            
            //円弧を描画する
            /*
             void CGContextAddArc ( CGContextRef c, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise )
             
                 c	グラフィックスコンテキスト
                 x	円弧の中心になるX座標
                 y	will
                 radius	円弧の半径
                 startAngle	X軸に対する円弧の開始角度（ラジアン）
                 endAngle	X軸に対する円弧の終了角度（ラジアン）
                 clockwise	時計回りに円弧を作成する場合は1を、反時計回りに円弧を作成する場合は0を指定
            */
            CGContextMoveToPoint(context, 200, 100);
            CGContextAddArc(context, 100, 100, 100.0, startAngle, endAngle, 0);
            CGContextClosePath(context);
            
            CGContextSetFillColorWithColor(context, UIColor.blackColor().CGColor);
            CGContextDrawPath(context, CGPathDrawingMode.Fill)
            
            //透明レイヤー終了
            CGContextEndTransparencyLayer(context)
        }
        
        // コンテキストに描画済の画像を得る
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        // コンテキストを解放
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    // テキストの描画
    func createTextImage(text : String) -> UIImage
    {
        let size = CGSizeMake(200,50)
        
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
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        testImage(TestMode.DrawImage)
        
        label1.text = testTitles[0]
        stepper1.maximumValue = Double(testTitles.count - 1)
    }
}
