//
//  TreeNode.swift
//  Morse Trainer
//
//  Created by Ramin Zarfeshan on 5/2/18.
//  Copyright © 2018 Ramin Zarfeshan. All rights reserved.
//

import Foundation

public class TreeNode<T> {
	
	
	private var left: TreeNode<T>?
	private var right: TreeNode<T>?
	private var data: T?
	
	init(left: TreeNode?, right: TreeNode?, data: T?) {
		self.left = left
		self.right = right
		self.data = data
	}
	
	
	convenience init(data: T) {
		self.init(left: nil, right: nil, data: data)
	}
	
	
	convenience init() {
		self.init(left: nil, right: nil, data: nil)
	}
	
	
	public func getData() -> T {
		return data!
	}
	
	
	public func setData(data: T) {
		self.data = data
	}
	
	
	public var leftNode: TreeNode<T>? {
		get {
			return left
		}
		
		set {
			left = newValue
		}
	}
	
	
	public var rightNode: TreeNode<T>? {
		get {
			return right
		}
		
		set {
			right = newValue
		}
	}
	
	public func description() -> T? {
		return self.data						// wait, shouldn't this just return a string?
	}
	
}
