import QtQuick 2.15
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.components 3.0 as PlasmaComponents
import org.kde.plasma.plasmoid

PlasmoidItem {
    id: root

    readonly property bool inPanel: (Plasmoid.location === PlasmaCore.Types.TopEdge
            || Plasmoid.location === PlasmaCore.Types.RightEdge
            || Plasmoid.location === PlasmaCore.Types.BottomEdge
            || Plasmoid.location === PlasmaCore.Types.LeftEdge)

    preferredRepresentation: inPanel ? PlasmaComponents.Panel : PlasmaComponents.FullRepresentation
    fullRepresentation: Item {
        PlasmaComponents.Label {
            text: "Hello World"
        }
    }
}
