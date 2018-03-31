//
//  UIDeviceExtension.swift
//  BFKit
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 - 2018 Fabrizio Brancati.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import Foundation
import UIKit

// MARK: - Global variables

/// Used to store BFAPNSIdentifier in defaults.
private let BFAPNSIdentifierDefaultsKey = "BFAPNSIdentifier"
/// Used to store BFDeviceIdentifier in defaults.
private let BFDeviceIdentifierDefaultsKey = "BFDeviceIdentifier"

// MARK: - Global functions

/// Compare OS versions.
///
/// - Parameter version: Version, like "9.0".
/// - Returns: Returns true if equal, otherwise false.
public func osVersionEqual(_ version: String) -> Bool {
    return UIDevice.current.systemVersion.compare(version, options: .numeric) == .orderedSame
}

/// Compare OS versions.
///
/// - Parameter version: Version, like "9.0".
/// - Returns: Returns true if greater, otherwise false.
public func osVersionGreaterThan(_ version: String) -> Bool {
    return UIDevice.current.systemVersion.compare(version, options: .numeric) == .orderedDescending
}

/// Compare OS versions.
///
/// - Parameter version: Version, like "9.0".
/// - Returns: Returns true if greater or equal, otherwise false.
public func osVersionGreaterThanOrEqual(_ version: String) -> Bool {
    return UIDevice.current.systemVersion.compare(version, options: .numeric) != .orderedAscending
}

/// Compare OS versions.
///
/// - Parameter version: Version, like "9.0".
/// - Returns: Returns true if less, otherwise false.
public func osVersionLessThan(_ version: String) -> Bool {
    return UIDevice.current.systemVersion.compare(version, options: .numeric) == .orderedAscending
}

/// Compare OS versions.
///
/// - Parameter version: Version, like "9.0".
/// - Returns: Returns true if less or equal, otherwise false.
public func osVersionLessThanOrEqual(_ version: String) -> Bool {
    return UIDevice.current.systemVersion.compare(version, options: .numeric) != .orderedDescending
}

// MARK: - UIDevice extension

/// This extesion adds some useful functions to UIDevice
public extension UIDevice {
    // MARK: - Variables
    
    /// Get OS version string.
    public static var osVersion: String {
        return UIDevice.current.systemVersion
    }
    
    /// Returns OS version without subversions.
    ///
    /// Example: 9.
    public static var osMajorVersion: Int {
        let subVersion = UIDevice.current.systemVersion.substring(to: ".")
        guard let intSubVersion = Int(subVersion) else {
            return 0
        }
        return intSubVersion
    }
    
    /// Returns device platform string.
    ///
    /// Example: "iPhone7,2".
    ///
    /// - Returns: Returns the device platform string.
    public static var hardwareModel: String {
        var name: [Int32] = [CTL_HW, HW_MACHINE]
        var nameCopy = name
        var size: Int = 2
        sysctl(&nameCopy, 2, nil, &size, &name, 0)
        var hwMachine = [CChar](repeating: 0, count: Int(size))
        sysctl(&nameCopy, 2, &hwMachine, &size, &name, 0)
        
        let hardware: String = String(cString: hwMachine)
        return hardware
    }
    
    /// Returns the user-friendly device platform string.
    /// More info [here](https://www.theiphonewiki.com/wiki/Models).
    ///
    /// Example: "iPad Air (Cellular)".
    ///
    /// - Returns: Returns the user-friendly device platform string.
    public static var detailedModel: String {
        let platform: String = self.hardwareModel
        
        switch platform {
        // iPhone 2G
        case "iPhone1,1":       return "iPhone 2G"
        // iPhone 3G
        case "iPhone1,2":       return "iPhone 3G"
        // iPhone 3GS
        case "iPhone2,1":       return "iPhone 3GS"
        // iPhone 4
        case "iPhone3,1":       return "iPhone 4"
        case "iPhone3,2":       return "iPhone 4"
        case "iPhone3,3":       return "iPhone 4"
        // iPhone 4S
        case "iPhone4,1":       return "iPhone 4S"
        // iPhone 5
        case "iPhone5,1":       return "iPhone 5"
        case "iPhone5,2":       return "iPhone 5"
        // iPhone 5c
        case "iPhone5,3":       return "iPhone 5c"
        case "iPhone5,4":       return "iPhone 5c"
        // iPhone 5s
        case "iPhone6,1":       return "iPhone 5s"
        case "iPhone6,2":       return "iPhone 5s"
        // iPhone 6 / 6 Plus
        case "iPhone7,1":       return "iPhone 6 Plus"
        case "iPhone7,2":       return "iPhone 6"
        // iPhone 6s / 6s Plus
        case "iPhone8,1":       return "iPhone 6s"
        case "iPhone8,2":       return "iPhone 6s Plus"
        // iPhone SE
        case "iPhone8,4":       return "iPhone SE"
        // iPhone 7 / 7 Plus
        case "iPhone9,1":       return "iPhone 7"
        case "iPhone9,2":       return "iPhone 7 Plus"
        case "iPhone9,3":       return "iPhone 7"
        case "iPhone9,4":       return "iPhone 7 Plus"
        // iPhone 8 / 8 Plus
        case "iPhone10,1":      return "iPhone 8"
        case "iPhone10,2":      return "iPhone 8 Plus"
        case "iPhone10,4":      return "iPhone 8"
        case "iPhone10,5":      return "iPhone 8 Plus"
        // iPhone X
        case "iPhone10,3":      return "iPhone X"
        case "iPhone10,6":      return "iPhone X"
        // iPod touch
        case "iPod1,1":         return "iPod touch (1st generation)"
        case "iPod2,1":         return "iPod touch (2nd generation)"
        case "iPod3,1":         return "iPod touch (3rd generation)"
        case "iPod4,1":         return "iPod touch (4th generation)"
        case "iPod5,1":         return "iPod touch (5th generation)"
        case "iPod7,1":         return "iPod touch (6th generation)"
        // iPad / iPad Air
        case "iPad1,1":         return "iPad"
        case "iPad2,1":         return "iPad 2"
        case "iPad2,2":         return "iPad 2"
        case "iPad2,3":         return "iPad 2"
        case "iPad2,4":         return "iPad 2"
        case "iPad3,1":         return "iPad 3"
        case "iPad3,2":         return "iPad 3"
        case "iPad3,3":         return "iPad 3"
        case "iPad3,4":         return "iPad 4"
        case "iPad3,5":         return "iPad 4"
        case "iPad3,6":         return "iPad 4"
        case "iPad4,1":         return "iPad Air"
        case "iPad4,2":         return "iPad Air"
        case "iPad4,3":         return "iPad Air"
        case "iPad5,3":         return "iPad Air 2"
        case "iPad5,4":         return "iPad Air 2"
        case "iPad6,11":         return "iPad Air 2"
        case "iPad6,12":         return "iPad Air 2"
        // iPad mini
        case "iPad2,5":         return "iPad mini"
        case "iPad2,6":         return "iPad mini"
        case "iPad2,7":         return "iPad mini"
        case "iPad4,4":         return "iPad mini 2"
        case "iPad4,5":         return "iPad mini 2"
        case "iPad4,6":         return "iPad mini 2"
        case "iPad4,7":         return "iPad mini 3"
        case "iPad4,8":         return "iPad mini 3"
        case "iPad4,9":         return "iPad mini 3"
        // iPad Pro 9.7
        case "iPad6,3":         return "iPad Pro (9.7-inch)"
        case "iPad6,4":         return "iPad Pro (9.7-inch)"
        // iPad Pro 12.9
        case "iPad6,7":         return "iPad Pro (12.9-inch)"
        case "iPad6,8":         return "iPad Pro (12.9-inch)"
        case "iPad7,1":         return "iPad Pro (12.9-inch, 2nd generation)"
        case "iPad7,2":         return "iPad Pro (12.9-inch, 2nd generation)"
        // iPad Pro 10.5
        case "iPad7,3":         return "iPad Pro (10.5-inch)"
        case "iPad7,4":         return "iPad Pro (10.5-inch)"
        // Apple TV
        case "AppleTV2,1":      return "Apple TV (2nd generation)"
        case "AppleTV3,1":      return "Apple TV (3rd generation)"
        case "AppleTV3,2":      return "Apple TV (3rd generation)"
        case "AppleTV5,3":      return "Apple TV (4th generation)"
        case "AppleTV6,2":      return "Apple TV 4K"
        // Simulator
        case "i386", "x86_64":  return "Simulator"
        default:
            return "Unknown"
        }
    }
    
    /// Returns current device CPU frequency.
    public static var cpuFrequency: Int {
        return self.getSysInfo(HW_CPU_FREQ)
    }
    
    /// Returns current device BUS frequency.
    public static var busFrequency: Int {
        return self.getSysInfo(HW_TB_FREQ)
    }
    
    /// Returns device RAM size.
    public static var ramSize: Int {
        return self.getSysInfo(HW_MEMSIZE)
    }
    
    /// Returns device CPUs number.
    public static var cpusNumber: Int {
        return self.getSysInfo(HW_NCPU)
    }
    
    /// Returns device total memory.
    public static var totalMemory: Int {
        return self.getSysInfo(HW_PHYSMEM)
    }
    
    /// Returns current device non-kernel memory.
    public static var userMemory: Int {
        return self.getSysInfo(HW_USERMEM)
    }
    
    /// Retruns if current device is running in low power mode.
    @available(iOS 9.0, *)
    public static var isLowPowerModeEnabled: Bool {
        return ProcessInfo.processInfo.isLowPowerModeEnabled
    }
    
    /// Low power mode observer.
    private static var lowPowerModeObserver = false
    
    // MARK: - Functions
    
    /// Executes a block everytime low power mode is enabled o disabled.
    ///
    /// - Parameter block: Block to be executed.
    @objc @available(iOS 9.0, *)
    public static func lowPowerModeChanged(_ block: @escaping (_ isLowPowerModeEnabled: Bool) -> Void) {
        if !lowPowerModeObserver {
            NotificationCenter.default.addObserver(self, selector: #selector(lowPowerModeChanged(_:)), name: .NSProcessInfoPowerStateDidChange, object: nil)
            lowPowerModeObserver = true
        }
        
        block(UIDevice.isLowPowerModeEnabled)
    }
    
    /// Check if current device is an iPhone.
    ///
    /// - Returns: Returns true if it is an iPhone, otherwise false.
    public static func isPhone() -> Bool {
        return self.hardwareModel.substring(to: 6) == "iPhone"
    }
    
    /// Check if current device is an iPad.
    ///
    /// - Returns: Returns true if it is an iPad, otherwise false.
    public static func isPad() -> Bool {
        return self.hardwareModel.substring(to: 4) == "iPad"
    }
    
    /// Check if current device is an iPod.
    ///
    /// - Returns: Returns true if it is an iPod, otherwise false.
    public static func isPod() -> Bool {
        return self.hardwareModel.substring(to: 4) == "iPod"
    }
    
    /// Check if current device is an Apple TV.
    ///
    /// - Returns: Returns true if it is an Apple TV, otherwise false.
    public static func isTV() -> Bool {
        return self.hardwareModel.substring(to: 7) == "AppleTV"
    }
    
    /// Check if current device is an Applw Watch.
    ///
    /// - Returns: Returns true if it is an Apple Watch, otherwise false.
    public static func isWatch() -> Bool {
        return self.hardwareModel.substring(to: 5) == "Watch"
    }
    
    /// Check if current device is a Simulator.
    ///
    /// - Returns: Returns true if it is a Simulator, otherwise false.
    public static func isSimulator() -> Bool {
        return self.detailedModel == "Simulator"
    }
    
    /// Returns if current device is jailbroken.
    ///
    /// - Returns: Returns true if current device is jailbroken, otherwise false.
    public static func isJailbroken() -> Bool {
        let canReadBinBash = FileManager.default.fileExists(atPath: "/bin/bash")
        if let canOpenCydia = (UIApplication.value(forKey: "sharedApplication") as? UIApplication)?.canOpenURL(URL(string: "cydia://")!) {
            return canOpenCydia || canReadBinBash
        } else {
            return canReadBinBash
        }
    }
    
    /// Returns system uptime.
    ///
    /// - Returns: eturns system uptime.
    public static func uptime() -> TimeInterval {
        return ProcessInfo.processInfo.systemUptime
    }
    
    /// Returns sysyem uptime as Date.
    ///
    /// - Returns: Returns sysyem uptime as Date.
    public static func uptimeDate() -> Date {
        return Date(timeIntervalSinceNow: -uptime())
    }
    
    /// Returns current device total disk space
    ///
    /// - Returns: Returns current device total disk space.
    public static func totalDiskSpace() -> NSNumber {
        do {
            let attributes = try FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory())
            return attributes[.systemSize] as? NSNumber ?? NSNumber(value: 0.0)
        } catch {
            return NSNumber(value: 0.0)
        }
    }
    
    /// Returns current device free disk space.
    ///
    /// - Returns: Returns current device free disk space.
    public static func freeDiskSpace() -> NSNumber {
        do {
            let attributes = try FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory())
            return attributes[.systemFreeSize] as? NSNumber ?? NSNumber(value: 0.0)
        } catch {
            return NSNumber(value: 0.0)
        }
    }
    
    /// Used to the system info.
    ///
    /// - Parameter typeSpecifier: Type of system info.
    /// - Returns: Return sysyem info.
    fileprivate static func getSysInfo(_ typeSpecifier: Int32) -> Int {
        var name: [Int32] = [CTL_HW, typeSpecifier]
        var nameCopy = name
        var size: Int = 2
        sysctl(&nameCopy, 2, nil, &size, &name, 0)
        var results: Int = 0
        sysctl(&nameCopy, 2, &results, &size, &name, 0)
        
        return results
    }
    
    /// When `save` is false, a new UUID will be created every time.
    /// When `save` is true, a new UUID will be created and saved in the user defatuls.
    /// It will be retrieved on next calls.
    ///
    /// - Parameter save: If true the UUID will be saved, otherview not.
    /// - Returns: Returns the created (`save` = false`) or retrieved (`save` = true) UUID String.
    public static func generateUniqueIdentifier(save: Bool = false) -> String {
        if save {
            let defaults: UserDefaults = UserDefaults.standard
            guard let identifier = defaults.string(forKey: BFDeviceIdentifierDefaultsKey) else {
                let identifier = UUID().uuidString
                defaults.set(identifier, forKey: BFDeviceIdentifierDefaultsKey)
                defaults.synchronize()
                return identifier
            }
            return identifier
        }
        
        return UUID().uuidString
    }
    
    /// Save the unique identifier or update it if there is and it is changed.
    /// Is useful for push notification to know if the unique identifier has changed and needs to be sent to server.
    ///
    /// - Parameters:
    ///   - uniqueIdentifier: The unique identifier to save or update if needed. Must be Data or String type.
    ///   - completion:       The execution block that know if the unique identifier is valid and has to be updated.
    ///                               You have to handle the case if it is valid and the update is needed or not.
    ///
    ///   - isValid:          Returns if the APNS token is valid.
    ///   - needsUpdate:      Returns if the APNS token needsAnUpdate.
    ///   - oldUUID:          Returns the old UUID, if present. May be nil.
    ///   - newUUID:          Returns the new UUID.
    public static func saveAPNSIdentifier(_ uniqueIdentifier: Any, completion: @escaping (_ isValid: Bool, _ needsUpdate: Bool, _ oldUUID: String?, _ newUUID: String) -> Void) {
        var newUUID: String = ""
        var oldUUID: String? = nil
        var isValid = false, needsUpdate = false
        
        if uniqueIdentifier is Data, let data: Data = uniqueIdentifier as? Data, let newUUIDData = data.utf8() {
            isValid = newUUIDData.isUUIDForAPNS()
        } else if uniqueIdentifier is String, let string: String = uniqueIdentifier as? String {
            newUUID = string.readableUUID()
            isValid = newUUID.isUUIDForAPNS()
        }
        
        if isValid {
            let defaults: UserDefaults = UserDefaults.standard
            oldUUID = defaults.string(forKey: BFAPNSIdentifierDefaultsKey)
            if oldUUID == nil || oldUUID != newUUID {
                defaults.set(newUUID, forKey: BFAPNSIdentifierDefaultsKey)
                defaults.synchronize()
                
                needsUpdate = true
            }
        }
        
        completion(isValid, needsUpdate, oldUUID, newUUID)
    }
}
