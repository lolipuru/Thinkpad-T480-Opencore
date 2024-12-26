/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20241212 (32-bit version)
 * Copyright (c) 2000 - 2023 Intel Corporation
 * 
 *
 * ACPI Data Table [DMAR]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
 */

[000h 0000 004h]                   Signature : "DMAR"    [DMA Remapping Table]
[004h 0004 004h]                Table Length : 00000068
[008h 0008 001h]                    Revision : 01
[009h 0009 001h]                    Checksum : 62
[00Ah 0010 006h]                      Oem ID : "LENOVO"
[010h 0016 008h]                Oem Table ID : "TP-N24  "
[018h 0024 004h]                Oem Revision : 00001450
[01Ch 0028 004h]             Asl Compiler ID : "INTL"
[020h 0032 004h]       Asl Compiler Revision : 20200925

[024h 0036 001h]          Host Address Width : 26
[025h 0037 001h]                       Flags : 01
[026h 0038 00Ah]                    Reserved : 00 00 00 00 00 00 00 00 00 00

[030h 0048 002h]               Subtable Type : 0000 [Hardware Unit Definition]
[032h 0050 002h]                      Length : 0018

[034h 0052 001h]                       Flags : 00
[035h 0053 001h]                    Reserved : 00
[036h 0054 002h]          PCI Segment Number : 0000
[038h 0056 008h]       Register Base Address : 00000000FED90000

[040h 0064 001h]           Device Scope Type : 01 [PCI Endpoint Device]
[041h 0065 001h]                Entry Length : 08
[042h 0066 002h]                    Reserved : 0000
[044h 0068 001h]              Enumeration ID : 00
[045h 0069 001h]              PCI Bus Number : 00

[046h 0070 002h]                    PCI Path : 02,00


[048h 0072 002h]               Subtable Type : 0000 [Hardware Unit Definition]
[04Ah 0074 002h]                      Length : 0020

[04Ch 0076 001h]                       Flags : 01
[04Dh 0077 001h]                    Reserved : 00
[04Eh 0078 002h]          PCI Segment Number : 0000
[050h 0080 008h]       Register Base Address : 00000000FED91000

[058h 0088 001h]           Device Scope Type : 03 [IOAPIC Device]
[059h 0089 001h]                Entry Length : 08
[05Ah 0090 002h]                    Reserved : 0000
[05Ch 0092 001h]              Enumeration ID : 02
[05Dh 0093 001h]              PCI Bus Number : F0

[05Eh 0094 002h]                    PCI Path : 1F,00


[060h 0096 001h]           Device Scope Type : 04 [Message-capable HPET Device]
[061h 0097 001h]                Entry Length : 08
[062h 0098 002h]                    Reserved : 0000
[064h 0100 001h]              Enumeration ID : 00
[065h 0101 001h]              PCI Bus Number : 00

[066h 0102 002h]                    PCI Path : 1F,00


Raw Table Data: Length 104 (0x68)

    0000: 44 4D 41 52 68 00 00 00 01 62 4C 45 4E 4F 56 4F  // DMARh....bLENOVO
    0010: 54 50 2D 4E 32 34 20 20 50 14 00 00 49 4E 54 4C  // TP-N24  P...INTL
    0020: 25 09 20 20 26 01 00 00 00 00 00 00 00 00 00 00  // %.  &...........
    0030: 00 00 18 00 00 00 00 00 00 00 D9 FE 00 00 00 00  // ................
    0040: 01 08 00 00 00 00 02 00 00 00 20 00 01 00 00 00  // .......... .....
    0050: 00 10 D9 FE 00 00 00 00 03 08 00 00 02 F0 1F 00  // ................
    0060: 04 08 00 00 00 00 1F 00                          // ........
