//
//  Const.swift
//  HJDogs
//
//  Created by whj on 2017/10/17.
//  Copyright © 2017年 whj. All rights reserved.
//

import UIKit

let documentsPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] as String

let device = UIDevice.current
let deviceModel = device.model // e.g. @"iPhone", @"iPod touch"
let systemName = device.systemName // e.g. @"iOS"
let systemVersion = device.systemVersion // e.g. @"4.0"

let appDelegate = UIApplication.shared.delegate
let keyWindow = UIApplication.shared.keyWindow
let rootVC = UIApplication.shared.keyWindow?.rootViewController

let screen = UIScreen.main
let screenScale = screen.scale
let screenBounds = screen.bounds
let screenWidth = screenBounds.width
let screenHeight = screenBounds.height

func RGBA(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat) -> UIColor { return UIColor.init(red: (r) / 255.0, green: (g) / 255.0, blue: (b) / 255.0, alpha: a) }
func RGB(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) -> UIColor { return RGBA(r, g, b, 1.0) }
func RGBCA(_ c: CGFloat , _ a: CGFloat) -> UIColor { return RGBA(c, c, c, a) }
func RGBC(_ c: CGFloat) -> UIColor { return RGBCA(c, 1.0) }
func mainColor() -> UIColor { return RGB(24.0, 120.0, 230.0) }
func bgColor() -> UIColor { return RGBC(240.0) }
func wordColor3() -> UIColor { return RGBC(51.0) }
func wordColor6() -> UIColor { return RGBC(102.0) }
func wordColor9() -> UIColor { return RGBC(153.0) }
func wordColorc() -> UIColor { return RGBC(204.0) }
func lineColorc() -> UIColor { return RGBC(170.0) }

func notificationCenter() -> NotificationCenter { return NotificationCenter.default }
func notificationAdd(_ observer: Any, _ SEL: Selector, _ name: Notification.Name?, _ object: Any?) { notificationCenter().addObserver(observer, selector: SEL, name: name, object: object) }
func notificationAdd(_ observer: Any, _ SEL: Selector, _ name: Notification.Name?) { notificationAdd(observer, SEL, name, nil) }
func notificationPost(_ name: Notification.Name, _ object: Any?, _ userInfo: [AnyHashable : Any]? = nil) { notificationCenter().post(name: name, object: object, userInfo: userInfo) }
func notificationPost(_ name: Notification.Name, _ object: Any?) { notificationCenter().post(name: name, object: object) }
func notificationPost(_ name: Notification.Name) { notificationPost(name, nil) }
func notificationRemove(_ observer: Any, _ name: Notification.Name?, _ object: Any?) { notificationCenter().removeObserver(observer, name: name, object: object) }
func notificationRemove(_ observer: Any, _ name: Notification.Name?) { notificationRemove(observer, name, nil) }
func notificationRemove(_ observer: Any) { notificationCenter().removeObserver(observer) }

func cuserDefault() -> UserDefaults { return UserDefaults.standard }
func cuserDefaultSet(_ key: String, _ value: Any?) { cuserDefault().set(value, forKey: key) }
func cuserDefaultGet(_ key: String) -> Any? { return cuserDefault().object(forKey: key) }

func threadMain(_ execute: @escaping () -> Void) { DispatchQueue.main.async(execute: {execute()})}
func threadGlobal(_ execute: @escaping () -> Void) { DispatchQueue.global().async { execute() }}

func cprint(_ message: Any, fileName: String = #file, methodName: String = #function, lineNumber: Int = #line) { print("\nPath: \(fileName as String)\nMethod: \(methodName)\nLineNumber: \(lineNumber)\nMsg: \(message)\n") }
