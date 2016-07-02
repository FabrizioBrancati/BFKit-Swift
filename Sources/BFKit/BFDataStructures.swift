//
//  BFDataStructures.swift
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

// MARK: - List struct -

/// Primitive List implementation
public struct List<Element: Equatable>: CustomStringConvertible {
    // MARK: - Instance variables
    
    /// Count of the elements in list
    public var count: Int {
        return list.count
    }
    
    /// Describe the List
    public var description: String {
        return "\(list)"
    }
    
    /// The array behind the List
    private var list = [Element]()
    
    // MARK: - Instance functions
    
    /**
     Delete an element at the given index
     
     - parameter index: The index to delete
     */
    public mutating func delete(at index: Int) {
        list.remove(at: index)
    }
    
    /**
     Delete an element in the List
     
     - parameter object: The object to be deleted
     
     - returns: Retruns true if removed, otherwise false
     */
    public mutating func delete(_ element: Element) -> Bool {
        guard let search = self.search(element) else {
            return false
        }
        
        list.remove(at: search)
        return true
    }
    
    /**
     Insert an element in the List
     
     - parameter object: The element to insert in the List
     */
    public mutating func insert(_ element: Element) {
        list.append(element)
    }
    
    /**
     Search for an index and returns the element
     
     - parameter index: The index
     
     - returns: Returns the element of the searched index
     */
    public func search(at index: Int) -> Element? {
        return list.safeObjectAtIndex(index)
    }
    
    /**
     Search an element and returns the index
     
     - parameter object: The element to search
     
     - returns: Returns the index of the searched element
     */
    public func search(_ element: Element) -> Int? {
        for i in 0 ..< list.count {
            if list[i] == element {
                return i
            }
        }
        
        return nil
    }
}

// MARK: - Queue struct -

/// Primitive Queue implementation
public struct Queue<Element: Equatable>: CustomStringConvertible {
    // MARK: - Instance variables
    
    /// Count of the elements in list
    public var count: Int {
        return queue.count
    }
    
    /// Describe the Queue
    public var description: String {
        return "\(queue)"
    }
    
    /// The array behind the Queue
    private var queue = [Element]()
    
    // MARK: - Instance functions
    
    /**
     Dequeue the first element
     
     - returns: Retruns true if removed, otherwise false
     */
    public mutating func dequeue() -> Bool {
        if queue.count > 0 {
            queue.remove(at: 0)
            return true
        } else {
            return false
        }
    }
    
    /**
     Remove all the elements in the Queue
     */
    public mutating func emptyQueue() {
        queue.removeAll(keepingCapacity: false)
    }
    
    /**
     Adds an element to the Queue
    
     - parameter object: The element to add
     */
    public mutating func enqueue(_ element: Element) {
        queue.append(element)
    }
    
    /**
     Returns the element on the top of the Queue
    
     - returns: Returns the element on the top of the Queue
     */
    public func top() -> Element? {
        return queue.first
    }
}

// MARK: - Stack struct -

/// Primitive Stack implementation
public struct Stack<Element: Equatable>: CustomStringConvertible {
    // MARK: - Instance variables
    
    /// Count of the elements in list
    public var count: Int {
        return stack.count
    }
    
    /// Describe the Stack
    public var description: String {
        return "\(stack)"
    }
    
    /// The array behind Stack
    private var stack = [Element]()
    
    // MARK: - Instance functions
    
    /**
     Returns if the Stack is empty or not
     
     - returns: Returns true if the Stack is empty, otherwise false
     */
    public func empty() -> Bool {
        return stack.isEmpty
    }
    
    /**
     Removes an element on top of the Stack
     
     - returns: Returns the removed element
     */
    public mutating func pop() -> Element? {
        var element: Element? = nil
        if !self.empty() {
            element = stack[stack.count - 1]
            stack.remove(at: stack.count - 1)
        }
        
        return element
    }
    
    /**
     Adds an element on top of the Stack
     
     - parameter object: The element to add
     */
    public mutating func push(_ element: Element) {
        stack.append(element)
    }
}
