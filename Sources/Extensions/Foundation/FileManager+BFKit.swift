//
//  FileManager+BFKit.swift
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
public extension FileManager {
    // MARK: - Enums -
    
    /**
     Directory type enum
    
     - MainBundle: Main bundle directory
     - Library:    Library directory
     - Documents:  Documents directory
     - Cache:      Cache directory
     */
    public enum DirectoryType : Int {
        case mainBundle
        case library
        case documents
        case cache
    }
    
    // MARK: - Class functions -
    
    /**
     Read a file an returns the content as String
    
     - parameter file:   File name
     - parameter ofType: File type
    
     - returns: Returns the content of the file a String
     */
    public static func readTextFile(_ file: String, ofType: String) throws -> String? {
        return try String(contentsOfFile: Bundle.main.path(forResource: file, ofType: ofType)!, encoding: String.Encoding.utf8)
    }
    
    /**
     Save a given array into a PLIST with the given filename
    
     - parameter directory: Path of the PLIST
     - parameter filename:  PLIST filename
     - parameter array:     Array to save into PLIST
    
     - returns: Returns true if the operation was successful, otherwise false
     */
    public static func saveArrayToPath(_ directory: DirectoryType, filename: String, array: Array<AnyObject>) -> Bool {
        var finalPath: String
        
        switch directory {
        case .mainBundle:
            finalPath = self.getBundlePathForFile("\(filename).plist")
        case .library:
            finalPath = self.getLibraryDirectoryForFile("\(filename).plist")
        case .documents:
            finalPath = self.getDocumentsDirectoryForFile("\(filename).plist")
        case .cache:
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
    public static func loadArrayFromPath(_ directory: DirectoryType, filename: String) -> Any? {
        var finalPath: String
        
        switch directory {
        case .mainBundle:
            finalPath = self.getBundlePathForFile(filename)
        case .library:
            finalPath = self.getLibraryDirectoryForFile(filename)
        case .documents:
            finalPath = self.getDocumentsDirectoryForFile(filename)
        case .cache:
            finalPath = self.getCacheDirectoryForFile(filename)
        }
        
        return NSKeyedUnarchiver.unarchiveObject(withFile: finalPath)
    }
    
    /**
     Get the Bundle path for a filename
    
     - parameter file: Filename
    
     - returns: Returns the path as a String
     */
    public static func getBundlePathForFile(_ file: String) -> String {
        let fileExtension = file.pathExtension
        return Bundle.main.path(forResource: file.replacingOccurrences(of: String(format: ".%@", file), with: ""), ofType: fileExtension)!
    }
    
    /**
     Get the Documents directory for a filename
    
     - parameter file: Filename
    
     - returns: Returns the directory as a String
     */
    public static func getDocumentsDirectoryForFile(_ file: String) -> String {
        let documentsDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        return documentsDirectory.stringByAppendingPathComponent(String(format: "%@/", file))
    }
    
    /**
     Get the Library directory for a filename
    
     - parameter file: Filename
    
     - returns: Returns the directory as a String
     */
    public static func getLibraryDirectoryForFile(_ file: String) -> String {
        let libraryDirectory = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]
        return libraryDirectory.stringByAppendingPathComponent(String(format: "%@/", file))
    }
    
    /**
     Get the Cache directory for a filename
    
     - parameter file: Filename
    
     - returns: Returns the directory as a String
     */
    public static func getCacheDirectoryForFile(_ file: String) -> String {
        let cacheDirectory = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0]
        return cacheDirectory.stringByAppendingPathComponent(String(format: "%@/", file))
    }
    
    /**
     Returns the size of the file
    
     - parameter file:      Filename
     - parameter directory: Directory of the file
    
     - returns: Returns the file size
     */
    public static func fileSize(_ file: String, fromDirectory directory: DirectoryType) throws -> NSNumber? {
        if file.characters.count != 0 {
            var path: String
            
            switch directory {
            case .mainBundle:
                path = self.getBundlePathForFile(file)
            case .library:
                path = self.getLibraryDirectoryForFile(file)
            case .documents:
                path = self.getDocumentsDirectoryForFile(file)
            case .cache:
                path = self.getCacheDirectoryForFile(file)
            }
            
            if FileManager.default.fileExists(atPath: path) {
                let fileAttributes = try FileManager.default.attributesOfItem(atPath: file)
                return fileAttributes[FileAttributeKey.size] as? NSNumber
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
    public static func deleteFile(_ file: String, fromDirectory directory: DirectoryType) throws -> Bool {
        if file.characters.count != 0 {
            var path: String
            
            switch directory {
            case .mainBundle:
                path = self.getBundlePathForFile(file)
            case .library:
                path = self.getLibraryDirectoryForFile(file)
            case .documents:
                path = self.getDocumentsDirectoryForFile(file)
            case .cache:
                path = self.getCacheDirectoryForFile(file)
            }
            
            if FileManager.default.fileExists(atPath: path) {
                do {
                    try FileManager.default.removeItem(atPath: path)
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
    public static func moveLocalFile(_ file: String, fromDirectory origin: DirectoryType, toDirectory destination: DirectoryType, withFolderName folderName: String? = nil) throws -> Bool {
        var originPath: String
        
        switch origin {
        case .mainBundle:
            originPath = self.getBundlePathForFile(file)
        case .library:
            originPath = self.getLibraryDirectoryForFile(file)
        case .documents:
            originPath = self.getDocumentsDirectoryForFile(file)
        case .cache:
            originPath = self.getCacheDirectoryForFile(file)
        }
        
        var destinationPath: String = ""
        if folderName != nil {
            destinationPath = String(format: "%@/%@", destinationPath, folderName!)
        } else {
            destinationPath = file
        }
        
        switch destination {
        case .mainBundle:
            destinationPath = self.getBundlePathForFile(destinationPath)
        case .library:
            destinationPath = self.getLibraryDirectoryForFile(destinationPath)
        case .documents:
            destinationPath = self.getDocumentsDirectoryForFile(destinationPath)
        case .cache:
            destinationPath = self.getCacheDirectoryForFile(destinationPath)
        }
        
        if folderName != nil {
            let folderPath: String = String(format: "%@/%@", destinationPath, folderName!)
            if !FileManager.default.fileExists(atPath: originPath) {
                try FileManager.default.createDirectory(atPath: folderPath, withIntermediateDirectories: false, attributes: nil)
            }
        }
        
        var copied: Bool = false, deleted: Bool = false
        if FileManager.default.fileExists(atPath: originPath) {
            do {
                try FileManager.default.copyItem(atPath: originPath, toPath: destinationPath)
                copied = true
            } catch {
                copied = false
            }
        }
        
        if destination != .mainBundle {
            if FileManager.default.fileExists(atPath: originPath) {
                do {
                    try FileManager.default.removeItem(atPath: originPath)
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
     Duplicate a file into another directory
    
     - parameter origin:      Origin path
     - parameter destination: Destination path
    
     - returns: Returns true if the operation was successful, otherwise false
     */
    public static func duplicateFileAtPath(_ origin: String, toNewPath destination: String) -> Bool {
        if FileManager.default.fileExists(atPath: origin) {
            do {
                try FileManager.default.copyItem(atPath: origin, toPath: destination)
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
    public static func renameFileFromDirectory(_ origin: DirectoryType, atPath path: String, withOldName oldName: String, andNewName newName: String) -> Bool {
        var originPath: String
        
        switch origin {
        case .mainBundle:
            originPath = self.getBundlePathForFile(path)
        case .library:
            originPath = self.getLibraryDirectoryForFile(path)
        case .documents:
            originPath = self.getDocumentsDirectoryForFile(path)
        case .cache:
            originPath = self.getCacheDirectoryForFile(path)
        }
        
        if FileManager.default.fileExists(atPath: originPath) {
            let newNamePath: String = originPath.replacingOccurrences(of: oldName, with: newName)
            do {
                try FileManager.default.copyItem(atPath: originPath, toPath: newNamePath)
                do {
                    try FileManager.default.removeItem(atPath: originPath)
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
    public static func getSettings(_ settings: String, objectForKey: String) -> Any? {
        var path: String = self.getLibraryDirectoryForFile("")
        path = path + "/Preferences/"
        path = path + "\(settings)-Settings.plist"
        
        var loadedPlist: NSMutableDictionary
        if FileManager.default.fileExists(atPath: path) {
            loadedPlist = NSMutableDictionary(contentsOfFile: path)!
        } else {
            return nil
        }
        
        return loadedPlist.object(forKey: objectForKey)
    }
    
    /**
     Set the given settings for a given object and key. The file will be saved in the Library directory
    
     - parameter settings: Settings filename
     - parameter object:   Object to set
     - parameter objKey:   Key to set the object
    
     - returns: Returns true if the operation was successful, otherwise false
     */
    public static func setSettings(_ settings: String, object: AnyObject, forKey objKey: String) -> Bool {
        var path: String = self.getLibraryDirectoryForFile("")
        path = path + "/Preferences/"
        path = path + "\(settings)-Settings.plist"
        
        var loadedPlist: NSMutableDictionary
        if FileManager.default.fileExists(atPath: path) {
            loadedPlist = NSMutableDictionary(contentsOfFile: path)!
        } else {
            loadedPlist = NSMutableDictionary()
        }
        
        loadedPlist[objKey] = object
        
        return loadedPlist.write(toFile: path, atomically: true)
    }
}
