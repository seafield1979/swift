//
//  PickerViewController.swift
//  UIViewTest
//
//  Created by Shusuke Unno on 2016/08/31.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//
/* UIPickerView のサンプル
    UIPickerViewを生成後、delegateにself(ViewController)を設定して
    selfのUIViewController内に以下のdeleteメソッドを実装する
 
    UIPickerViewDataSource
        pickerに表示する列数を返すデータソースメソッド
        func numberOfComponentsInPickerView(pickerView: UIPickerView)
 
        pickerに表示する行数を返すデータソースメソッド.
        func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
     
    UIPickerViewDelegate
        pickerに表示する値を返すデリゲートメソッド.
        func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
 
        pickerが選択された際に呼ばれるデリゲートメソッド.
        func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
 */

import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource
{

    @IBOutlet weak var pickerView: UIPickerView!
    var pickerView2 : UIPickerView?
    
    // 表示する値の配列.
    private let myValues: NSArray = ["その一","その二","その三","その四"]
    private let myValues2: NSArray = ["大江","朝日","西川"]

    
    @IBAction func button1Tapped(sender: AnyObject) {
        // 選択されているインデックスを取得する
        print("picker1:" + pickerView.selectedRowInComponent(0).description)
        
        print("picker2.1:" + pickerView2!.selectedRowInComponent(0).description)
        print("picker2.2:" + pickerView2!.selectedRowInComponent(1).description)
        
    }
    @IBAction func button2Tapped(sender: AnyObject) {
    }
    
    enum PickerType : Int{
        case Single = 1
        case Double = 2
    }
    
    // UIPickerViewを生成する
    func createPickerView(pos : CGPoint) -> UIPickerView
    {
        let pickerView = UIPickerView(frame: CGRectMake(pos.x, pos.y, 420.0, 200.0))
        
        // Delegateを設定する.
        pickerView.delegate = self
        
        // DataSourceを設定する.
        pickerView.dataSource = self
        
        // 選択中の項目に目印を付ける
        pickerView.showsSelectionIndicator = false
    
        return pickerView
    }
    
    
// MARK: UIPickerViewDataSource
    /*
     pickerに表示する列数を返すデータソースメソッド.
     (実装必須)
     */
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        if pickerView.tag == PickerType.Single.rawValue {
            return 1
        }
        else {
            return 2
        }
    }
    /*
     pickerに表示する行数を返すデータソースメソッド.
     (実装必須)
     */
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == PickerType.Single.rawValue {
            return myValues.count
        }
        else {
            if component == 0 {
                return myValues.count
            }
            else {
                return myValues2.count
            }
        }
    }
    
// MARK: UIPickerViewDelegate
    /*
     pickerに表示する値を返すデリゲートメソッド.
     */
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == PickerType.Single.rawValue {
            return myValues[row] as? String
        }
        else {
            if component == 0 {
                return myValues[row] as? String
            }
            else {
                return myValues2[row] as? String
            }
        }
    }
    
    /*
     pickerが選択された際に呼ばれるデリゲートメソッド.
     */
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("row: \(row)")
        
        if pickerView.tag == PickerType.Single.rawValue {
            print("value: \(myValues[row])")
        }
        else {
            if component == 0 {
                print("value: \(myValues[row])")
            }
            else {
                print("value: \(myValues2[row])")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Delegateを設定する.
        pickerView.delegate = self
        
        // DataSourceを設定する.
        pickerView.dataSource = self
        
        pickerView2 = createPickerView(CGPointMake(0, 300))
        pickerView2!.tag = PickerType.Double.rawValue
        view.addSubview(pickerView2!)
    }
}
