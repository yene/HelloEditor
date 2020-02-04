// AppData.swift

import SwiftUI
import Combine

enum sortOrder: String {
	case sortByName
	case sortByDate
}

/*
## ObservableObject
objectWillChange
willSet(newValue)/didSet(oldValue)
*/

final class AppData: ObservableObject  {
	@Published var storagePath: URL?
	@Published var isSyncing: Bool = false
	@Published var lastSycned: Date?
	
	
	@Published var sortBehaviour: sortOrder {
		didSet {
			if (oldValue != sortBehaviour) {
				UserDefaults.standard.set(sortBehaviour.rawValue, forKey: "sortBehaviour")
			}
		}
	}
	
	init() {
		self.sortBehaviour = .sortByName
		if let sbValue = UserDefaults.standard.string(forKey: "sortBehaviour") {
			if let sb = sortOrder(rawValue: sbValue) {
				self.sortBehaviour = sb
			}
		}
	}
}
