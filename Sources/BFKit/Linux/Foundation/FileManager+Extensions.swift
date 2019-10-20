//
//  FileManager+Extensions.swift
//  BFKit-Swift
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 - 2019 Fabrizio Brancati.
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
    enum PathType: Int {
        /// Main bundle path.
        case mainBundle
        /// Library path.
        case library
        /// Documents path.
        case documents
        /// Cache path.
        case cache
        /// Application Support path.
        case applicationSupport
        /// Temporary path.
        case temporary
    }
    
    // MARK: - Functions
    
    /// Get the path for a PathType.
    ///
    /// - Parameter path: Path type.
    /// - Returns: Returns the path type String.
    func pathFor(_ path: PathType) -> String? {
        var pathString: String?
        
        switch path {
        case .mainBundle:
            pathString = mainBundlePath()

        case .library:
            pathString = libraryPath()

        case .documents:
            pathString = documentsPath()

        case .cache:
            pathString = cachePath()

        case .applicationSupport:
            pathString = applicationSupportPath()

        case .temporary:
            pathString = temporaryPath()
        }
        
        return pathString
    }
    
    /// Save a file with given content.
    ///
    /// - Parameters:
    ///   - file: File to be saved.
    ///   - path: File path.
    ///   - content: Content to be saved.
    /// - Throws: write(toFile:, atomically:, encoding:) errors.
    func save(file: String, in path: PathType, content: String) throws {
        guard let path = FileManager.default.pathFor(path) else {
            return
        }
        
        try content.write(toFile: path.appendingPathComponent(file), atomically: true, encoding: .utf8)
    }
    
    /// Read a file an returns the content as String.
    ///
    /// - Parameters:
    ///   - file: File to be read.
    ///   - path: File path.
    /// - Returns: Returns the content of the file a String.
    /// - Throws: Throws String(contentsOfFile:, encoding:) errors.
    func read(file: String, from path: PathType) throws -> String? {
        guard let path = FileManager.default.pathFor(path) else {
            return nil
        }
        
        return try String(contentsOfFile: path.appendingPathComponent(file), encoding: .utf8)
    }
    
    /// Save an object into a PLIST with given filename.
    ///
    /// - Parameters:
    ///   - object: Object to save into PLIST.
    ///   - path: Path of PLIST.
    ///   - filename: PLIST filename.
    /// - Returns: Returns true if the operation was successful, otherwise false.
    @discardableResult
    func savePlist(object: Any, in path: PathType, filename: String) -> Bool {
        let path = checkPlist(path: path, filename: filename)
        
        guard !path.exist else {
            return NSKeyedArchiver.archiveRootObject(object, toFile: path.path)
        }
        
        return false
    }
    
    /// Load an object from a PLIST with given filename.
    ///
    /// - Parameters:
    ///   - path: Path of PLIST.
    ///   - filename: PLIST filename.
    /// - Returns: Returns the loaded object.
    func readPlist(from path: PathType, filename: String) -> Any? {
        let path = checkPlist(path: path, filename: filename)
        
        guard !path.exist else {
            return NSKeyedUnarchiver.unarchiveObject(withFile: path.path)
        }
        
        return nil
    }
    
    /// Check if plist exist.
    ///
    /// - Parameters:
    ///   - path: Path of plist.
    ///   - filename: Plist filename.
    /// - Returns: Returns if plist exists and path.
    private func checkPlist(path: PathType, filename: String) -> (exist: Bool, path: String) {
        guard let path = FileManager.default.pathFor(path), let finalPath = path.appendingPathComponent(filename).appendingPathExtension("plist") else {
            return (false, "")
        }
        
        return (true, finalPath)
    }
    
    /// Get Main Bundle path for a filename.
    /// If no file is specified, the main bundle path will be returned.
    ///
    /// - Parameter file: Filename.
    /// - Returns: Returns the path as a String.
    func mainBundlePath(file: String = "") -> String? {
        file.isEmpty ? Bundle.main.bundlePath : Bundle.main.path(forResource: file.deletingPathExtension, ofType: file.pathExtension)
    }
    
    /// Get Documents path for a filename.
    ///
    /// - Parameter file: Filename
    /// - Returns: Returns the path as a String.
    func documentsPath(file: String = "") -> String? {
        guard let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        
        return documentsURL.path.appendingPathComponent(file)
    }
    
    /// Get Library path for a filename.
    ///
    /// - Parameter file: Filename
    /// - Returns: Returns the path as a String.
    func libraryPath(file: String = "") -> String? {
        guard let libraryURL = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first else {
            return nil
        }
        
        return libraryURL.path.appendingPathComponent(file)
    }
    
    /// Get Cache path for a filename.
    ///
    /// - Parameter file: Filename
    /// - Returns: Returns the path as a String.
    func cachePath(file: String = "") -> String? {
        guard let cacheURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {
            return nil
        }
        
        return cacheURL.path.appendingPathComponent(file)
    }
    
    /// Get Application Support path for a filename.
    ///
    /// - Parameter file: Filename
    /// - Returns: Returns the path as a String.
    func applicationSupportPath(file: String = "") -> String? {
        guard let applicationSupportURL = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first else {
            return nil
        }
        
        if !FileManager.default.fileExists(atPath: applicationSupportURL.absoluteString, isDirectory: nil) {
            do {
                try FileManager.default.createDirectory(atPath: applicationSupportURL.path, withIntermediateDirectories: true, attributes: nil)
            } catch {
                return nil
            }
        }
        
        return applicationSupportURL.path.appendingPathComponent(file)
    }
    
    /// Get Temporary path for a filename.
    ///
    /// - Parameter file: Filename.
    /// - Returns: Returns the path as a String.
    func temporaryPath(file: String = "") -> String? {
        NSTemporaryDirectory().appendingPathComponent(file)
    }
    
    /// Returns the file size.
    ///
    /// - Parameters:
    ///   - file: Filename.
    ///   - path: Path of the file.
    /// - Returns: Returns the file size.
    /// - Throws: Throws FileManager.default.attributesOfItem(atPath:) errors.
    func size(file: String, from path: PathType) throws -> Float? {
        if !file.isEmpty {
            guard let path = FileManager.default.pathFor(path) else {
                return nil
            }
            
            let finalPath = path.appendingPathComponent(file)
            
            if FileManager.default.fileExists(atPath: finalPath) {
                let fileAttributes = try FileManager.default.attributesOfItem(atPath: finalPath)
                return fileAttributes[FileAttributeKey.size] as? Float
            }
        }
        
        return nil
    }
    
    /// Delete a file with the given filename.
    ///
    /// - Parameters:
    ///   - file: File to delete.
    ///   - path: Path of the file.
    /// - Throws: Throws FileManager.default.removeItem(atPath:) errors.
    func delete(file: String, from path: PathType) throws {
        if !file.isEmpty {
            guard let path = FileManager.default.pathFor(path) else {
                throw BFKitError.pathNotExist
            }
            
            if FileManager.default.fileExists(atPath: path.appendingPathComponent(file)) {
                try FileManager.default.removeItem(atPath: path.appendingPathComponent(file))
            }
        }
    }
    
    /// Move a file from a path to another.
    ///
    /// - Parameters:
    ///   - file: Filename to move.
    ///   - origin: Origin path of the file.
    ///   - destination:  Destination path of the file.
    /// - Returns: Returns true if the operation was successful, otherwise false.
    /// - Throws: Throws FileManager.default.moveItem(atPath:, toPath:) and BFKitError errors.
    func move(file: String, from origin: PathType, to destination: PathType) throws {
        let paths = try check(file: file, origin: origin, destination: destination)
        
        if paths.fileExist {
            try FileManager.default.moveItem(atPath: paths.origin, toPath: paths.destination)
        }
    }
    
    /// Copy a file into another path.
    ///
    /// - Parameters:
    ///   - file: Filename to copy.
    ///   - origin: Origin path
    ///   - destination: Destination path
    /// - Returns: Returns true if the operation was successful, otherwise false.
    /// - Throws: Throws FileManager.default.copyItem(atPath:, toPath:) and BFKitError errors.
    func copy(file: String, from origin: PathType, to destination: PathType) throws {
        let paths = try check(file: file, origin: origin, destination: destination)
        
        if paths.fileExist {
            try FileManager.default.copyItem(atPath: paths.origin, toPath: paths.destination)
        }
    }
    
    /// Check is orign path, destination path and file exists.
    ///
    /// - Parameters:
    ///   - file: File.
    ///   - origin: Origin path.
    ///   - destination: Destination path.
    /// - Returns: Returns a tuple with origin, destination and if file exist.
    /// - Throws: Throws BFKitError errors.
    private func check(file: String, origin: PathType, destination: PathType) throws -> (origin: String, destination: String, fileExist: Bool) { // swiftlint:disable:this large_tuple
        guard let originPath = FileManager.default.pathFor(origin), let destinationPath = FileManager.default.pathFor(destination) else {
            throw BFKitError.pathNotExist
        }
        
        guard destination != .mainBundle else {
            throw BFKitError.pathNotAllowed
        }
        
        let finalOriginPath = originPath.appendingPathComponent(file)
        let finalDestinationPath = destinationPath.appendingPathComponent(file)
        
        guard !FileManager.default.fileExists(atPath: finalOriginPath) else {
            return (finalOriginPath, finalDestinationPath, true)
        }
        
        return (finalOriginPath, finalDestinationPath, false)
    }
    
    /// Rename a file with another filename.
    ///
    /// - Parameters:
    ///   - file: Filename to rename.
    ///   - origin: Origin path.
    ///   - newName: New filename.
    /// - Returns: Returns true if the operation was successful, otherwise false.
    /// - Throws: Throws FileManager.default.copyItem(atPath:, toPath:), FileManager.default.removeItem(atPath:, toPath:) and BFKitError errors.
    func rename(file: String, in origin: PathType, to newName: String) throws {
        guard let originPath = FileManager.default.pathFor(origin) else {
            throw BFKitError.pathNotExist
        }
        
        let finalOriginPath = originPath.appendingPathComponent(file)
        
        if FileManager.default.fileExists(atPath: finalOriginPath) {
            let destinationPath: String = finalOriginPath.replacingOccurrences(of: file, with: newName)
            try FileManager.default.copyItem(atPath: finalOriginPath, toPath: destinationPath)
            try FileManager.default.removeItem(atPath: finalOriginPath)
        }
    }
    
    /// Set settings for object and key. The file will be saved in the Library path if not exist.
    ///
    /// - Parameters:
    ///   - filename: Settings filename. "-Settings" will be automatically added.
    ///   - object: Object to set.
    ///   - objKey: Object key.
    /// - Returns: Returns true if the operation was successful, otherwise false.
    /// - Throws: Throws BFKitError errors.
    @discardableResult
    func setSettings(filename: String, object: Any, forKey objectKey: String) -> Bool {
        guard var path = FileManager.default.pathFor(.applicationSupport) else {
            return false
        }
        
        path = path.appendingPathComponent("\(filename)-Settings.plist")
        
        var settings: [String: Any]
        
        if let plistData = try? Data(contentsOf: URL(fileURLWithPath: path)), let plistFile = try? PropertyListSerialization.propertyList(from: plistData, format: nil), let plistDictionary = plistFile as? [String: Any] {
            settings = plistDictionary
        } else {
            settings = [:]
        }
        
        settings[objectKey] = object
        
        do {
            let plistData = try PropertyListSerialization.data(fromPropertyList: settings, format: .xml, options: 0)
            try plistData.write(to: URL(fileURLWithPath: path))
            
            return true
        } catch {
            return false
        }
    }
    
    /// Get settings for key.
    ///
    /// - Parameters:
    ///   - filename: Settings filename. "-Settings" will be automatically added.
    ///   - forKey: Object key.
    /// - Returns: Returns the object for the given key.
    func getSettings(filename: String, forKey objectKey: String) -> Any? {
        guard var path = FileManager.default.pathFor(.applicationSupport) else {
            return nil
        }
        
        path = path.appendingPathComponent("\(filename)-Settings.plist")
        
        var settings: [String: Any]
        
        if let plistData = try? Data(contentsOf: URL(fileURLWithPath: path)), let plistFile = try? PropertyListSerialization.propertyList(from: plistData, format: nil), let plistDictionary = plistFile as? [String: Any] {
            settings = plistDictionary
        } else {
            settings = [:]
        }
        
        return settings[objectKey]
    }
}
