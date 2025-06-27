import QtQuick
import QtQuick.Layouts
import QtQuick.Controls as Controls
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.components 3.0 as PlasmaComponents
import org.kde.plasma.plasmoid
import org.kde.kirigami as Kirigami

PlasmoidItem {
    id: root

    ListModel {
        id: itemModel
        ListElement {
            appName: "Steam"
            appIcon: "applications-internet-symbolic"
        }
    }

    Component {
        id: itemDelegate
        Kirigami.AbstractCard {
            contentItem: Item {
                implicitWidth: delegateLayout.implicitWidth
                implicitHeight: delegateLayout.implicitHeight
                RowLayout {
                    id: delegateLayout
                    spacing: 5
                    width: parent.width
                    Kirigami.Icon {
                        source: appIcon
                    }
                    PlasmaComponents.Label {
                        text: appName
                    }
                    Item {
                        Layout.fillWidth: true
                    }
                    PlasmaComponents.Button {
                        icon.name: "dialog-close-symbolic"
                    }
                }
            }
        }
    }

    fullRepresentation: Kirigami.ScrollablePage {
        Layout.preferredHeight: 375
        Layout.preferredWidth: 300
        background: Item {} // Makes background transparent

        Kirigami.CardsListView {
            leftMargin: 5
            rightMargin: 5
            bottomMargin: 5
            topMargin: 5

            model: itemModel
            delegate: itemDelegate
        }
    }
}
