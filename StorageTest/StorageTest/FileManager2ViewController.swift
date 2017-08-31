//
//  FileManager2ViewController.swift
//  StorageTest
//
//  Created by Shusuke Unno on 2017/08/31.
//  Copyright © 2017年 Shusuke Unno. All rights reserved.
//

import UIKit

class FileManager2ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    enum TestMode : Int {
        case write1
        case write2
        case write3
        case write4
        case read
    }
    
    private static let fileName = "hoge.bin"
    
    // アプリからアクセスできるディレクトリ
    enum DirectoryType : String{
        case Document = "/Documents"        // ユーザーデータ用
        case Library = "/Library"           // ユーザーデータ以外
        case CachesDirectory = "/Library/Caches"   // キャッシュ
        
        // ディレクトリのパスを取得する
        public func toString() -> String {
            var searchDir : FileManager.SearchPathDirectory? = nil
        
            switch self {
            case .Document:
                searchDir = FileManager.SearchPathDirectory.documentDirectory
                break
            case .Library:
                searchDir = FileManager.SearchPathDirectory.documentDirectory
                break
            case .CachesDirectory:
                searchDir = FileManager.SearchPathDirectory.documentDirectory
                break
            }

            if searchDir == nil {
                return ""
            }
            return (NSSearchPathForDirectoriesInDomains( searchDir!, FileManager.SearchPathDomainMask.allDomainsMask, true ).first as String?)!
        }
    }
    
    @IBOutlet weak var tableView1: UITableView!
    @IBOutlet weak var textView1: UITextView!
    
    var testMode : TestMode = .write1
    
    fileprivate let pickerData : [String] = [
        "書き込み1",
        "書き込み2",
        "書き込み3",
        "書き込み4",
        "読み込み"
        ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ソフトウェアキーボードを非表示にするボタン
        let hideButton : UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.stop, target: self, action: #selector(self.hideKeyboard))
        
        //ナビゲーションバーの右側にボタン付与
        self.navigationItem.setRightBarButton(hideButton, animated: true)
        
    }
    
    // ソフトウェアキーボードを非表示にする
    func hideKeyboard() {
        textView1.resignFirstResponder()
    }
    
    
    /*
     pickerが選択された際に呼ばれるデリゲートメソッド.
     */
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    }
    
    
    // MARK: UITableViewDelegate
    /*
     セクションの数を返す(オプションなので定義は必須ではない)
     */
    public func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    /*
     セクションのタイトルを返す.
     */
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "section"
    }
    
    /**
     セクションセルの高さを返す
     */
    var sectionHeaderHeight: CGFloat {
        return 30
    }
    
    // 指定のセクション(section:)のセルの数を返す
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return pickerData.count
    }
    
    // セルを返す
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = pickerData[indexPath.row]
        return cell
    }
    
    // セルの高さを返す
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 70
    }
    
    // セルをタップされた時に呼び出される
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        testMode = TestMode.init(rawValue: indexPath.row)!
        
        switch testMode {
        case .write1:
            writeData1()
            break
        case .write2:
            writeData2()
            break
        case .write3:
            writeData3()
            break
        case .write4:
            writeData4()
            break
        case .read:
            readData1()
            break
        }
    }
    
    // テキストファイルをバイナリで保存
    func writeData1() {
        // Documentsフォルダを読み込む
        let dir : String = DirectoryType.Document.toString()
        
        let writeData = "hogehoge".data(using: String.Encoding.utf8)
        let filePath = dir + "/" + FileManager2ViewController.fileName
        FileManager.default.createFile( atPath: filePath, contents: writeData, attributes: nil)
        
        textView1.text = "create binary file \(FileManager2ViewController.fileName)"
        
    }
    
    // いろいろなサイズのバイナリデータを書き込む
    func writeData2() {
        var data = Data()
        
        
//        data.append(contentsOf: <#T##[UInt8]#>)
    }
    func writeData3() {
        
    }
    func writeData4() {
        
    }
    
    // バイナリファイル(fileName)を読み込み16進数で表示する
    func readData1() {
        
        do {
            let dir : String = DirectoryType.Document.toString()
            
            let dataURL = URL(fileURLWithPath: dir + "/" + FileManager2ViewController.fileName)
            
            // ファイル読み込み
            let binaryData = try Data(contentsOf: dataURL, options: [])
            
            // 先頭から32バイトを抽出。
            let kbData : Data
            if binaryData.count < 32 {
                kbData = binaryData
            } else {
                kbData = binaryData.subdata(in: 0..<1024)
            }
            
            // 各バイトを16進数の文字列に変換。
            let stringArray = kbData.map{String(format: "%02X", $0)}
            
            // ハイフォンで16進数を結合する。
            let binaryString = stringArray.joined(separator: "-")
            print(binaryString)
        } catch let error as NSError {
            print("Failed to read the file." + error.localizedDescription)
        }
    }
}
