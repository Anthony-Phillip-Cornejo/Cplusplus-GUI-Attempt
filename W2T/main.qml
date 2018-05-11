import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Controls 2.2



Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Password Manipulation Frame")


    function openFile(fileUrl) {
        var request = new XMLHttpRequest();
        request.open("GET", fileUrl, false);
        request.send(null);
        return request.responseText;
        }

    function saveFile(fileUrl, username, password) {
        var request = new XMLHttpRequest();
        request.open("PUT", fileUrl, false);
        request.send(username);
        return request.status;
        }


    Rectangle {
        id: rectangle
        x: 423
        y: 352
        width: 200
        height: 115
        color: "#2b2b2b"
        enabled: true

        MouseArea {
            anchors.fill: parent
            onClicked: {
                var userText = usernameEdit.getText(0, usernameEdit.length);
                var passText = passwordEdit.getText(0, passwordEdit.length);
                openFile("/Users/APC/Downloads/example.txt");
                saveFile("/Users/APC/Downloads/example.txt", userText, passText);
                Qt.quit()
            }

            Text {
                id: text1
                x: 77
                y: 48
                width: 168
                height: 59
                color: "#ffffff"
                text: qsTr("Enter")
                elide: Text.ElideRight
                font.pixelSize: 24
            }
        }
    }

    TextEdit {
        id: usernameEdit
        x: 251
        y: 195
        width: 251
        height: 51
        text: qsTr("Enter Username")
        font.pixelSize: 12
    }

    Text {
        id: usernameText
        x: 251
        y: 174
        width: 98
        height: 15
        text: qsTr("Username")
        font.pixelSize: 12
    }

    Text {
        id: passwordText
        x: 251
        y: 285
        width: 128
        height: 15
        text: qsTr("Password")
        font.pixelSize: 12
    }

    TextEdit {
        id: passwordEdit
        x: 251
        y: 306
        width: 138
        height: 54
        text: qsTr("Enter Password")
        font.pixelSize: 12
    }
}
