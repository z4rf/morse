//
//  ViewController.swift
//  Morse Trainer
//
//  Created by Ramin Zarfeshan on 5/2/18.
//  Copyright © 2018 Ramin Zarfeshan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var text: UILabel!
	@IBOutlet weak var queue: UILabel!
	@IBOutlet weak var keySwitch: UISwitch!
	@IBOutlet weak var imageKey: UIImageView!
	@IBOutlet weak var saveButton: UIButton!
	@IBOutlet weak var word: UILabel!
	
	
	private var interpreter: Interpreter!
	private var numEls: Int = 0
	private var calcPressed: Bool = false
	private let maxPresses: Int = 5
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		interpreter = Interpreter()
		text.text = ""
		queue.text = ""
		word.text = ""
		keySwitch.isOn = false
		imageKey.isHidden = true
		saveButton.isHidden = false;
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	
	@IBAction func dotPressed(_ sender: UIButton) {
		
		if numEls < maxPresses && !calcPressed {
			interpreter.addDot()
			queue.text = interpreter.queue.toString()
			numEls += 1
			calculatePressed()
			calcPressed = false
		}
	}
	
	@IBAction func dashPressed(_ sender: UIButton) {
		
		if numEls < maxPresses && !calcPressed {
			interpreter.addDash()
			queue.text = interpreter.queue.toString()
			numEls += 1
			calcPressed = false
		}
		calculatePressed()
		calcPressed = false
	}
	
	func clearLetterPressed() {
		interpreter.clear()
		queue.text = interpreter.queue.toString()
		text.text = ""
		numEls = 0
		calcPressed = false
	}
	
	@IBAction func clearWordPressed(_ sender: UIButton) {
		word.text = ""
	}
	
	
	
	func calculatePressed() {
		
		if !calcPressed {
			text.text = interpreter.findNode().getData()
			calcPressed = true
		} else {
			// self.clearPressed(UIButton())

		}
	}
	@IBAction func keyFlipped(_ sender: Any) {
		if keySwitch.isOn {
			imageKey.isHidden = false
		} else {
			imageKey.isHidden = true
		}
	}
	
	
	@IBAction func savePressed(_ sender: Any) {
		word.text! += text.text!
		clearLetterPressed()
	}
	
}

