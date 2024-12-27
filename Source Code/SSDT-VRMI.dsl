DefinitionBlock ("", "SSDT", 2, "T480", "Set", 0) {
    External (_SB.PCI0.SBUS, DeviceObj)
    
    If (_OSI ("Darwin"))
    {
        Scope (_SB.PCI0.SBUS) {
            Name (RCFG, Package() {
                // trackpoint
                "TrackpointMultiplier", 35,
                "TrackpointScrollMultiplierX", 18,
                "TrackpointScrollMultiplierY", 18,
            })
        }
    }
}