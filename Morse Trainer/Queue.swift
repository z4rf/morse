//
//  Queue.swift
//  Morse Trainer
//
//  Created by Ramin Zarfeshan on 5/2/18.
//  Copyright © 2018 Ramin Zarfeshan. All rights reserved.
//

import Foundation

public class Queue {
	
	private var queue: Array<Int>
	private let DEFAULT_CAPACITY: Int
	private var dqIndex: Int
	private var eqIndex: Int
	
	init(size: Int) {
		DEFAULT_CAPACITY = size
		queue = Array(repeating: -1, count: 10)
		dqIndex = 0
		eqIndex = 0
	}
	
	
	func dequeue() -> Int {
		let temp = queue[dqIndex]
		dqIndex += 1
		return temp
	}
	
	
	func enqueue(element: Int) {
		queue[eqIndex] = element
		eqIndex += 1
	}
	
	
	func isEmpty() -> Bool {
		return dqIndex == eqIndex
	}
	
	
	func size() -> Int{
		return eqIndex - dqIndex
	}
	
	
	func toArray() -> Array<Int> {
	
		var theArray: Array<Int> = Array()
		
		for i in dqIndex..<eqIndex {
			theArray.append(queue[i])
		}
		return theArray
	}
	
	
	func toString() -> String{
		
		var desc: String = ""
		
		for number in queue {
			
			if number == 0 {
				desc.append("• ")
			}
			else if number == 1 {
				desc.append("– ")
			}
			else if number < 0 || number > 1 {
				desc.append("")
			}
		}
		return desc
	}
}
