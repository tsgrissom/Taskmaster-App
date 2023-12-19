import SwiftUI

struct TaskPreviewBoxSection: View {

    private let isTextPrepared: Bool
    private let text: String
    
    init(isTextPrepared: Bool, text: String) {
        self.isTextPrepared = isTextPrepared
        self.text = text
    }
    
    public var body: some View {
        ZStack {
            layerBackground
            layerForeground
                .padding(.horizontal)
                .padding(.horizontal, 2)
        }
        .frame(maxHeight: 125)
    }
}

extension TaskPreviewBoxSection {
    
    private var layerBackground: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(.ultraThinMaterial)
    }
    
    private var layerForeground: some View {
        VStack {
            rowHeader
                .padding(.top)
            rowText
                .padding(.bottom)
        }
    }
    
    private var rowHeader: some View {
        let title = Text("Task Preview:")
        let symbolColor: Color = isTextPrepared ? .green : .red
        let symbolName = isTextPrepared ? "checkmark" : "xmark"
        let kerning = isTextPrepared ? 0.0 : -0.3
        
        var indicator: some View {
            ZStack {
                Image(systemName: "circle.fill")
                    .imageScale(.large)
                Image(systemName: symbolName)
                    .imageScale(.small)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .offset(x: kerning)
            }
        }
        
        return HStack {
            title
                .font(.title2)
//                .bold()
            indicator
                .foregroundStyle(symbolColor)
            Spacer()
            Text("Length: \(text.trim().count)")
                .font(.caption)
                .lineLimit(100)
        }
    }
    
    private var rowText: some View {
        HStack {
            Text("\"\(text)\"")
            Spacer()
        }
    }
}

#Preview {
    VStack {
        TaskPreviewBoxSection(isTextPrepared: true, text: "Lorem ipsum dolor")
        TaskPreviewBoxSection(isTextPrepared: false, text: "Lorem ipsum dolor")
    }
}
