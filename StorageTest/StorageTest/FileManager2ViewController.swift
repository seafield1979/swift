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
        case append
        case read1
        case read2
        case read3
        case read4
    }
    
    private let fileName = "hoge.bin"
    
    @IBOutlet weak var tableView1: UITableView!
    @IBOutlet weak var textView1: UITextView!
    
    var testMode : TestMode = .write1
    
    fileprivate let pickerData : [String] = [
        "書き込み1",
        "書き込み2",
        "書き込み3",
        "書き込み4",
        "追加書き込み",
        "読み込み1",
        "読み込み2",
        "読み込み3",
        "読み込み4"
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
//    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "section"
//    }
    
    /**
     セクションセルの高さを返す
     */
//    var sectionHeaderHeight: CGFloat {
//        return 30
//    }
    
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
        return 40
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
        case .append:
            appendData()
        case .read1:
            readData1()
            break
        case .read2:
            readData2()
            break
        case .read3:
            readData3()
            break
        case .read4:
            readData4()
            break
        }
    }
    
    func writeToFile(id: Int, data : Data) -> String{
        // ファイルに書き込む
        let dir = DirectoryType.Document.toString()
        let filePath = dir + "/" + "hoge\(id).bin"
        FileManager.default.createFile( atPath: filePath, contents: data, attributes: nil)
        
        return filePath
    }
    

    /**
     * ファイルに追加書き込み
     * @param id:  ファイルのスロット番号
     * @param data:  書き込みデータ
     */
    func appendToFile(id: Int, data : Data) -> String {
        
        let dir = DirectoryType.Document.toString()
        let filePath = dir + "/" + "hoge\(id).bin"
        let url = URL(fileURLWithPath: filePath)
        
        // 追加書き込みができる OutputStream を開く
        if let output = OutputStream(url: url, append: true) {
            output.open()
            
            // テキストを [UInt8] に変換
            let writeData : [UInt8]? = [UInt8](data)
            
            if writeData != nil {
                // writeメソッドは [UInt8]を受け付けてくれないため、[UInt8] -> UnsafePointer<UInt8>
                let bytes = UnsafePointer<UInt8>(writeData)
                output.write(bytes!, maxLength: writeData!.count)
            }
            output.close()
        }
        
        return filePath
    }

    
    func readFromFile(id: Int) -> Data? {
        let dir : String = DirectoryType.Document.toString()
        let dataURL = URL(fileURLWithPath: dir + "/hoge\(id).bin")
        var binaryData : Data? = nil
        do {
            binaryData = try Data(contentsOf: dataURL, options: [])
        } catch {
            print("error file read")
        }
        return binaryData
    }
    
    // テキストファイルをバイナリで保存
    func writeData1() {
        let writeData = "hogehoge".data(using: String.Encoding.utf8)
        
        let path = writeToFile(id: 1, data: writeData!)
        
        textView1.text = "create binary file \(path)"
    }
    
    // いろいろなサイズのバイナリデータを書き込む
    func writeData2() {
        let buf : ByteBuffer = ByteBuffer()
        
        buf.putByte(11)
        buf.putUInt16(22222)
        buf.putUInt32(3333333)
        buf.putFloat(4.0)
        
        let path = writeToFile(id: 2, data: Data(buf.array()))
        
        textView1.text = "write to \(path) size:\(buf.array().count)"
    }
    
    // DateとStringを書き込み
    func writeData3() {
        let buf : ByteBuffer = ByteBuffer()

        // 書き込みデータを生成
        buf.putDate(date: Date())
        buf.putString(str: "hogehoge")
        buf.putStringWithSize(str: "hogehoge2")

        // ファイルに書き込む
        let path = writeToFile(id: 3, data: Data(buf.array()))
        
        textView1.text = "write to \(path) size:\(buf.array().count)"
    }
    
    // 大量のデータを書き込み
    func writeData4() {
        let buf: ByteBuffer = ByteBuffer()
        
        // データ書き込み
        for i in 0..<1000 {
            buf.putInt(i+1)
        }
        
        let path = writeToFile(id: 4, data: Data(buf.array()))
        textView1.text = "write to \(path) size:\(buf.array().count)"
    }
    
    // 追加書き込み
    func appendData() {
        let buf : ByteBuffer = ByteBuffer()
        
        buf.putByte(11)
        
        let path = appendToFile(id: 1, data: Data(buf.array()))
        textView1.text = "write to \(path) size:\(buf.array().count)"
    }

    
    // バイナリファイル(fileName)を読み込み16進数で表示する
    func readData1() {
        // ファイル読み込み
        let binaryData = readFromFile(id: 1)
        if binaryData == nil {
            return
        }
        
        // 先頭からxバイトを抽出。
        let kbData : Data
        let len = 200
        if binaryData!.count < len {
            kbData = binaryData!
        } else {
            kbData = binaryData!.subdata(in: 0..<len)
        }
        
        // 各バイトを16進数の文字列に変換。
        let stringArray = kbData.map{String(format: "%02X", $0)}
        
        // ハイフォンで16進数を結合する。
        let binaryString = stringArray.joined(separator: "-")
        print(binaryString)
        
        textView1.text = binaryString
    }
    
    func readData2() {
        let binaryData = readFromFile(id: 2)
        if binaryData == nil {
            return
        }

        let buf = ByteBuffer(buf: [Byte](binaryData!))
        
        // 取り出す
        let b : Int8 = buf.getInt8()
        let s : Int16 = buf.getShort()
        let i : Int = buf.getInt()
        let f : Float = buf.getFloat()
        
        textView1.text = String(format: "%d %d %d %f", b, s, i, f)
    }
    
    func readData3() {
        let binaryData = readFromFile(id: 3)
        if binaryData == nil {
            return
        }

        // ByteBufferに渡す
        let buf = ByteBuffer(buf: [Byte](binaryData!))
        
        // データを取り出す
        let date = buf.getDate()
        let str1 = buf.getStringWithNil()
        let str2 = buf.getStringWithSize()
        
        let df = DateFormatter()
        df.dateFormat = "yyyy/MM/dd HH:mm:ss"
        
        textView1.text = String(format: "%@ %@ %@", df.string(from: date), str1, str2)
    }

    func readData4() {
        let binaryData = readFromFile(id: 4)
        if binaryData == nil {
            return
        }

        // ByteBufferに渡す
        let buf = ByteBuffer(buf: [Byte](binaryData!))
        
        // データを取り出す
        var str : String = ""
        for i in 0..<1000 {
            str.append("\(i) : \(buf.getInt()) ")
        }
        textView1.text = str
    }
}
