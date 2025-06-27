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
        id: kountdownModel
        // Each ListElement is an element on the list, containing information
        ListElement {
            name: "Dog birthday!!"
            description: "Big doggo birthday blowout."
            date: 100
        }
    }

    Component {
        id: kountdownDelegate
        Kirigami.AbstractCard {
            contentItem: Item {
                // implicitWidth/Height define the natural width/height
                // of an item if no width or height is specified.
                // The setting below defines a component's preferred size based on its content
                implicitWidth: delegateLayout.implicitWidth
                implicitHeight: delegateLayout.implicitHeight
                GridLayout {
                    id: delegateLayout
                    anchors {
                        left: parent.left
                        top: parent.top
                        right: parent.right
                    }
                    rowSpacing: Kirigami.Units.largeSpacing
                    columnSpacing: Kirigami.Units.largeSpacing
                    columns: root.wideScreen ? 4 : 2

                    Kirigami.Heading {
                        level: 1
                        text: date
                    }

                    ColumnLayout {
                        Kirigami.Heading {
                            Layout.fillWidth: true
                            level: 2
                            text: name
                        }
                        Kirigami.Separator {
                            Layout.fillWidth: true
                            visible: description.length > 0
                        }
                        Controls.Label {
                            Layout.fillWidth: true
                            wrapMode: Text.WordWrap
                            text: description
                            visible: description.length > 0
                        }
                    }
                    Controls.Button {
                        Layout.alignment: Qt.AlignRight
                        Layout.columnSpan: 2
                        text: i18n("Edit")
                        // onClicked: to be done... soon!
                    }
                }
            }
        }
    }

    fullRepresentation: Kirigami.ScrollablePage {
        Layout.preferredHeight: 1000
        Layout.preferredWidth: 1000

        Kirigami.CardsListView {
            id: cardsView
            model: kountdownModel
            delegate: kountdownDelegate
        }
    }
}
