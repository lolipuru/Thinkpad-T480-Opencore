/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20241212 (32-bit version)
 * Copyright (c) 2000 - 2023 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of C:/Users/puru/Documents/hackintosh/iasl/SSDT-KBRD.aml
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000166 (358)
 *     Revision         0x02
 *     Checksum         0xBE
 *     OEM ID           "T480"
 *     OEM Table ID     "KBRD"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20211217 (539038231)
 */
DefinitionBlock ("", "SSDT", 2, "T480", "KBRD", 0x00000000)
{
    External (_SB_.PCI0.LPCB.KBD_, DeviceObj)

    Scope (\_SB.PCI0.LPCB.KBD)
    {
        If (_OSI ("Darwin"))
        {
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If (!Arg2)
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

                Return (Package (0x04)
                {
                    "RM,oem-id", 
                    "LENOVO", 
                    "RM,oem-table-id", 
                    "T480"
                })
            }

            Name (RMCF, Package (0x02)
            {
                "Keyboard", 
                Package (0x0A)
                {
                    "ActionSwipeLeft", 
                    "37 d, 21 d, 21 u, 37 u", 
                    "ActionSwipeRight", 
                    "37 d, 1e d, 1e u, 37 u", 
                    "SleepPressTime", 
                    "500", 
                    "Swap command and option", 
                    ">y", 
                    "Custom PS2 Map", 
                    Package (0x03)
                    {
                        Package (0x00){}, 
                        "e038=e05b", 
                        "e037=64"
                    }
                }
            })
        }
    }
}

