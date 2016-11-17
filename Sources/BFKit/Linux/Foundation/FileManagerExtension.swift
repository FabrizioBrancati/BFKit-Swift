//
//  FileManagerExtension.swift
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

// MARK: - FileManager extension

/// This extension adds some useful functions to FileManager.
public extension FileManager {
    // MARK: - Variables
    
    /// Path type enum.
    ///
    /// - mainBundle: Main bundle path.
    /// - library: Library path.
    /// - documents: Documents path.
    /// - cache: Cache path.
    public enum PathType: Int {
        case mainBundle
        case library
        case documents
        case cache
    }
    
    // MARK: - Functions
    
    /// Get the path for a PathType.
    ///
    /// - Parameter path: Path type.
    /// - Returns: Returns the path type String.
    public func pathFor(_ path: PathType) -> String? {
        var pathString: String?
        
        switch path {
        case .mainBundle:
            pathString = self.mainBundlePath(file: "")
        case .library:
            pathString = self.libraryPath(file: "")
        case .documents:
            pathString = self.documentsPath(file: "")
        case .cache:
            pathString = self.cachePath(file: "")
        }
        
        return pathString
    }
    
    /// Read a file an returns the content as String.
    ///
    /// - Parameters:
    ///   - file: File path and name.
    ///   - ofType: File type.
    /// - Returns: Returns the content of the file a String.
    /// - Throws: Throws String(contentsOfFile:, encoding) errors.
    public func read(file: String, ofType: String) throws -> String? {
        return try String(contentsOfFile: Bundle.main.path(forResource: file, ofType: ofType)!, encoding: String.Encoding.utf8)
    }
    
    /// Save an object into a PLIST with given filename.
    ///
    /// - Parameters:
    ///   - object: Object to save into PLIST.
    ///   - path: Path of PLIST.
    ///   - filename: PLIST filename.
    /// - Returns: Returns true if the operation was successful, otherwise false.
    public func save(object: Any, in path: PathType, filename: String) -> Bool {
        guard let path = FileManager.default.pathFor(path) else {
            return false
        }
        
        return NSKeyedArchiver.archiveRootObject(object, toFile: path)
    }
    
    /// Load an object from a PLIST with given filename.
    ///
    /// - Parameters:
    ///   - path: Path of PLIST.
    ///   - filename: PLIST filename.
    /// - Returns: Returns the loaded object.
    public func load(from path: PathType, filename: String) -> Any? {
        guard let path = FileManager.default.pathFor(path) else {
            return nil
        }
        
        return NSKeyedUnarchiver.unarchiveObject(withFile: path)
    }
    
    /// Get Main Bundle path for a filename.
    ///
    /// - Parameter file: Filename
    /// - Returns: Returns the path as a String.
    public func mainBundlePath(file: String) -> String? {
        let fileExtension = file.pathExtension
        return Bundle.main.path(forResource: file.replacingOccurrences(of: String(format: ".%@", file), with: ""), ofType: fileExtension)
    }
    
    /// Get Documents path for a filename.
    ///
    /// - Parameter file: Filename
    /// - Returns: Returns the path as a String.
    public func documentsPath(file: String) -> String? {
        guard let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        return documentsURL.path.stringByAppendingPathComponent(String(format: "%@/", file))
    }
    
    /// Get Library path for a filename.
    ///
    /// - Parameter file: Filename
    /// - Returns: Returns the path as a String.
    public func libraryPath(file: String) -> String? {
        guard let libraryURL = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first else {
            return nil
        }
        return libraryURL.path.stringByAppendingPathComponent(String(format: "%@/", file))
    }
    
    /// Get Cache path for a filename.
    ///
    /// - Parameter file: Filename
    /// - Returns: Returns the path as a String.
    public func cachePath(file: String) -> String? {
        guard let cacheURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {
            return nil
        }
        return cacheURL.path.stringByAppendingPathComponent(String(format: "%@/", file))
    }
    
    /// Returns the file size.
    ///
    /// - Parameters:
    ///   - file: Filename.
    ///   - path: Path of the file.
    /// - Returns: Returns the file size.
    /// - Throws: Throws FileManager.default.attributesOfItem(atPath: ) errors.
    public func size(file: String, from path: PathType) throws -> Float? {
        if !file.characters.isEmpty {
            guard let path = FileManager.default.pathFor(path) else {
                return nil
            }
            
            if FileManager.default.fileExists(atPath: path) {
                let fileAttributes = try FileManager.default.attributesOfItem(atPath: file)
                return fileAttributes[FileAttributeKey.size] as? Float
            }
        }
        
        return nil
    }
    
    /// Delete a file with the given filename.
    ///
    /// - Parameters:
    ///   - file: Filename to delete.
    ///   - path: Path of the file.
    /// - Returns: Returns true if the operation was successful, otherwise false.
    /// - Throws: Throws FileManager.default.removeItem(atPath: ) errors.
    public func delete(file: String, from path: PathType) throws -> Bool {
        if !file.characters.isEmpty {
            guard let path = FileManager.default.pathFor(path) else {
                return false
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
    
    /// Move a file from a path to another.
    ///
    /// - Parameters:
    ///   - file: Filename to move.
    ///   - origin: Origin path of the file.
    ///   - destination:  Destination path of the file.
    /// - Returns: Returns true if the operation was successful, otherwise false.
    /// - Throws: Throws FileManager.default.copyItem(atPath: , toPath: ) and FileManager.default.removeItem(atPath: ) errors.
    public func move(file: String, from origin: PathType, to destination: PathType) throws -> Bool {
        guard var originPath = FileManager.default.pathFor(origin) else {
            return false
        }
        
        guard var destinationPath = FileManager.default.pathFor(origin) else {
            return false
        }
        
        originPath += file
        destinationPath += file
        
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
        
        return copied && deleted
    }
    
    /// Duplicate a file into another path.
    ///
    /// - Parameters:
    ///   - file: Filename to duplicate.
    ///   - origin: Origin path
    ///   - destination: Destination path
    /// - Returns: Returns true if the operation was successful, otherwise false.
    public func duplicate(file: String, from origin: PathType, to destination: PathType) -> Bool {
        guard var originPath = FileManager.default.pathFor(origin) else {
            return false
        }
        
        guard var destinationPath = FileManager.default.pathFor(origin) else {
            return false
        }
        
        originPath += file
        destinationPath += file
        
        if FileManager.default.fileExists(atPath: originPath) {
            do {
                try FileManager.default.copyItem(atPath: originPath, toPath: destinationPath)
                return true
            } catch {
                return false
            }
        }
        return false
    }
    
    /// Rename a file with another filename.
    ///
    /// - Parameters:
    ///   - file: Filename to rename.
    ///   - origin: Origin path.
    ///   - oldName: Old filename.
    ///   - newName: New filename.
    /// - Returns: Returns true if the operation was successful, otherwise false.
    public func rename(file: String, in origin: PathType, from oldName: String, to newName: String) -> Bool {
        guard var originPath = FileManager.default.pathFor(origin) else {
            return false
        }
        
        originPath += file
        
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
    
    /// Set settings for object and key. The file will be saved in the Library path if not exist.
    ///
    /// - Parameters:
    ///   - filename: Settings filename. "-Settings" will be automatically added.
    ///   - object: Object to set.
    ///   - objKey: Object key.
    /// - Returns: Returns true if the operation was successful, otherwise false.
    public func setSettings(filename: String, object: AnyObject, forKey objKey: String) -> Bool {
        guard var path: String = self.libraryPath(file: "") else {
            return false
        }
        path = path + "/Preferences/"
        path = path + "\(filename)-Settings.plist"
        
        var loadedPlist: NSMutableDictionary
        if FileManager.default.fileExists(atPath: path) {
            loadedPlist = NSMutableDictionary(contentsOfFile: path)!
        } else {
            loadedPlist = NSMutableDictionary()
        }
        
        loadedPlist[objKey] = object
        
        return loadedPlist.write(toFile: path, atomically: true)
    }
    
    /// Get settings for key.
    ///
    /// - Parameters:
    ///   - filename: Settings filename. "-Settings" will be automatically added.
    ///   - forKey: Object key.
    /// - Returns: Returns the object for the given key.
    public func getSettings(filename: String, forKey: String) -> Any? {
        guard var path: String = self.libraryPath(file: "") else {
            return nil
        }
        path = path + "/Preferences/"
        path = path + "\(filename)-Settings.plist"
        
        var loadedPlist: NSMutableDictionary
        if FileManager.default.fileExists(atPath: path) {
            loadedPlist = NSMutableDictionary(contentsOfFile: path)!
        } else {
            return nil
        }
        
        return loadedPlist.object(forKey: forKey)
    }
}
