//
//  FileManagerViewController.swift
//  StorageTest
//
//  Created by Shusuke Unno on 2016/09/06.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//
//  NSFileManager のサンプル
//

import UIKit

class FileManagerViewController: UNViewController, UITableViewDelegate, UITableViewDataSource {
    enum TestMode : Int {
        case write
        case read
        case write_append
        case read_binary
        case createDir
        case deleteFile
        case copyFile
        case moveFile
        case showFiles
        case testConvert
    }
    
    
    @IBOutlet weak var tableView1: UITableView!
    @IBOutlet weak var textView1: UITextView!
    
    var testMode : TestMode = .write
    
    fileprivate let pickerData : [String] = [
        "ファイル書き込み(テキスト)",
        "ファイル読み込み(テキスト)",
        "ファイル追加書き込み(テキスト)",
        "ファイル読み込み(バイナリ)",
        "フォルダ作成",
        "ファイル削除",
        "ファイルコピー",
        "ファイル移動",
        "フォルダ一覧表示",
        "フォーマット変換テスト"
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
        case .write:
            let text = FileUtil.writeToFile(fileName: "hoge.txt", writeText : textView1.text)
            textView1.text = text
        case .read:
            let text = FileUtil.readStringFromFile("hoge.txt")
            if let _text = text {
                textView1.text = _text
            }
        case .write_append:
            textView1.text = FileUtil.appendToFile(fileName: "hoge.txt", writeText : "hoge ")
            break
        case .read_binary:
            break
        case .createDir:
            textView1.text = FileUtil.createDirByName("mydir")
        case .deleteFile:
            textView1.text = FileUtil.deleteFile("hoge.txt")
        case .copyFile:
            textView1.text = FileUtil.copyFile("hoge.txt", dstFile : "mydir/hoge3.txt")
        case .moveFile:
            textView1.text = FileUtil.moveFile("hoge.txt", dstFile: "mydir/hoge.txt")
        case .showFiles:
            textView1.text = FileUtil.showFileList()
        case .testConvert:
            FileUtil.testConvert()
        }
    }
}
