// CustomAlert.swift

import UIKit

class CustomAlert {
	var textField: UITextField?
	
	func configurationTextField(textField: UITextField!) {
		if (textField) != nil {
			self.textField = textField! // Save reference to the UITextField
			//self.textField?.placeholder = "Folder name";
			self.textField?.returnKeyType = UIReturnKeyType.done
		}
	}
	
	func openAlertView(completionHandler: @escaping (String) -> Void) {
		let alert = UIAlertController(title: "Enter the folder name", message: "", preferredStyle: .alert)
		alert.addTextField(configurationHandler: configurationTextField)
		// preferredAction
		alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:nil))
		let action = UIAlertAction(title: "Create", style: .default, handler:{ (UIAlertAction) in
			completionHandler(self.textField!.text!)
		})
		alert.addAction(action)
		alert.preferredAction = action
		
		// We are not supporting multiple windows so we can ignore the deprecation.
		// let viewController =  UIApplication.shared.keyWindow?.rootViewController
		// maybe i need this later https://stackoverflow.com/a/50656239 https://stackoverflow.com/a/57899013
		let currentWindow = UIApplication.shared.windows.first { $0.isKeyWindow }
		let rootViewController = currentWindow?.rootViewController
		rootViewController!.present(alert, animated: true, completion: nil)
	}
}

func showMessage(title: String, message: String) {
	let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
	alert.addAction(UIAlertAction(title: "Ok", style: .default, handler:nil))
	let currentWindow = UIApplication.shared.windows.first { $0.isKeyWindow }
	let rootViewController = currentWindow?.rootViewController
	rootViewController!.present(alert, animated: true, completion: nil)
}
