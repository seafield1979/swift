//
//  ViewControllerResource.swift
//  StorageTest
//
//  Created by Shusuke Unno on 2017/08/01.
//  Copyright © 2017年 Shusuke Unno. All rights reserved.
//

import UIKit

class ViewControllerResource: UNViewController {

    @IBOutlet weak var textView1: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // リソースファイルを表示する
    func showFile(path : String) {
        // プロジェクトに登録されたファイルのURLを取得
        let url = Bundle.main.url(forResource: path, withExtension: nil)
        
        if url != nil {
            do {
                // テキストファイルを取得
                let text = try String.init(contentsOf: url!, encoding: .utf8)
                textView1.text = text
            } catch {
                print("error")
            }
        }
    }
    
    // バイナリーファイルを読んでテキストビューに表示する
    func readBinData(path : String, readSize: Int) {
        let url = Bundle.main.url(forResource: path, withExtension: nil)

        if url == nil {
            return
        }
        do {
            // ファイル読み込み
            let binaryData = try Data(contentsOf: url!, options: [])
            
            var readData : Data? = nil
            
            if readSize <= 0 {
                // 全サイズ取得
                readData = binaryData
            } else {
                // 指定サイズ取得
                var size = readSize
                if size > binaryData.count {
                    size = binaryData.count
                }
                readData = binaryData.subdata(in: 0..<size)
            }
            
            // 各バイトを16進数の文字列に変換。
            let stringArray = readData!.map{
                String(format: "%02X", $0)
            }
            // ハイフォンで16進数を結合する。
            let binaryString = stringArray.joined(separator: "-")

            textView1.text = binaryString
        } catch {
            print("Failed to read the file.")
        }
    }
    
    
    @IBAction func button1Clicked(_ sender: Any) {
        showFile(path: "text1.txt")
    }
    
    @IBAction func button2Clicked(_ sender: Any) {
        readBinData(path: "data1.bin", readSize: 100)
    }
    
    @IBAction func button3Clicked(_ sender: Any) {
    }
}
