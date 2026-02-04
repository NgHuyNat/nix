import qs
import qs.modules.common
import QtQuick
import Quickshell
import Quickshell.Io
pragma Singleton

/**
 * Idle inhibitor service using systemd-inhibit for Quickshell 0.2.x compatibility.
 */
Singleton {
    id: root

    property bool inhibit: false

    Connections {
        target: Persistent
        function onReadyChanged() {
            if (!Persistent.isNewHyprlandInstance) {
                root.inhibit = Persistent.states.idle.inhibit
            } else {
                Persistent.states.idle.inhibit = root.inhibit
            }
            // Start/stop inhibitor based on saved state
            updateInhibitor()
        }
    }

    function toggleInhibit() {
        root.inhibit = !root.inhibit
        Persistent.states.idle.inhibit = root.inhibit
        updateInhibitor()
    }

    function updateInhibitor() {
        if (root.inhibit) {
            inhibitorProcess.running = true
        } else {
            inhibitorProcess.signal(15) // SIGTERM
        }
    }

    // Use systemd-inhibit to prevent idle/sleep while coffee mode is active
    Process {
        id: inhibitorProcess
        command: ["systemd-inhibit", "--what=idle:sleep", "--who=Quickshell", "--why=Keep system awake (coffee mode)", "--mode=block", "sleep", "infinity"]
        running: root.inhibit
    }

}
