// MarkdownController.swift

import SwiftUI
import UIKit

struct MarkdownController: UIViewControllerRepresentable {
	@Binding var text: String
	
	func makeUIViewController(context: Context) -> MDViewController {
		return MDViewController()
	}
	func updateUIViewController(_ uiViewController: MDViewController, context: Context) {
		if let editor = uiViewController.editor {
			editor.text = self.text
		} else {
			print("Error: editor does not exist")
		}
	}
	
	class MDViewController: UIViewController {
		var editor: Notepad!
		
		override func viewDidLoad() {
			super.viewDidLoad()
			editor = Notepad(frame: self.view.bounds, themeFile: "one-light")
			editor.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
			self.view.addSubview(editor)
		}
		override func viewWillDisappear(_ animated: Bool) {
			print("export string", editor.text!)
		}
		
	}
}
