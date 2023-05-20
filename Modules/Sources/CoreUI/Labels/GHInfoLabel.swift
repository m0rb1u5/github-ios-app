import Core
import SwiftUI

public struct GHInfoLabel: View {
    var style: GHInfo.Style
    var infos: [String]
    var icon: Image?

    public init(
        style: GHInfo.Style,
        infos: [String],
        icon: Image? = nil
    ) {
        self.style = style
        self.infos = infos
        self.icon = icon
    }

    public var body: some View {
        HStack(alignment: .center, spacing: 4) {
            if let icon: Image {
                icon
                    .resizable()
                    .scaledToFit()
                    .frame(width: style.iconSize, height: style.iconSize)
                    .foregroundColor(style.iconColor)
            }

            ForEach(Array(infos.enumerated()), id: \.offset) { index, info in
                if index < infos.count, index != 0 {
                    Text("•")
                        .foregroundColor(style.infoColor)
                        .font(style.font)
                        .lineLimit(1)
                }
                Text(LocalizedStringKey(info))
                    .foregroundColor(style.infoColor)
                    .font(style.font)
                    .lineLimit(1)
            }
        }
    }
}

#if DEBUG
public struct GHInfoLabel_Previews: PreviewProvider {
    public static var previews: some View {
        VStack {
            Text("Modal Style")
                .font(.title)
            HStack {
                makePreview()
                makePreview(
                    infos: ["7:45pm", "50 min"],
                    icon: Image(systemSymbol: .clock)
                )
            }
            .padding(24)

            Text("Card Style")
                .font(.title)
            HStack {
                makePreview(style: .card)
                makePreview(
                    style: .card,
                    infos: ["7:45pm", "50 min"],
                    icon: Image(systemSymbol: .clock)
                )
            }
            .padding(24)
        }
    }

    public static func makePreview(
        style: GHInfo.Style = .modal,
        infos: [String] = ["175 Second"],
        icon: Image? = Image(systemSymbol: .calendar)
    ) -> some View {
        GHInfoLabel(style: style, infos: infos, icon: icon)
    }
}
#endif
