import QtQuick
import Qt.labs.platform


MenuBar {
       Menu {
           title: "File"
           MenuItem {
               text: "New Project " +  "\""+ projectName + "\""
               onTriggered: console.log("New Action")
               shortcut: StandardKey.New
           }

           MenuItem {
               text: "Open Existing Project..."
               onTriggered: console.log("New Action")
               shortcut: StandardKey.Open
           }


           MenuItem {
               text: "Recent Project..."


           }
            MenuSeparator{}

           MenuItem {
               text: "Save " +  "\""+ projectName + "\""
               onTriggered: console.log("New Action")
               shortcut: StandardKey.Save
           }

           MenuItem {
               text: "Save " +  "\""+ projectName + "\"" + " As"
               onTriggered: console.log("New Action")
               shortcut: StandardKey.SaveAs
           }


           MenuSeparator{}

           MenuItem {
               text: "Export Project"
               onTriggered: console.log("New Action")
               shortcut: { sequence: "Ctrl+alt+E" }
           }

           MenuSeparator{}

           MenuItem {
               text: "Close Project " +  "\""+ projectName + "\""
               onTriggered: console.log("New Action")
           }
       }

//----------------------------------------------------------------------
       Menu {
           title: "Edit"
            MenuItem { text: "item1" }
       }

       Menu {
           title: "View"
           MenuItem { text: "item1" }

       }

       Menu {
           title: "Account"
           MenuItem { text: "item1" }

       }


       Menu {
           title: "Account"
           MenuItem { text: "item1" }

       }

       Menu {
           title: "Help"
           MenuItem { text: "item1" }

       }
   }
