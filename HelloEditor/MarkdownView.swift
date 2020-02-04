// MarkdownView.swift

import SwiftUI

struct MarkdownView: View {
	@State private var text = "Example Text\n hello world \n#title\n**bold**"
	var body: some View {
		VStack() {
			MarkdownController(text: $text)
			Button(action: {self.text = "bla"}) {
				Image(systemName: "folder.badge.plus").imageScale(.large).padding(5)
			}
		}
	}
}

struct MarkdownView_Previews: PreviewProvider {
	static var previews: some View {
		MarkdownView()
	}
}
