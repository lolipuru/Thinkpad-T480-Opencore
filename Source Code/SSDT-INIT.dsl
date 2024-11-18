DefinitionBlock ("", "SSDT", 2, "T480", "INIT", 0x00001000)
{
    // External method from SSDT-Darwin.dsl
    External (OSDW, MethodObj) // 0 Arguments

    External (_SB.PCI0, DeviceObj)

    // System
    External (HPTE, FieldUnitObj) // HPET enabled?
    External (WNTF, FieldUnitObj) // DYTC enabled?
    External (DPTF, FieldUnitObj) // DPTF enabled?
    External (OSYS, FieldUnitObj) // OS type

    External (ZINI, MethodObj)

    // Thunderbolt
    External (_SB.PCI0.RP09.INIT, MethodObj)

    Scope (\_SB.PCI0)
    {
        Method (OINI, 0, NotSerialized)
        {
            If (OSDW())
            {
                Debug = "INIT: Set Variables..."

                // disable HPET. It shouldn't be needed on modern systems anyway and is also disabled in genuine OSX
                HPTE = Zero

                // Enables DYTC, Lenovos thermal solution. Can be controlled by YogaSMC
                WNTF = One

                // Disable DPTF, we use DYTC!
                DPTF = Zero

                // Patch OSYS to native value of darwin
                OSYS = 0x07DF
            }

            ZINI ()

            // Thunderbolt-setup
            If (OSDW () && CondRefOf (\_SB.PCI0.RP09.INIT))
            {
                \_SB.PCI0.RP09.INIT ()
            }
        }
    }
}
//EOF