//
//  FileUtil.swift
//  StorageTest
//      ファイル操作の便利機能
//  Created by Shusuke Unno on 2017/09/02.
//  Copyright © 2017年 Shusuke Unno. All rights reserved.
//

import UIKit

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



public class FileUtil {
    
    // ファイルにテキストを書き込む
    // @param: fileName  保存先のファイル名
    // @param: writeText  ファイルに書き込む文字列
    public static func writeToFile(fileName : String, writeText : String) -> String {
        // Documentsフォルダを読み込む
        let dir = DirectoryType.Document.toString()
        let filePath = dir + "/" + fileName
        
        do {
            // ファイルに書き込む
            try writeText.write( toFile: filePath, atomically: false, encoding: String.Encoding.utf8 )
            
        } catch {
            //エラー処理
            return "failed to writing"
        }
        return "success to writing \(filePath)"
    }
    
    /**
     * ファイルに追加書き込み
     * @param fileName:   書き込み先のファイル名
     * @param writeText:  書き込むテキスト
     */
    public static func appendToFile(fileName : String, writeText : String) -> String {
        let dir = DirectoryType.Document.toString()
        let url = URL(fileURLWithPath: dir + "/\(fileName)")
        
        // 追加書き込みができる OutputStream を開く
        if let output = OutputStream(url: url, append: true) {
            output.open()
            
            // テキストを [UInt8] に変換
            let writeData : [UInt8]? = [UInt8](writeText.utf8)
            
            if writeData != nil {
                // writeメソッドは [UInt8]を受け付けてくれないため、[UInt8] -> UnsafePointer<UInt8>
                let bytes = UnsafePointer<UInt8>(writeData)
                output.write(bytes!, maxLength: writeData!.count)
            }
            output.close()
            
            return "write to \(fileName)"
        }
        return ""
    }
    
    
    /**
     * Documents以下のテキストファイルを読み込む
     * @param filePath: 読み込み元のファイル名
     * @return : 読み込んだテキスト
     */
    public static func readStringFromFile(_ fileName : String) -> String? {
        // Documentsフォルダを読み込む
        let dir = DirectoryType.Document.toString()
        let path_file_name = dir + "/" + fileName
        
        do {
            let text = try NSString( contentsOfFile: path_file_name, encoding: String.Encoding.utf8.rawValue )
            return String(text)
        } catch {
            //エラー処理
            return "failed to read file"
        }
    }
    
    /**
     * ファイルからデータを読み込む
     * @param fileName: 読み込み元のファイル名
     * @return : 読み込んだデータ
     */
    func readDataFromFile(_ fileName: String) -> Data? {
        let dir : String = DirectoryType.Document.toString()
        let dataURL = URL(fileURLWithPath: dir + "/" + fileName)
        var binaryData : Data? = nil
        do {
            binaryData = try Data(contentsOf: dataURL, options: [])
        } catch {
            print("error file read")
        }
        return binaryData
    }
    
    /**
     * フォルダを作成する
     * @param dirName: 作成するフォルダ名
     */
    public static func createDirByName(_ dirName : String) -> String
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
        return "create dir \(createPath)"
    }
    
    /**
     * ファイル削除
     * @param fileName : 削除するファイル名
     * @return : メッセージ
     */
    public static func deleteFile(_ fileName : String) -> String{
        let dir = DirectoryType.Document.toString()
        
        let filePath = dir + "/" + fileName
        do {
            try FileManager.default.removeItem(atPath: filePath)
        }
        catch {
            // Failed
            return "failed to delete file"
        }
        return "delete \(filePath)"
    }
    
    /*
     * ファイル移動(or コピー) src -> dst
     * @param srcFile : 移動元のファイル名
     * @param dstFile : 移動先(コピー)のファイル名
     */
    public static func moveFile(_ srcFile : String, dstFile : String) -> String {
        if let dir = NSSearchPathForDirectoriesInDomains( FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true ).first as String?
        {
            let srcPath = dir + "/" + srcFile
            let dstPath = dir + "/" + dstFile
            do {
                try FileManager.default.moveItem(atPath: srcPath, toPath: dstPath)
            }
            catch {
                // Failed
                return "failed to move"
            }
            return "move \(srcFile) to \(dstFile)"
        }
        return "successed moveFile"
    }
    
    /**
     * ファイルコピー
     * @param srcFile: コピー元のファイル名
     * @param dstFile: コピー先のファイル名
     */
    public static func copyFile(_ srcFile : String, dstFile : String) -> String {
        
        let dir = DirectoryType.Document.toString()
        
        let srcPath = dir + "/" + srcFile
        let dstPath = dir + "/" + dstFile
        do {
            try FileManager.default.copyItem(atPath: srcPath, toPath: dstPath)
        }
        catch {
            // Failed
            return "failed to delete file"
        }
        return "successed to copy"
    }

    // Documentsディレクトリ内のファイルを一覧表示
    public static func showFileList() -> String {
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
//                let result = FileManager.default.fileExists(atPath: dir + "/" + path)
            }
            return text
        }
        catch {
            return "failed to show file list"
        }
    }
    
    /**
     * ファイルに追加書き込みを行う
     * @param fileName: 書き込み先のファイル名
     * @param data: 書き込むデータ
     * @return : 書き込みファイルパス
     */
    func writeToFile(fileName: String, data : Data) -> String{
        // ファイルに書き込む
        let dir = DirectoryType.Document.toString()
        let filePath = dir + "/" + fileName
        FileManager.default.createFile( atPath: filePath, contents: data, attributes: nil)
        
        return filePath
    }
    
    /**
     * ファイルに追加書き込み
     * @param fileName:  書き込み先のファイル名
     * @param data:  書き込みデータ
     * @return : 書き込みファイルパス
     */
    func appendToFile(fileName: String, data : Data) -> String {
        // 書き込み先ファイルのURLを生成
        let dir = DirectoryType.Document.toString()
        let filePath = dir + "/\(fileName)"
        let url = URL(fileURLWithPath: filePath)
        
        // 追加書き込みができる OutputStream を開く
        if let output = OutputStream(url: url, append: true) {
            output.open()
            
            // Data を [UInt8] に変換
            let writeData : [UInt8]? = [UInt8](data)
            
            if writeData != nil {
                // writeメソッドが受け取れる形式に変換
                // [UInt8] -> UnsafePointer<UInt8>
                let bytes = UnsafePointer<UInt8>(writeData)
                output.write(bytes!, maxLength: writeData!.count)
            }
            output.close()
        }
        
        return filePath
    }
    
    // データフォーマットの変換
    // ファイルにデータを読み書きする場合、もう敵のフォーマットに変換する必要があるのでそのテストを行う
    public static func testConvert() {
        // String -> Data
        let data1 = "hoge".data(using: .utf8)
        
        // Data -> String
        let str1 = String(data: data1!, encoding: .utf8)
        print(str1 ?? "")
        
        // Data -> [UInt8]
        let arr1 : [UInt8] = [UInt8](data1!)
        
        // [UInt8] -> Data
        let data2 : Data = Data(arr1)
        
        // [UInt8] -> hex String
        let arr2 : [String] = data1!.map{String(format: "%02X", $0)}
        for str in arr2 {
            print(str, separator: "", terminator: " ")
        }
        
        // [UInt8] -> UnsafePointer<UInt8>
        let bytes : UnsafePointer<UInt8> = UnsafePointer<UInt8>(arr1)
    }

}
