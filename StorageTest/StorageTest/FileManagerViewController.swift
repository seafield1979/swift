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

class FileManagerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    enum TestMode : Int {
        case Write
        case Read
        case CreateDir
        case DeleteFile
        case CopyFile
        case MoveFile
        case ShowFiles
        case CreateDataFile
    }
    
    @IBOutlet weak var textView1: UITextView!
    @IBOutlet weak var testPicker: UIPickerView!
    
    var testMode : TestMode = .Write
    
    private let pickerData: NSArray = [
        "ファイル書き込み",
        "ファイル読み込み",
        "フォルダ作成",
        "ファイル削除",
        "ファイルコピー",
        "ファイル移動",
        "フォルダ列挙",
        "データファイル作成"]
    

    // テストボタンが押された時の処理
    // ピッカーで選択された番号のテストを実行する
    @IBAction func testButtonTapped(sender: AnyObject) {
        
        switch testMode {
        case .Write:
            writeToFile(file: "hoge.txt", writeText : textView1.text)
        case .Read:
            let text = readFromFile("hoge.txt")
            if let _text = text {
                textView1.text = _text
            }
        case .CreateDir:
            createDirByName("mydir")
        case .DeleteFile:
            deleteFile("hoge2.txt")
        case .CopyFile:
            copyFile("hoge.txt", dstFile : "mydir/hoge3.txt")
        case .MoveFile:
            moveFile("hoge.txt", dstFile: "mydir/hoge.txt")
        case .ShowFiles:
            showFileList()
        case .CreateDataFile:
            createFile("hoge.dat")
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Delegateを設定する.
        testPicker.delegate = self
        
        // DataSourceを設定する.
        testPicker.dataSource = self

    }
    
    // ファイルを作成
    func createFile(fileName : String) {
        // Documentsフォルダを読み込む
        if let dir = NSSearchPathForDirectoriesInDomains( NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true ).first as String?
        {

            let writeData = "hogehoge".dataUsingEncoding(NSUTF8StringEncoding)
            let filePath = dir + "/" + fileName
            NSFileManager.defaultManager().createFileAtPath( filePath, contents: writeData, attributes: nil)
            
            textView1.text = "create binary file \(fileName)"
        }
    }
    
    // Documents以下のファイルにテキストを書き込む
    func writeToFile(file filePath : String, writeText : String) {
        let file_name = filePath
        let text = writeText //保存する内容
        
        // Documentsフォルダを読み込む
        if let dir = NSSearchPathForDirectoriesInDomains( NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true ).first as String?
        {
            print(dir)
            let filePath = dir + "/" + file_name
            
            do {
                // ファイルに書き込む
                try text.writeToFile( filePath, atomically: false, encoding: NSUTF8StringEncoding )
                
            } catch {
                //エラー処理
            }
        }
    }
    
    // Documents以下の指定のファイルを読み込む
    func readFromFile(filePath : String) -> String? {
        let file_name = filePath
        
        // Documentsフォルダを読み込む
        if let dir = NSSearchPathForDirectoriesInDomains( NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true ).first as String?
        {
            let path_file_name = dir + "/" + file_name
            
            do {
                
                let text = try NSString( contentsOfFile: path_file_name, encoding: NSUTF8StringEncoding )
                return String(text)
            } catch {
                //エラー処理
            }
        }
        return nil
    }
    
    // Documents以下にフォルダを作成する
    func createDirByName(dirName : String)
    {
        if let dir = NSSearchPathForDirectoriesInDomains( NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true ).first as String?
        {
            let createPath = dir + "/" + dirName    // 作成するディレクトリ名を含んだフルパス
            
            do {
                try NSFileManager.defaultManager().createDirectoryAtPath(createPath, withIntermediateDirectories: true, attributes: nil)
            } catch {
                // Failed to wite folder
            }
            textView1.text = "create dir \(createPath)"
        }
    }
    
    // ファイル削除
    func deleteFile(fileName : String) {
        if let dir = NSSearchPathForDirectoriesInDomains( NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true ).first as String?
        {
            let filePath = dir + "/" + fileName
            do {
                try NSFileManager.defaultManager().removeItemAtPath(filePath)
            }
            catch {
                // Failed
                textView1.text = "failed to delete file"
            }
            textView1.text = "delete \(filePath)"
        }
    }
    
    // ファイル移動 src -> dst
    func moveFile(srcFile : String, dstFile : String) {
        if let dir = NSSearchPathForDirectoriesInDomains( NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true ).first as String?
        {
            let srcPath = dir + "/" + srcFile
            let dstPath = dir + "/" + dstFile
            do {
                try NSFileManager.defaultManager().moveItemAtPath(srcPath, toPath: dstPath)
            }
            catch {
                // Failed
            }
            textView1.text = "move \(srcFile) to \(dstFile)"
        }
    }
    
    // ファイルコピー
    func copyFile(srcFile : String, dstFile : String) {
        if let dir = NSSearchPathForDirectoriesInDomains( NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true ).first as String?
        {
            let srcPath = dir + "/" + srcFile
            let dstPath = dir + "/" + dstFile
            do {
                try NSFileManager.defaultManager().copyItemAtPath(srcPath, toPath: dstPath)
            }
            catch {
                // Failed
                textView1.text = "failed to delete file"
            }
        }
    }
    
    // Documentsディレクトリ内のファイル列挙
    func showFileList() {
        let dir = NSSearchPathForDirectoriesInDomains( NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true ).first as String?
        do{
            let files = try NSFileManager.defaultManager().contentsOfDirectoryAtPath(dir!)
            var text = ""
            for path in files {
                var isDir : ObjCBool = false
                NSFileManager.defaultManager().fileExistsAtPath(dir! + "/" + path, isDirectory: &isDir)
                // フォルダ
                if isDir {
                    text += "[\(path)]\n"
                } else {
                    text += path + "\n"
                }
                let result = NSFileManager.defaultManager().fileExistsAtPath(dir! + "/" + path)
                print(result)
            }
            textView1.text = text
        }
        catch {
            
        }
    }

    
    // MARK: UIPickerViewDataSource
    /*
     pickerに表示する列数を返すデータソースメソッド.
     (実装必須)
     */
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    /*
     pickerに表示する行数を返すデータソースメソッド.
     (実装必須)
     */
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // MARK: UIPickerViewDelegate
    /*
     pickerに表示する値を返すデリゲートメソッド.
     */
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row] as? String
    }
    
    /*
     pickerが選択された際に呼ばれるデリゲートメソッド.
     */
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("row: \(row)")
        testMode = TestMode.init(rawValue: row)!
    }

}
