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
        
        testImage(mode: _mode )
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
            image = createImage(image: UIImage(named: "image/ume.png")!)
            
        case .CropImage:
            image = cropImage(image: UIImage(named: "image/ume.png")!,cropRect: CGRect(x:50, y:50, width: 100, height: 100))
            
        case .ResizeImage:
            image = resizeImage(image: UIImage(named: "image/ume.png")!, size: CGSize(width:200, height: 200))
            
        case .ResizeCrop:
            image = resizeCropImage(image: UIImage(named: "image/ume.png")!,
                                    srcRect: CGRect(x: 50,y: 50,width: 100,height: 100),
                                    scale: 0.5)
            
        case .DrawRect:
            image = createRectImage(size:CGSize(width:200,height:200))
            
        case .DrawLine:
            image = createLineImage()
            
        case .DrawCircle:
            image = createCircleImage()
            
        case .DrawText:
            image = createTextImage(text:"Hoge Hoge")
        }
        
        let imageView = UIImageView(image: image)
        imageView.frame.origin = CGPoint(x:50, y:100)
        self.view.addSubview(imageView)
        self.imageView = imageView
    }
    
    // MARK: CGContext func
    
    // UIImageをCGContextに描画(画像の描画のみ、コンテキストを取得しない)
    func createImage(image :UIImage) ->UIImage
    {
        // 画像コンテキスト作成(Canvasみたいなもの)
        let imageRect = CGRect(x:0,y:0, width: image.size.width, height: image.size.height)
        
        UIGraphicsBeginImageContext(image.size);
        
        // コンテキストにUIImageを描画
        image.draw(in: imageRect)

        // ~~~ ここにテキストや図形等を描画 ~~~

        // 出力UIImageを取得
        let newImage = UIGraphicsGetImageFromCurrentImageContext();
        
        // コンテキストを解放
        UIGraphicsEndImageContext()
        
        return newImage!
    }

    // 一部分を切り抜いた画像を取得
    func cropImage(image: UIImage, cropRect : CGRect) -> UIImage
    {
        let srcRect = CGRect(x:0,y:0,width: image.size.width, height:image.size.height)
        
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
        image.draw(in: CGRect(x:0, y:0, width:image.size.width, height:image.size.height))
        let resizedImage : UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        
        // 切り抜き処理
        let cgImage : CGImage = resizedImage!.cgImage!
        let cropedRef   = cgImage.cropping(to: _cropRect)
        let cropedImage = UIImage.init(cgImage: cropedRef!)
        
        UIGraphicsEndImageContext()
        
        return cropedImage
    }

    // サイズを変更
    // 元の画像(image)を width, height のサイズに変更する
    // width, height が元の画像より小さいなら縮小、大きいなら拡大される
    func resizeImage(image: UIImage, size: CGSize) -> UIImage
    {
        let srcRect = CGRect(x:0, y:0, width: image.size.width, height:image.size.height)
        
        // resizeImage にリサイズ済みの画像を生成する
        UIGraphicsBeginImageContext(srcRect.size);
        image.draw(in:CGRect(x:0, y:0, width:size.width, height:size.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    
    // リサイズ＆切り抜き
    // 画像(image)を srcRectで切り抜き、 scale倍にリサイズする
    // 処理的にはリサイズしてからそのリサイズ画像の一部分を切り抜いている
    func resizeCropImage(image: UIImage, srcRect : CGRect, scale : CGFloat) -> UIImage
    {
        // resizeImage にリサイズ済みの画像を生成する
        let scaledSize = CGSize(width:image.size.width * scale,
                                height:image.size.height * scale)

        UIGraphicsBeginImageContext(scaledSize);
        
        // リサイズ処理
        image.draw(in: CGRect(x:0, y:0, width:scaledSize.width, height:scaledSize.height))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // 切り抜き処理
        let cropRect = CGRect( x:srcRect.origin.x * scale,
                               y:    srcRect.origin.y * scale,
                               width:    srcRect.size.width * scale,
                               height:    srcRect.size.height * scale)
        
        let cropedRef   = resizedImage!.cgImage!.cropping(to: cropRect)
        let cropedImage = UIImage(cgImage: cropedRef!)
        
        UIGraphicsEndImageContext()
        
        return cropedImage
    }
 
    // 矩形描画
    func createRectImage(size : CGSize) -> UIImage
    {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        
        let context:CGContext = UIGraphicsGetCurrentContext()!
        
        // ■を描画 (CGContextFillRect)
        // この塗りつぶす領域の大きさ
        let rect:CGRect = CGRect(x:0, y:0, width:size.width, height:size.height)
        //　色をRGBAで指定
        context.setFillColor(red: CGFloat(0) / 255,green: CGFloat(0) / 255,blue: CGFloat(255) / 255, alpha: 1.0)
        // 矩形塗りつぶし
        context.fill( rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    
    // ライン描画
    func createLineImage() -> UIImage
    {
        UIGraphicsBeginImageContextWithOptions(CGSize(width:300,height:300), false, 0)
        let context:CGContext = UIGraphicsGetCurrentContext()!
        
        // ラインの色、太さを指定
        context.setFillColor(red:1.0, green:1.0, blue:0.0, alpha:1.0);
        context.setLineWidth(10.0);
        
        // ライン描画
        // 色
        context.setStrokeColor(red:1.0, green:0.0, blue:1.0, alpha:1.0);
        context.move(to: CGPoint(x:50, y:100));
        context.addLine(to: CGPoint(x:150, y:100));
        context.addLine(to: CGPoint(x:150, y:150));
        context.addLine(to: CGPoint(x:50, y:150));
        context.addLine(to: CGPoint(x:50, y:200));
        context.addLine(to: CGPoint(x:150, y:200));
        context.strokePath();

        // ライン2描画
        // 色
        context.setStrokeColor(red: 0.0, green:1.0, blue:1.0, alpha:1.0);
        context.move(to: CGPoint(x:250, y:50));
        context.addLine(to: CGPoint(x:250, y:200));
        
        context.strokePath();
        
        // ベジェ曲線
        // 色
        context.setStrokeColor(red: 0.0, green:0.5, blue:1.0, alpha:1.0);
        context.move(to: CGPoint(x:50, y:50));
        context.addCurve(to: CGPoint(x:100, y:250),  // cp1
            control1:CGPoint(x:100, y:200),           // cp2
            control2:CGPoint(x:150, y:200));          // x,y
        context.addCurve(to: CGPoint(x:200, y:350),  // cp1
            control1:CGPoint(x:50, y:250),           // cp2
            control2:CGPoint(x:250, y:50));          // x,y
        context.strokePath();
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }

    // 円描画
    func createCircleImage() -> UIImage
    {
        // コンテキストを開く
        UIGraphicsBeginImageContextWithOptions(CGSize(width:400,height:400), false, 0)
        // コンテキストを得る
        let context:CGContext = UIGraphicsGetCurrentContext()!
        
        if false {
            //描画の中心点
            let cx : CGFloat = 100.0
            let cy : CGFloat = 100.0
            
            //円の半径
            let R : CGFloat = 50.0
            
            //円の範囲
            let rectEllipse = CGRect(x:cx - R, y:cy - R, width:R*2, height:R*2);
            
            //円の中身を描画
            context.setFillColor(red: 1.0, green:0.0, blue:0.0, alpha:0.1);
            context.fillEllipse(in: rectEllipse);
            
            //円の線を描画
            context.setStrokeColor(red: 1.0, green:0.0, blue:0.0, alpha:0.5);
            context.setLineWidth(2.0);
            context.strokeEllipse(in:rectEllipse);
        }
        
        if true {
            //透明レイヤー開始
            context.beginTransparencyLayer(auxiliaryInfo: nil)
            
            //パスの描画を開始
            context.beginPath()
            
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
            context.move(to: CGPoint(x:200, y:100));
            context.addArc(center: CGPoint(x:100,y:100), radius: 100.0, startAngle: startAngle, endAngle: endAngle, clockwise: false)
            context.closePath();
            context.setFillColor(UIColor.black.cgColor)
            context.drawPath(using: CGPathDrawingMode.fill)
            
            //透明レイヤー終了
            context.endTransparencyLayer()
        }
        
        // コンテキストに描画済の画像を得る
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        // コンテキストを解放
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    // テキストの描画
    func createTextImage(text : String) -> UIImage
    {
        let size = CGSize(width:200, height:50)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        
        // 描画する文字列の情報を指定する
        // 文字描画時に反映される影の指定
        let shadow = NSShadow()
        shadow.shadowOffset = CGSize(width:0, height:-1)
        shadow.shadowColor = UIColor.darkGray.cgColor
        shadow.shadowBlurRadius = 0
        
        // 文字描画に使用するフォントの指定
        let font = UIFont.boldSystemFont(ofSize:20.0)
        
        // パラグラフ関連の情報の指定
        let style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.center
        style.lineBreakMode = NSLineBreakMode.byClipping
        
        let textFontAttributes = [
            NSFontAttributeName: font,
            NSParagraphStyleAttributeName: style,
            NSShadowAttributeName: shadow,
            NSForegroundColorAttributeName: UIColor.white.cgColor,
            NSBackgroundColorAttributeName: UIColor.black.cgColor
        ] as [String : Any]
        // 文字列を描画する
        text.draw(in: CGRect(x:0,y:0,width: size.width, height:size.height), withAttributes:textFontAttributes)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        testImage(mode: TestMode.DrawImage)
        
        label1.text = testTitles[0]
        stepper1.maximumValue = Double(testTitles.count - 1)
    }
}
