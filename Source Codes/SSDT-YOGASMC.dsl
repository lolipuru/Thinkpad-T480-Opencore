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
 *     Length           0x0000015C (348)
 *     Revision         0x02
 *     Checksum         0x47
 *     OEM ID           "T480"
 *     OEM Table ID     "YOGA"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20210105 (539033861)
 */
DefinitionBlock ("", "SSDT", 2, "T480", "YOGA", 0x00001000)
{
    External (_SB_.PCI0.LPCB.EC__, DeviceObj)
    External (_SB_.PCI0.LPCB.EC__.HFNI, FieldUnitObj)
    External (_SB_.PCI0.LPCB.EC__.HFSP, FieldUnitObj)
    External (_SB_.PCI0.LPCB.EC__.HKEY, DeviceObj)
    External (_SB_.PCI0.LPCB.EC__.VRST, FieldUnitObj)
    External (_SI_._SST, MethodObj)    // 1 Arguments

    Scope (_SB.PCI0.LPCB.EC)
    {
        OperationRegion (ESEN, EmbeddedControl, Zero, 0x0100)
        Field (ESEN, ByteAcc, Lock, Preserve)
        {
            Offset (0x78), 
            EST0,   8
        }

        Scope (HKEY)
        {
            Method (CSSI, 1, NotSerialized)
            {
                \_SI._SST (Arg0)
            }

            Method (CFSP, 1, NotSerialized)
            {
                \_SB.PCI0.LPCB.EC.HFSP = Arg0
            }

            Method (CFNI, 1, NotSerialized)
            {
                \_SB.PCI0.LPCB.EC.HFNI = Arg0
            }

            Method (CRST, 1, NotSerialized)
            {
                \_SB.PCI0.LPCB.EC.VRST = Arg0
            }
        }
    }
}

