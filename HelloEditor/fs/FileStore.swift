// FileStore.swift

import SwiftUI
import Combine

class FileStore: ObservableObject {
	var willChange = PassthroughSubject<Void, Never>()
	
	@Published var files: [File]
	
	init(files: [File] = []) {
		self.files = files
	}
	
}
