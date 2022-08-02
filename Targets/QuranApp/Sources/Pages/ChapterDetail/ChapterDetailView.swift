import SwiftUI

struct ChapterDetailView: View {
    @ObservedObject var viewModel: ChapterDetailViewModel
    @State private var presentedVerses: [Verse] = []
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                ForEach(viewModel.verses) { verse in
                    text(for: verse)
                }
//                NavigationStack(path: $presentedVerses) {
//                    List(viewModel.verses) { verse in
//                        NavigationLink(verse.verseKey, value: verse)
//                    }
//                    .navigationDestination(for: Verse.self) { verse in
//                        VerseDetailView(viewModel: .init(verse: verse))
//                    }
//                }
            }
            .padding()
        }
        .navigationTitle(viewModel.chapter.translatedName.name)
    }

    func text(for verse: Verse) -> some View {
        HStack(alignment: .top) {
            Text(verse.verseKey)
                .fontWeight(.bold)
            Text(verse.words?.compactMap { $0.translation.text }.joined(separator: " ") ?? "")
            Spacer()
        }
    }
}

struct ChapterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ChapterDetailView(
            viewModel: .init(
                chapter: .init(
                    id: nil,
                    nameComplex: nil,
                    nameArabic: nil,
                    versesCount: nil,
                    translatedName: Chapter.TranslatedName(languageName: "", name: "name")
                )
            )
        )
    }
}
