//
//  Interpreter.swift
//  Morse Trainer
//
//  Created by Ramin Zarfeshan on 5/2/18.
//  Copyright © 2018 Ramin Zarfeshan. All rights reserved.
//

import Foundation

public class Interpreter {
	
	public var queue: Queue
	public var alphabetTree: TreeNode<String>?
	
	
	init() {
		queue = Queue(size: 10)
		alphabetTree = initializeAlphabet()
	}
	
	public func addDot() {
		queue.enqueue(element: 0)
	}
	
	public func addDash() {
		queue.enqueue(element: 1)
	}
	
	public func clear() {
		queue = Queue(size: 10)
	}
	
	
	public func findNode() -> TreeNode<String> {
		
		var node: TreeNode<String> = alphabetTree!
		let queueCopy: Array<Int> = queue.toArray()
		
		for i in 0..<queue.size() {
			
			let nextVal = queueCopy[i]
			
			if nextVal == 0 {
				if let newNode = node.leftNode {
					node = newNode
				} else {
					return TreeNode<String>(data: "")
				}
				
			} else if nextVal == 1 {
				if let newNode = node.rightNode {
					node = newNode
				} else {
					return TreeNode<String>(data: "")

				}
			}
		}
		
		print(node.description()!)
		
		if node.description() != nil {
			return node
		} else {
			return TreeNode<String>(data: "")
		}
	}
	
	
	
	
	
	
	
	
	
	public func initializeAlphabet() -> TreeNode<String> {
		//this is gonna get messy
		
		
		// 6th row (bottom row)
		let one: TreeNode<String> = TreeNode<String>(data: "1")
		let two: TreeNode<String> = TreeNode<String>(data: "2")
		let three: TreeNode<String> = TreeNode<String>(data: "3")
		let four: TreeNode<String> = TreeNode<String>(data: "4")
		let five: TreeNode<String> = TreeNode<String>(data: "5")
		let six: TreeNode<String> = TreeNode<String>(data: "6")
		let seven: TreeNode<String> = TreeNode<String>(data: "7")
		let eight: TreeNode<String> = TreeNode<String>(data: "8")
		let nine: TreeNode<String> = TreeNode<String>(data: "9")
		let zero: TreeNode<String> = TreeNode<String>(data: "0")
		let plus: TreeNode<String> = TreeNode<String>(data: "+")
		
		
		// 5th row (to include above row, add above elements as children of elements in this row)
		let h: TreeNode<String> = TreeNode<String>(left: five, right: four, data: "h")
		let v: TreeNode<String> = TreeNode<String>(left: nil, right: three, data: "v")
		
		let f: TreeNode<String> = TreeNode<String>(data: "f")
		let f2: TreeNode<String> = TreeNode<String>(left: nil, right: two, data: nil)
		
		let l: TreeNode<String> = TreeNode<String>(data: "l")
		let l2: TreeNode<String> = TreeNode<String>(left: plus, right: nil, data: nil)
		
		let p: TreeNode<String> = TreeNode<String>(data: "p")
		let j: TreeNode<String> = TreeNode<String>(left: nil, right: one, data: "j")
		
		let b: TreeNode<String> = TreeNode<String>(left: six, right: nil, data: "b")
		let x: TreeNode<String> = TreeNode<String>(data: "x")
		
		let c: TreeNode<String> = TreeNode<String>(data: "c")
		let y: TreeNode<String> = TreeNode<String>(data: "y")
		
		let z: TreeNode<String> = TreeNode<String>(left: seven, right: nil, data: "z")
		let q: TreeNode<String> = TreeNode<String>(data: "q")
		
		let o1: TreeNode<String> = TreeNode<String>(left: eight, right: nil, data: nil)
		let o2: TreeNode<String> = TreeNode<String>(left: nine, right: zero, data: nil)

		
		// 4th row
		let s: TreeNode<String> = TreeNode<String>(left: h, right: v, data: "s")
		let u: TreeNode<String> = TreeNode<String>(left: f, right: f2, data: "u")
		
		let r: TreeNode<String> = TreeNode<String>(left: l, right: l2, data: "r")
		let w: TreeNode<String> = TreeNode<String>(left: p, right: j, data: "w")

		let d: TreeNode<String> = TreeNode<String>(left: b, right: x, data: "d")
		let k: TreeNode<String> = TreeNode<String>(left: c, right: y, data: "k")

		let g: TreeNode<String> = TreeNode<String>(left: z, right: q, data: "g")
		let o: TreeNode<String> = TreeNode<String>(left: o1, right: o2, data: "o")
		
		
		// 3rd row
		let i: TreeNode<String> = TreeNode<String>(left: s, right: u, data: "i")
		let a: TreeNode<String> = TreeNode<String>(left: r, right: w, data: "a")
		
		let n: TreeNode<String> = TreeNode<String>(left: d, right: k, data: "n")
		let m: TreeNode<String> = TreeNode<String>(left: g, right: o, data: "m")

		
		// 2nd row
		let e: TreeNode<String> = TreeNode<String>(left: i, right: a, data: "e")
		let t: TreeNode<String> = TreeNode<String>(left: n, right: m, data: "t")

		let root: TreeNode<String> = TreeNode<String>(left: e, right: t, data: "")
		
		return root
	}
}
