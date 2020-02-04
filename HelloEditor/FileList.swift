// FileList.swift

import SwiftUI

struct FileList: View {
	// @ObservedObject var files: FileStore()
	var files: [File] = mapFileList()

	var body: some View {
		NavigationView {
			VStack(spacing: 0) {
				List {
					ForEach(files) { file in
						NavigationLink(destination: Editor(file: file)) {
							Image(systemName: "doc.text")
							VStack(alignment: .leading) {
								Text(file.name)
								Text(file.type).font(.subheadline).foregroundColor(.secondary)
							}
						}
					}.onDelete(perform: deleteFile)
				}
				Rectangle().fill(Color(UIColor.systemGray4))
				.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 1, alignment: .topLeading)
				HStack() {
					Text("Updated today at 21:04").font(.footnote).foregroundColor(secondaryFontColor)
				}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 49, maxHeight: 49, alignment: .center)
				
			}.navigationBarTitle(Text("Files")).navigationBarItems(
				leading: NavigationLink(destination: Settings()) {
					Image(systemName: "gear").imageScale(.large).padding(5)
				},
				trailing: HStack(spacing: 5.0) {
					Button(action: newFolder) {
						Image(systemName: "folder.badge.plus").imageScale(.large).padding(5)
					}
					NavigationLink(destination: Text("add file")) {
						Image(systemName: "square.and.pencil").imageScale(.large).padding(5)
					}
					// EditButton()
				}
			)
		}.accentColor(primaryColor)
	}
}

func newFolder() {
	let t = CustomAlert()
	let url = cloudURL()
	
	t.openAlertView() { folderName in
		let newFolderURL = url.appendingPathComponent(folderName)
		if (FileManager.default.fileExists(atPath: newFolderURL.path, isDirectory: nil)) {
			// let bla = Alert(title: Text("Error"), message: Text("Folder already exists"), dismissButton: .default(Text("Ok")))
			showMessage(title: "Error", message: "Folder already exists")
		} else {
			do {
				try FileManager.default.createDirectory(at: newFolderURL, withIntermediateDirectories: true, attributes: nil)
			} catch {
				// Alert(title: Text("Error"), message: Text("Could not create folder"), dismissButton: .default(Text("Ok")))
				print("Could not create folder \(error)")
				showMessage(title: "Error", message: "Could not create folder")
			}
		}
	}
}

func deleteFile(offsets: IndexSet) {
	print("delete file", offsets)
}

struct FileList_Previews: PreviewProvider {
	static var previews: some View {
		FileList()
	}
}

