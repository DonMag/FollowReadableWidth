//
//  ViewController.swift
//  FollowReadableWidth
//
//  Created by Don Mag on 7/28/21.
//

import UIKit

class DemoTableViewController: UITableViewController {
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "workaround" {
			if let vc = segue.destination as? Example4ViewController {
				vc.forceLayoutUpdate = true
			}
		}
	}
	
	var isFirstTime: Bool = true
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		if isFirstTime {
			isFirstTime = false
			let vc = UIAlertController(title: "Please Note!", message: "\nThis is EXAMPLE code only!\n\nIt should not be considered\n\n\"Production Ready\"", preferredStyle: .alert)
			vc.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
			present(vc, animated: true, completion: nil)
		}
	}

}

class Example1ViewController: UIViewController {
}
class Example2ViewController: UIViewController {
}
class Example3ViewController: UIViewController {
}
class Example4ViewController: UIViewController {
	
	var forceLayoutUpdate: Bool = false
	
	var currentGreenViewWidth: CGFloat = 0
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		if forceLayoutUpdate {
			// find the greenView
			guard let greenView = view.subviews.first,
				  greenView.subviews.count == 1
			else {
				return
			}
			// only do this if the greenView's width has changed
			if currentGreenViewWidth != greenView.frame.size.width {
				currentGreenViewWidth = greenView.frame.size.width
				greenView.setNeedsLayout()
				greenView.layoutIfNeeded()
			}
		}
	}
	
}
class CommentsViewController: UIViewController {
}
