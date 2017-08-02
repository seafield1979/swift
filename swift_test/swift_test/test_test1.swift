//
//  test_test1.swift
//  swift_test
//      自由に使用するテストファイル
//  Created by Shusuke Unno on 2017/08/01.
//  Copyright © 2017年 sunsunsoft. All rights reserved.
//

import Foundation

class UNTestTest1 {
    func test1() {
        let csvStr = UNTestTest1.getStringFromFile("fish.csv")
        if csvStr != nil {
            let csvLines = UNTestTest1.splitCsv(csvStr!)
        
            for line in csvLines {
                let columns = UNTestTest1.splitCsvLine(line)
                print(Array(columns))
            }
        }
    }
    
    func test2() {
        
    }
    
    func test3() {
        
    }
    
    // リソースファイルを表示する
    static func getStringFromFile(_ filePath : String) -> String! {
        // プロジェクトに登録されたファイルのURLを取得
        let url = Bundle.main.url(forResource: filePath, withExtension: nil)
        
        if url != nil {
            do {
                // テキストファイルを取得
                let text = try String.init(contentsOf: url!, encoding: .utf8)
                return text
            } catch {
                print("error")
            }
        }
        return nil
    }
    
    // Documents以下の指定のファイルを読み込む
    static func readFromFile(_ filePath : String) -> String? {
        let file_name = filePath
        
        // Documentsフォルダを読み込む
        if let dir = NSSearchPathForDirectoriesInDomains( FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true ).first as String?
        {
            let path_file_name = dir + "/" + file_name
            
            do {
                
                let text = try NSString( contentsOfFile: path_file_name, encoding: String.Encoding.utf8.rawValue )
                return String(text)
            } catch {
                //エラー処理
            }
        }
        return nil
    }
    
    /**
     * CSVファイルを１行ずつに分割する
     */
    static func splitCsv(_ str : String) -> [String] {
        // 改行で分割する
        let separated = str.components(separatedBy: "\n")
        
        return separated
    }
    
    /**
     * CSVファイルの１行をカンマで分割する
     * "~"で囲まれる文字の中のカンマは区切り文字として使用しない
     * @param str
     * @return
     */
    static func splitCsvLine(_ str : String) -> List<String> {
        let list : List<String> = List()
        var buf : String = ""
        var seekDQ = false      // ダブルクォートを見つけたフラグ
        let characters = str.characters.map { String($0) } // String -> [String]
        
        for ch in characters {       // １文字づつ処理する
            if seekDQ {
                if ch == "\"" {
                    seekDQ = false
                    list.append(decodeCsv(buf))
                    buf = ""
                }
                else {
                    buf.append(ch)
                }
            }
            else {
                // " を見つけたら次の"を見つけるまでカンマスキップモード
                if ch == "\"" {
                    seekDQ = true
                } else if (ch  == ",") {
                    if (buf.count > 0) {
                        list.append(decodeCsv(buf))
                        buf = ""
                    }
                } else {
                    buf.append(ch)
                }
            }
        }
        if buf.count > 0 {
            // "\n" を改行に変換してからリストに追加する
            list.append( decodeCsv(buf))
        }

        return list
    }

    /**
     * CSV中のワードをデコードする
     * @param word
     * @return
     */
    private static func decodeCsv(_ word : String) -> String {
        // \nを改行に変換
        return word.replacingOccurrences(of: "\\n", with: "\n")
    }
}
