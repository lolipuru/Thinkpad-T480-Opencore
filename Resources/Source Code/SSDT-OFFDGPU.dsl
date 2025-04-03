/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20241212 (32-bit version)
 * Copyright (c) 2000 - 2023 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000016B (363)
 *     Revision         0x02
 *     Checksum         0x43
 *     OEM ID           "T480"
 *     OEM Table ID     "OFFDGPU"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20210105 (539033861)
 */
DefinitionBlock ("", "SSDT", 2, "T480", "OFFDGPU", 0x00001000)
{
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.HGOF, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.DGON, IntObj)
    External (_SB_.PCI0.LPCB.DGRT, IntObj)
    External (_SB_.PCI0.RP01, DeviceObj)
    External (_SB_.PCI0.RP01.LDIS, FieldUnitObj)
    External (_SB_.PCI0.RP01.VDID, FieldUnitObj)
    External (P8XH, MethodObj)    // 2 Arguments

    Scope (_SB.PCI0.RP01)
    {
        Method (DOFF, 0, Serialized)
        {
            Debug = "OFFDGPU:DOFF()"
            \P8XH (Zero, 0x21)
            ^^HGOF ()
            \P8XH (Zero, 0x22)
            ^^LPCB.DGRT = Zero
            ^^LPCB.DGON = Zero
            LDIS = One
        }

        Method (_STA, 0, Serialized)  // _STA: Status
        {
            If (_OSI ("Darwin"))
            {
                DOFF ()
                Return (Zero)
            }

            Return (0x0F)
        }

        Method (_PS0, 0, Serialized)  // _PS0: Power State 0
        {
            If (_OSI ("Darwin"))
            {
                DOFF ()
            }
        }

        Method (_PS3, 0, Serialized)  // _PS3: Power State 3
        {
            If (_OSI ("Darwin"))
            {
                DOFF ()
            }
        }
    }
}

