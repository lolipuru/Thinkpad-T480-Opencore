/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20241212 (32-bit version)
 * Copyright (c) 2000 - 2023 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of C:/Users/puru/Documents/hackintosh/iasl/SSDT-VRMI.aml
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000000B8 (184)
 *     Revision         0x02
 *     Checksum         0xF3
 *     OEM ID           "T480"
 *     OEM Table ID     "Set"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20241212 (539234834)
 */
DefinitionBlock ("", "SSDT", 2, "T480", "Set", 0x00000000)
{
    External (_SB_.PCI0.SBUS, DeviceObj)

    If (_OSI ("Darwin"))
    {
        Scope (_SB.PCI0.SBUS)
        {
            Name (RCFG, Package (0x06)
            {
                "TrackpointMultiplier", 
                0x23, 
                "TrackpointScrollMultiplierX", 
                0x12, 
                "TrackpointScrollMultiplierY", 
                0x12
            })
        }
    }
}

