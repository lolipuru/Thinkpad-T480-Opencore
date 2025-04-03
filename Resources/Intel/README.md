# Intel Root patch instruction for sequoia

> Credit to [ResQre](https://github.com/ResQre) for instruction

What you need
- intel wifi card (of course)
- hackintool (for device path) + your favourite plist editor (in my case, OCAuxiliaryTools)

1. open hackintool and go to Pcie menu, look for intel wireless (in my case, Wireless 8260)
![ภาพถ่ายหน้าจอ 2024-12-26 เวลา 1 49 07 AM](https://github.com/user-attachments/assets/93566ae7-5b73-47ba-8d26-b1241e8c8dda)

2. open plist editor (i'll use OCAuxiliaryTools), add device path (without #), then add the following device details

| Key   |      Data Type      |  Value |
|----------|:-------------:|:------:|
| IOName |  String | pci14e4,43a0|
| compatible |    String   | pci106b,117 |
| device-id | Data | A0430000 |
| device_type | String | Network Controller |
| model | String | BCM4360 802.11ac Wireless Network Adapter |
| name | String | pci14e4,43a0 |
| pci-aspm-default | Number | 0 |
| subsystem-id | Data | 17010000 |
| subsystem-vendor-id | Data | 6B100000 |
| vendor-xt | Data | E4140000 |

it should be like this

![image](https://github.com/user-attachments/assets/2a7b1d5b-29a7-4740-aaba-9ce1eb661f3f)


press save and reboot (no need for kext setup since it's already presents in the efi)

3. if you done the setup correctly, you should be able to install the OCLP root patch

![ภาพถ่ายหน้าจอ 2024-12-26 เวลา 2 36 01 AM](https://github.com/user-attachments/assets/6a44dd01-c7cf-4db5-8db7-e54683529687)

4. install the patch, then you can remove the spoof id (or add the # instead) and intel wifi should works without heliport

![ภาพถ่ายหน้าจอ 2024-12-26 เวลา 2 41 25 AM](https://github.com/user-attachments/assets/8b7edcd6-3416-4b81-8f3f-192605804a65)
