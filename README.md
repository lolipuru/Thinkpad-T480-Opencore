# Lenovo ThinkPad T480 - OpenCore Configuation

<img align="right" src="https://shorturl.at/xbc4z" alt="macOS Sequoia running on the T480" width="425">

[![macOS](https://img.shields.io/badge/macOS-Monterey-brightgreen.svg?logo=apple)](https://developer.apple.com/documentation/macos-release-notes)
[![macOS](https://img.shields.io/badge/macOS-Ventura-brightgreen.svg?logo=apple)](https://developer.apple.com/documentation/macos-release-notes)
[![macOS](https://img.shields.io/badge/macOS-Sonoma-brightgreen.svg?logo=apple)](https://developer.apple.com/documentation/macos-release-notes)
[![macOS](https://img.shields.io/badge/macOS-Sequoia-brightgreen.svg?logo=apple)](https://developer.apple.com/documentation/macos-release-notes)
[![OpenCore](https://img.shields.io/badge/OpenCore-1.0.1-blue.svg)](https://github.com/acidanthera/OpenCorePkg)
[![License](https://img.shields.io/badge/license-MIT-purple.svg)](/LICENSE)

<p align="center">
   <strong>Status: Maintained</strong>
   <br />
   <strong>Version: </strong>1.4.1 | Personal Edition
   <br />
   <strong>No Download / Release for this version
   <br />
   <strong>You can download EFI as zip directly
   <br />
  </p>
</p>
</br>

## ⚠️ Disclaimer
This guide is only for the Lenovo ThinkPad T480. I am NOT responsible for any harm you cause to your device. This guide is provided "as-is" and all steps taken are done at your own risk.

> The ACPI patches and the style of this README are from [EETagent](https://github.com/EETagent/T480-OpenCore-Hackintosh).

> Thanks valnoxy for his works on hackintosh EFI [t480-oc](https://github.com/valnoxy/t480-oc).

> [!IMPORTANT]
> Intel WiFi with Airportitlwm is working with root patch, read the instruction below.

> [!NOTE]
> The instructions for installing macOS have been moved [to the wiki](https://github.com/valnoxy/t480-oc/wiki).


&nbsp;

## 💻 Tested devices
Some users have reported that similar ThinkPads are compatible with this OpenCore configuration. Here is a list of these devices:

- Lenovo ThinkPad T580
- [Lenovo ThinkPad X280](https://github.com/valnoxy/t480-oc/discussions/47)

## Introduction

### EFI folders

This repo includes multiple EFI configuations for different macOS Versions.

| EFI               | Description                                                               | Type      |
| ----------------- | ------------------------------------------------------------------------- | --------- |
| `EFI - HeliPort`  | Supports every macOS Version except Ventura, Require HeliPort app         | `Stable`  |

<a href="https://github.com/OpenIntelWireless/HeliPort/releases"><strong>
Download HeliPort app »</strong></a>

<details>
<summary><strong>💻 My Hardware</strong></summary>
<br>
These are the Hardware component I use. But this OpenCore configuation <strong>should still work</strong> with your device, even if the components are not equal.

Check the model of your WiFi & Bluetooth card. Intel cards should be compatible with itlwm (or AirportItlwm). If your card is from another manufacturer, please check if your card supports macOS. macOS Sonoma no longer supports Broadcom Wifi cards.

| Category  | Component                            |
| --------- | ------------------------------------ |
| CPU       | Intel Core i5-8350U                  |
| GPU       | Intel UHD Graphics 620               |
| SSD       | WD SN520 512GB NVMe SSD   	   |
| Memory    | 20GB DDR4 2400Mhz                    |
| Camera    | 720p Camera                          |
| WiFi & BT | Intel® Dual Band Wireless-AC 8265*   |

*i'm ordering bcm94360cs2, when it's arrived i'll do guide for how to replace it for t480

</details>  

</details>

&nbsp;

## Status

<details>  
<summary><strong>✅ What's working</strong></summary>
</br>
 
- [x] Intel WiFi & Bluetooth (Only Heliport Support)
- [x] Audio (Audio Jack & Speaker)
- [X] Brightness / Volume Control
- [X] Battery Information
- [X] USB Ports & Built-in Camera
- [X] Graphics Acceleration
- [X] Trackpoint / Touchpad
- [X] Power management / Sleep
- [X] FaceTime / iMessage (iServices)
- [X] HDMI
- [X] Automatic OS updates
- [X] SIP / FireVault 2
- [X] USB-C
- [X] DRM (Partially)
- Safari (Partially), Apple Music, and Apple TV seem to works with unfairgva=4 (Safari DRM only works on content that support HLS encryption)
- [X] Thunderbolt 3 (Cold Boot only for now)

</details>

<details>  
<summary><strong>⚠️ What's not working</strong></summary>
</br>

- [ ] Fingerprint Reader 
  - Disabled with NoTouchID kext
- [ ] Dualbooting Windows / Linux (with OpenCore) 
  - BSOD in windows, not recommend to do dualboot with this EFI / Use rEFInd for dual boot instead
- [ ] Iphone mirroring (15.0+)
  - Require macbook with T2 chips 
</details>

<details>  
<summary><strong>🔄 Not tested</strong></summary>
</br>

- [ ] WWAN
- [ ] Handoff / Universal Clipboard
- [ ] Sidecar (Cable) / AirPlay to Mac
- [ ] AirDrop & Continuity / Apple Watch Unlock / Sidecar Wireless
  - Only support for BCM Card / keep it untested as i'm ordering new one
</details>

<details>  
<summary><strong>🔧 Experimental</strong></summary>
</br>

- [ ] Apple GuC Firmware (igfxfw=2)
  - It does booted on T480, but cpu frequent stuck at very low frequency
- [ ] rps-control (igfxrpsc=1)
  - works good, but need more time to test
- [ ] bios unlock stuff (CFG Unlock / DVMT Unlock)
  - i have no plan to do this until i got hand of real m1 macbook (but if you do, highly recommend for cfg / dvmt stuff)  
</details>

&nbsp;

## Extras
<details>  
<summary><strong>Root patch instruction for airportltwm</strong></summary>
</br>

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


after that, be sure to add amfi=0x80 in boot-args (for allowing OCLP root patch), then press save

3. download IO80211FamilyLegacy IOSkywalkFamily kext from [OCLP](https://github.com/dortania/OpenCore-Legacy-Patcher/tree/main/payloads/Kexts/Wifi) (currently, this repo already included and already setup, but you need to download once i drop it)

4. if you done the setup correctly, you should be able to install the OCLP root patch

![ภาพถ่ายหน้าจอ 2024-12-26 เวลา 2 36 01 AM](https://github.com/user-attachments/assets/6a44dd01-c7cf-4db5-8db7-e54683529687)

5. install the patch, then you can remove the spoof id (or add the # instead) and intel wifi should works without heliport

![ภาพถ่ายหน้าจอ 2024-12-26 เวลา 2 41 25 AM](https://github.com/user-attachments/assets/8b7edcd6-3416-4b81-8f3f-192605804a65)

</details>

&nbsp;

## ⭐️ Feedback
Did you find any bugs or just have some questions? Feel free to provide your feedback using the Discussions tab.

&nbsp;

## 📜 License

This repo is licensed under the [MIT License](https://github.com/valnoxy/t480-oc/blob/main/LICENSE).

OpenCore is licensed under the [BSD 3-Clause License](https://github.com/acidanthera/OpenCorePkg/blob/master/LICENSE.txt).

<hr>
<h6 align="center">© 2018 - 2024 valnoxy. All Rights Reserved. 
<br>
By Jonas Günner &lt;jonas@exploitox.de&gt;</h6>
<p align="center">
	<a href="https://github.com/valnoxy/t480-oc/blob/main/LICENSE"><img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&logoColor=d9e0ee&colorA=363a4f&colorB=b7bdf8"/></a>
</p>
