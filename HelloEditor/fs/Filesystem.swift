// Filesystem.swift
import Foundation

/*
## notes on iCloud
You have to create an iCloud container and set it to public in the plist. After changes to iCloud you have to increase the bundle version.
Files have to be put into the "Documents" folder to be public visible in the Files app.
File timestamps are always in UTC
*/

let fileManager = FileManager.default

func cloudURL() -> URL {
	let iCloudContainer = FileManager.default.url(forUbiquityContainerIdentifier: nil)!
	return iCloudContainer.appendingPathComponent("Documents")
}

func fileList() -> [URL] {
	
	guard let iCloudContainer = FileManager.default.url(forUbiquityContainerIdentifier: nil) else {
		return []
	}
	do {
		let documentsURL = iCloudContainer.appendingPathComponent("Documents")
		let fileURLs = try fileManager.contentsOfDirectory(at: documentsURL, includingPropertiesForKeys: nil)
		print(documentsURL.path)
		print(fileURLs)
		return fileURLs
	} catch {
		print("Error  \(error)")
		return []
	}
}

func mapFileList() -> [File] {
	let fl = fileList()
	let list = fl.map{ (url) -> File in
		let modDate = modDateForPath(path: url.path)
		return File(name: url.deletingPathExtension().lastPathComponent, type: url.pathExtension, fileName: url.lastPathComponent, modDate: modDate)
	}
	return list
}

func setupFS() -> Bool {
	// NOTE: if this fails we may not have iCloud support, maybe it can fail in multiple ways.
	// NOTE: How do you check if iCloud is logged in and works?
	
	if let iCloudContainer = FileManager.default.url(forUbiquityContainerIdentifier: nil) {
		let documentsURL = iCloudContainer.appendingPathComponent("Documents")
		var isDirectory = ObjCBool(true)
		let exists = FileManager.default.fileExists(atPath: documentsURL.path, isDirectory: &isDirectory)
		if (exists && isDirectory.boolValue) {
			return true
		} else {
			do {
				try FileManager.default.createDirectory(at: documentsURL, withIntermediateDirectories: true, attributes: nil)
				return true;
			} catch {
				/*
				## How could this happen?
				* no more space on device
				*/
				print("Failed creation of the public iCloud folder \(error)")
				return false
			}
		}
	}
	return false
}

func createTestFile() {
	do {
		let iCloudDocumentsURL = FileManager.default.url(forUbiquityContainerIdentifier: nil)!.appendingPathComponent("Documents")
		let url = iCloudDocumentsURL.appendingPathComponent("file.txt")
		print("file url", url)
		try "Some string".write(to: url, atomically: true, encoding: .utf8)
		
	} catch {
		print("Error in creating test file \(error)")
	}
}

func modDateForPath(path: String) -> Date {
	let zero = Date(timeIntervalSince1970: 0)
	do {
		let data = try fileManager.attributesOfItem(atPath: path)
		guard let d = data[.modificationDate] else {
			return zero
		}
		return d as! Date
	} catch {
		print("Error  \(error)")
		return zero
	}
}

