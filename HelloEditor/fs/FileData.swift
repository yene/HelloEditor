// FileData.swift

import Foundation

struct File: Identifiable {
	var id = UUID()
	var name: String
	var type: String
	var fileName: String
	var modDate: Date = Date()
}

#if DEBUG
let testData = [
	File(name: "inbox", type: "md", fileName: "inbox.md"),
	File(name: "shop", type: "txt", fileName: "inbox.md"),
	File(name: "to learn", type: "md", fileName: "inbox.md"),
	File(name: "inbox", type: "md", fileName: "inbox.md"),
	File(name: "shop", type: "txt", fileName: "inbox.md"),
	File(name: "to learn", type: "md", fileName: "inbox.md"),
	File(name: "inbox", type: "md", fileName: "inbox.md"),
	File(name: "shop", type: "txt", fileName: "inbox.md"),
	File(name: "to learn", type: "md", fileName: "inbox.md"),
	File(name: "inbox", type: "md", fileName: "inbox.md"),
	File(name: "shop", type: "txt", fileName: "inbox.md"),
	File(name: "to learn", type: "md", fileName: "inbox.md"),
	File(name: "inbox", type: "md", fileName: "inbox.md"),
	File(name: "shop", type: "txt", fileName: "inbox.md"),
	File(name: "to learn", type: "md", fileName: "inbox.md"),
]
#endif


