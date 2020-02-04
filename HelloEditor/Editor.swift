// Editor.swift

import SwiftUI

struct Editor: View {
	let file: File
	@State private var text = "Example Text\n hello world \n#title\n**bold**"
	
	var body: some View {
		VStack {
			Image(systemName: "star.fill")
				.imageScale(.medium)
				.foregroundColor(.yellow)
			Image(systemName: "pin")
				.imageScale(.medium)
				.foregroundColor(.primary)
			Image(systemName: "pin.slash")
				.imageScale(.medium)
				.foregroundColor(.red)
			MarkdownView()
			TextView(
				text: $text
			).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
		}
		.navigationBarTitle(Text(file.name), displayMode: .inline)
	}
}

struct Editor_Previews: PreviewProvider {
	static var previews: some View {
		Editor(file: testData[0])
	}
}

