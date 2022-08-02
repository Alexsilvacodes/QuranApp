import SwiftUI

struct VerseDetailView: View {
    @StateObject var viewModel: VerseDetailViewModel
    var text: String {
        viewModel.verse.words?.compactMap { $0.translation.text }.joined(separator: " ") ?? ""
    }
    
    var body: some View {
        VStack {
            Text(text)
        }
        .navigationTitle(viewModel.verse.verseKey)
    }
}

struct VerseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        VerseDetailView(
            viewModel: .init(
                verse: .init(
                    id: 0,
                    verseNumber: 0,
                    verseKey: "VerseKey",
                    versesCount: nil,
                    textUthmani: "Text Uthmani",
                    words: [
                        .init(
                            id: 0,
                            position: 0,
                            text: "Some Text",
                            translation: .init(
                                text: "Some Content Text", languageName: "english"
                            )
                        )
                    ])
            )
        )
    }
}
