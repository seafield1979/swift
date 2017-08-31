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
        case write_binary
        case read_binary
        case createDir
        case deleteFile
        case copyFile
        case moveFile
        case showFiles
        case createDataFile
    }
    
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
    
    var testMode : TestMode = .write
    
    fileprivate let pickerData : [String] = [
        "ファイル書き込み(テキスト)",
        "ファイル読み込み(テキスト)",
        "ファイル書き込み(バイナリ)",
        "ファイル読み込み(バイナリ)",
        "フォルダ作成",
        "ファイル削除",
        "ファイルコピー",
        "ファイル移動",
        "フォルダ一覧表示",
        "データファイル作成"]
    
    
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
    
    
    // ファイルを作成
    func createFile(_ fileName : String) {
        // Documentsフォルダを読み込む
        let dir = DirectoryType.Document.toString()
        
        let writeData = "hogehoge".data(using: String.Encoding.utf8)
        let filePath = dir + "/" + fileName
        FileManager.default.createFile( atPath: filePath, contents: writeData, attributes: nil)
        
        textView1.text = "create binary file \(fileName)"
    }
    
    // Documents以下のファイルにテキストを書き込む
    func writeToFile(file filePath : String, writeText : String) {
        let file_name = filePath
        let text = writeText //保存する内容
        
        // Documentsフォルダを読み込む
        let dir = DirectoryType.Document.toString()
        
        print(dir + "/" + filePath)
        
        let filePath = dir + "/" + file_name
        
        do {
            // ファイルに書き込む
            try text.write( toFile: filePath, atomically: false, encoding: String.Encoding.utf8 )
            
        } catch {
            //エラー処理
        }
    }
    
    // バイナリファイルにデータを書き込む
    func writeToBinFile(file filePath : String, data : Data) {
//        let file_name = filePath
//        let text = writeText //保存する内容
//        
//        // Documentsフォルダを読み込む
//        let dir = DirectoryType.Document.toString()
//        
//        print(dir + "/" + filePath)
//        
//        let filePath = dir + "/" + file_name
//        
//        do {
//            // ファイルに書き込む
//            try text.write( toFile: filePath, atomically: false, encoding: String.Encoding.utf8 )
//            
//        } catch {
//            //エラー処理
//        }
    }
    
    // Documents以下の指定のファイルを読み込む
    func readFromFile(_ filePath : String) -> String? {
        let file_name = filePath
        
        // Documentsフォルダを読み込む
        let dir = DirectoryType.Document.toString()
        
        let path_file_name = dir + "/" + file_name
        
        do {
            
            let text = try NSString( contentsOfFile: path_file_name, encoding: String.Encoding.utf8.rawValue )
            return String(text)
        } catch {
            //エラー処理
        }
    
        return nil
    }
    
    // Documents以下にフォルダを作成する
    func createDirByName(_ dirName : String)
    {
        let dir = DirectoryType.Document.toString()
        let createPath = dir + "/" + dirName    // 作成するディレクトリ名を含んだフルパス
        
        do {
            // フォルダがすでにあるかどうかをチェック
            var isDir : ObjCBool = false
            if FileManager.default.fileExists(atPath: createPath,
                                              isDirectory: &isDir) == false
            {
                try FileManager.default.createDirectory(atPath: createPath, withIntermediateDirectories: true, attributes: nil)
            }
        } catch {
            // Failed to wite folder
        }
        textView1.text = "create dir \(createPath)"
    }
    
    // ファイル削除
    func deleteFile(_ fileName : String) {
        let dir = DirectoryType.Document.toString()
        
        let filePath = dir + "/" + fileName
        do {
            try FileManager.default.removeItem(atPath: filePath)
        }
        catch {
            // Failed
            textView1.text = "failed to delete file"
        }
        textView1.text = "delete \(filePath)"
    }
    
    // ファイル移動 src -> dst
    func moveFile(_ srcFile : String, dstFile : String) {
        if let dir = NSSearchPathForDirectoriesInDomains( FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true ).first as String?
        {
            let srcPath = dir + "/" + srcFile
            let dstPath = dir + "/" + dstFile
            do {
                try FileManager.default.moveItem(atPath: srcPath, toPath: dstPath)
            }
            catch {
                // Failed
            }
            textView1.text = "move \(srcFile) to \(dstFile)"
        }
    }
    
    // ファイルコピー
    func copyFile(_ srcFile : String, dstFile : String) {
        
        let dir = DirectoryType.Document.toString()
        
        let srcPath = dir + "/" + srcFile
        let dstPath = dir + "/" + dstFile
        do {
            try FileManager.default.copyItem(atPath: srcPath, toPath: dstPath)
        }
        catch {
            // Failed
            textView1.text = "failed to delete file"
        }
    }
    
    // Documentsディレクトリ内のファイルを一覧表示
    func showFileList() {
        let dir = DirectoryType.Document.toString()

        do {
            let files = try FileManager.default.contentsOfDirectory(atPath: dir)
            var text = ""
            for path in files {
                var isDir : ObjCBool = false
                FileManager.default.fileExists(atPath: dir + "/" + path, isDirectory: &isDir)
                // フォルダ
                if isDir.boolValue {
                    text += "[\(path)]\n"
                } else {
                    text += path + "\n"
                }
                let result = FileManager.default.fileExists(atPath: dir + "/" + path)
                print(text)
            }
            textView1.text = text
        }
        catch {
        }
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
            writeToFile(file: "hoge.txt", writeText : textView1.text)
        case .read:
            let text = readFromFile("hoge.txt")
            if let _text = text {
                textView1.text = _text
            }
        case .write_binary:
//            writeToBinFile(file: "hoge.bin", writeData: data)
            break
        case .read_binary:
            break
        case .createDir:
            createDirByName("mydir")
        case .deleteFile:
            deleteFile("hoge2.txt")
        case .copyFile:
            copyFile("hoge.txt", dstFile : "mydir/hoge3.txt")
        case .moveFile:
            moveFile("hoge.txt", dstFile: "mydir/hoge.txt")
        case .showFiles:
            showFileList()
        case .createDataFile:
            createFile("hoge.dat")
        }
    }
}
