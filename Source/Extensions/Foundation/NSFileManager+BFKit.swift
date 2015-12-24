//
//  NSFileManager+BFKit.swift
//  BFKit
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 - 2016 Fabrizio Brancati. All rights reserved.
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

/// This extension adds some useful functions to NSFileManager
public extension NSFileManager {
    // MARK: - Enums -
    
    /**
     Directory type enum
    
     - MainBundle: Main bundle directory
     - Library:    Library directory
     - Documents:  Documents directory
     - Cache:      Cache directory
     */
    public enum DirectoryType : Int {
        case MainBundle
        case Library
        case Documents
        case Cache
    }
    
    // MARK: - Class functions -
    
    /**
     Read a file an returns the content as String
    
     - parameter file:   File name
     - parameter ofType: File type
    
     - returns: Returns the content of the file a String
     */
    public static func readTextFile(file: String, ofType: String) throws -> String? {
        return try String(contentsOfFile: NSBundle.mainBundle().pathForResource(file, ofType: ofType)!, encoding: NSUTF8StringEncoding)
    }
    
    /**
     Save a given array into a PLIST with the given filename
    
     - parameter directory: Path of the PLIST
     - parameter filename:  PLIST filename
     - parameter array:     Array to save into PLIST
    
     - returns: Returns true if the operation was successful, otherwise false
     */
    public static func saveArrayToPath(directory: DirectoryType, filename: String, array: Array<AnyObject>) -> Bool {
        var finalPath: String
        
        switch directory {
        case .MainBundle:
            finalPath = self.getBundlePathForFile("\(filename).plist")
        case .Library:
            finalPath = self.getLibraryDirectoryForFile("\(filename).plist")
        case .Documents:
            finalPath = self.getDocumentsDirectoryForFile("\(filename).plist")
        case .Cache:
            finalPath = self.getCacheDirectoryForFile("\(filename).plist")
        }
        
        return NSKeyedArchiver.archiveRootObject(array, toFile: finalPath)
    }
    
    /**
     Load array from a PLIST with the given filename
    
     - parameter directory: Path of the PLIST
     - parameter filename:  PLIST filename
    
     - returns: Returns the loaded array
     */
    public static func loadArrayFromPath(directory: DirectoryType, filename: String) -> AnyObject? {
        var finalPath: String
        
        switch directory {
        case .MainBundle:
            finalPath = self.getBundlePathForFile(filename)
        case .Library:
            finalPath = self.getLibraryDirectoryForFile(filename)
        case .Documents:
            finalPath = self.getDocumentsDirectoryForFile(filename)
        case .Cache:
            finalPath = self.getCacheDirectoryForFile(filename)
        }
        
        return NSKeyedUnarchiver.unarchiveObjectWithFile(finalPath)
    }
    
    /**
     Get the Bundle path for a filename
    
     - parameter file: Filename
    
     - returns: Returns the path as a String
     */
    public static func getBundlePathForFile(file: String) -> String {
        let fileExtension = file.pathExtension
        return NSBundle.mainBundle().pathForResource(file.stringByReplacingOccurrencesOfString(String(format: ".%@", file), withString: ""), ofType: fileExtension)!
    }
    
    /**
     Get the Documents directory for a filename
    
     - parameter file: Filename
    
     - returns: Returns the directory as a String
     */
    public static func getDocumentsDirectoryForFile(file: String) -> String {
        let documentsDirectory = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
        return documentsDirectory.stringByAppendingPathComponent(String(format: "%@/", file))
    }
    
    /**
     Get the Library directory for a filename
    
     - parameter file: Filename
    
     - returns: Returns the directory as a String
     */
    public static func getLibraryDirectoryForFile(file: String) -> String {
        let libraryDirectory = NSSearchPathForDirectoriesInDomains(.LibraryDirectory, .UserDomainMask, true)[0]
        return libraryDirectory.stringByAppendingPathComponent(String(format: "%@/", file))
    }
    
    /**
     Get the Cache directory for a filename
    
     - parameter file: Filename
    
     - returns: Returns the directory as a String
     */
    public static func getCacheDirectoryForFile(file: String) -> String {
        let cacheDirectory = NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true)[0]
        return cacheDirectory.stringByAppendingPathComponent(String(format: "%@/", file))
    }
    
    /**
     Returns the size of the file
    
     - parameter file:      Filename
     - parameter directory: Directory of the file
    
     - returns: Returns the file size
     */
    public static func fileSize(file: String, fromDirectory directory: DirectoryType) throws -> NSNumber? {
        if file.characters.count != 0 {
            var path: String
            
            switch directory {
            case .MainBundle:
                path = self.getBundlePathForFile(file)
            case .Library:
                path = self.getLibraryDirectoryForFile(file)
            case .Documents:
                path = self.getDocumentsDirectoryForFile(file)
            case .Cache:
                path = self.getCacheDirectoryForFile(file)
            }
            
            if NSFileManager.defaultManager().fileExistsAtPath(path) {
                let fileAttributes: NSDictionary? = try NSFileManager.defaultManager().attributesOfItemAtPath(file)
                if let _fileAttributes = fileAttributes {
                    return NSNumber(unsignedLongLong: _fileAttributes.fileSize())
                }
            }
        }
        
        return nil
    }
    
    /**
     Delete a file with the given filename
    
     - parameter file:      Filename to delete
     - parameter directory: Directory of the file
    
     - returns: Returns true if the operation was successful, otherwise false
     */
    public static func deleteFile(file: String, fromDirectory directory: DirectoryType) throws -> Bool {
        if file.characters.count != 0 {
            var path: String
            
            switch directory {
            case .MainBundle:
                path = self.getBundlePathForFile(file)
            case .Library:
                path = self.getLibraryDirectoryForFile(file)
            case .Documents:
                path = self.getDocumentsDirectoryForFile(file)
            case .Cache:
                path = self.getCacheDirectoryForFile(file)
            }
            
            if NSFileManager.defaultManager().fileExistsAtPath(path) {
                do {
                    try NSFileManager.defaultManager().removeItemAtPath(path)
                    return true
                } catch {
                    return false
                }
            }
        }
        
        return false
    }
    
    /**
     Move a file from a directory to another
    
     - parameter file:        Filename to move
     - parameter origin:      Origin directory of the file
     - parameter destination: Destination directory of the file
     - parameter folderName:  Folder name where to move the file. If folder not exist it will be created automatically
    
     - returns: Returns true if the operation was successful, otherwise false
     */
    public static func moveLocalFile(file: String, fromDirectory origin: DirectoryType, toDirectory destination: DirectoryType, withFolderName folderName: String? = nil) throws -> Bool {
        var originPath: String
        
        switch origin {
        case .MainBundle:
            originPath = self.getBundlePathForFile(file)
        case .Library:
            originPath = self.getLibraryDirectoryForFile(file)
        case .Documents:
            originPath = self.getDocumentsDirectoryForFile(file)
        case .Cache:
            originPath = self.getCacheDirectoryForFile(file)
        }
        
        var destinationPath: String = ""
        if folderName != nil {
            destinationPath = String(format: "%@/%@", destinationPath, folderName!)
        } else {
            destinationPath = file
        }
        
        switch destination {
        case .MainBundle:
            destinationPath = self.getBundlePathForFile(destinationPath)
        case .Library:
            destinationPath = self.getLibraryDirectoryForFile(destinationPath)
        case .Documents:
            destinationPath = self.getDocumentsDirectoryForFile(destinationPath)
        case .Cache:
            destinationPath = self.getCacheDirectoryForFile(destinationPath)
        }
        
        if folderName != nil {
            let folderPath: String = String(format: "%@/%@", destinationPath, folderName!)
            if !NSFileManager.defaultManager().fileExistsAtPath(originPath) {
                try NSFileManager.defaultManager().createDirectoryAtPath(folderPath, withIntermediateDirectories: false, attributes: nil)
            }
        }
        
        var copied: Bool = false, deleted: Bool = false
        if NSFileManager.defaultManager().fileExistsAtPath(originPath) {
            do {
                try NSFileManager.defaultManager().copyItemAtPath(originPath, toPath: destinationPath)
                copied = true
            } catch {
                copied = false
            }
        }
        
        if destination != .MainBundle {
            if NSFileManager.defaultManager().fileExistsAtPath(originPath) {
                do {
                    try NSFileManager.defaultManager().removeItemAtPath(originPath)
                    deleted = true
                } catch {
                    deleted = false
                }
            }
        }
        
        if copied && deleted {
            return true
        }
        return false
    }
    
    
    /**
     Move a file from a directory to another
    
     - parameter file:        Filename to move
     - parameter origin:      Origin directory of the file
     - parameter destination: Destination directory of the file
    
     - returns: Returns true if the operation was successful, otherwise false
     */
    @available(*, obsoleted=1.2.0, message="Use moveLocalFile(_, fromDirectory:, toDirectory:, withFolderName:)")
    public static func moveLocalFile(file: String, fromDirectory origin: DirectoryType, toDirectory destination: DirectoryType) throws -> Bool {
        return try self.moveLocalFile(file, fromDirectory: origin, toDirectory: destination, withFolderName: nil)
    }
    
    /**
     Duplicate a file into another directory
    
     - parameter origin:      Origin path
     - parameter destination: Destination path
    
     - returns: Returns true if the operation was successful, otherwise false
     */
    public static func duplicateFileAtPath(origin: String, toNewPath destination: String) -> Bool {
        if NSFileManager.defaultManager().fileExistsAtPath(origin) {
            do {
                try NSFileManager.defaultManager().copyItemAtPath(origin, toPath: destination)
                return true
            } catch {
                return false
            }
        }
        return false
    }
    
    /**
     Rename a file with another filename
    
     - parameter origin:  Origin path
     - parameter path:    Subdirectory path
     - parameter oldName: Old filename
     - parameter newName: New filename
    
     - returns: Returns true if the operation was successful, otherwise false
     */
    public static func renameFileFromDirectory(origin: DirectoryType, atPath path: String, withOldName oldName: String, andNewName newName: String) -> Bool {
        var originPath: String
        
        switch origin {
        case .MainBundle:
            originPath = self.getBundlePathForFile(path)
        case .Library:
            originPath = self.getLibraryDirectoryForFile(path)
        case .Documents:
            originPath = self.getDocumentsDirectoryForFile(path)
        case .Cache:
            originPath = self.getCacheDirectoryForFile(path)
        }
        
        if NSFileManager.defaultManager().fileExistsAtPath(originPath) {
            let newNamePath: String = originPath.stringByReplacingOccurrencesOfString(oldName, withString: newName)
            do {
                try NSFileManager.defaultManager().copyItemAtPath(originPath, toPath: newNamePath)
                do {
                    try NSFileManager.defaultManager().removeItemAtPath(originPath)
                    return true
                } catch {
                    return false
                }
            } catch {
                return false
            }
        }
        return false
    }
    
    /**
     Get the given settings for a given key
    
     - parameter settings:     Settings filename
     - parameter objectForKey: Key to set the object
    
     - returns: Returns the object for the given key
     */
    public static func getSettings(settings: String, objectForKey: String) -> AnyObject? {
        var path: String = self.getLibraryDirectoryForFile("")
        path = path.stringByAppendingString("/Preferences/")
        path = path.stringByAppendingString("\(settings)-Settings.plist")
        
        var loadedPlist: NSMutableDictionary
        if NSFileManager.defaultManager().fileExistsAtPath(path) {
            loadedPlist = NSMutableDictionary(contentsOfFile: path)!
        } else {
            return nil
        }
        
        return loadedPlist[objectForKey]
    }
    
    /**
     Set the given settings for a given object and key. The file will be saved in the Library directory
    
     - parameter settings: Settings filename
     - parameter object:   Object to set
     - parameter objKey:   Key to set the object
    
     - returns: Returns true if the operation was successful, otherwise false
     */
    public static func setSettings(settings: String, object: AnyObject, forKey objKey: String) -> Bool {
        var path: String = self.getLibraryDirectoryForFile("")
        path = path.stringByAppendingString("/Preferences/")
        path = path.stringByAppendingString("\(settings)-Settings.plist")
        
        var loadedPlist: NSMutableDictionary
        if NSFileManager.defaultManager().fileExistsAtPath(path) {
            loadedPlist = NSMutableDictionary(contentsOfFile: path)!
        } else {
            loadedPlist = NSMutableDictionary()
        }
        
        loadedPlist[objKey] = object
        
        return loadedPlist.writeToFile(path, atomically: true)
    }
    
    /**
     Set the App settings for a given object and key. The file will be saved in the Library directory
    
     - parameter object: Object to set
     - parameter objKey: Key to set the object
    
     - returns: Returns true if the operation was successful, otherwise false
     */
    public static func setAppSettingsForObject(object: AnyObject, forKey objKey: String) -> Bool {
        return self.setSettings(APP_NAME, object: object, forKey: objKey)
    }
    
    /**
     Get the App settings for a given key
    
     - parameter objKey: Key to get the object
    
     - returns: Returns the object for the given key
     */
    public static func getAppSettingsForObjectWithKey(objKey: String) -> AnyObject? {
        return self.getSettings(APP_NAME, objectForKey: objKey)
    }
}
