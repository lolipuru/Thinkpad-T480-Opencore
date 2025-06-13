# Lenovo ThinkPad T480 - OpenCore Configuation

![Screenshot 2025-06-13 at 10 15 55 AM](https://github.com/user-attachments/assets/57211080-41e2-4a24-929f-022165f79763)

# ⚠️⚠️⚠️ WARNING ⚠️⚠️⚠️
THIS BRANCH IS HIGHLY WIP, USABLE, BUT KEEP IT IN MIND THAT IT'S HEAVILY AMEND AND FORCE PUSH
AND I WON'T TAKE RESPONSIBLE IF THIS BRANCH BREAK SOMETHING, OR EVEN WIPE YOUR HARDDISK CLEAN

## ⚠️ Disclaimer
This guide is only for the Lenovo ThinkPad T480. I am NOT responsible for any harm you cause to your device. This guide is provided "as-is" and all steps taken are done at your own risk.

## ⚠️ Notes
OCLP Patcher isn't available for Tahoe yet, so use it at your own risk.

> The ACPI patches and the style of this README are from [EETagent](https://github.com/EETagent/T480-OpenCore-Hackintosh).

> Thanks valnoxy for his works on hackintosh EFI [t480-oc](https://github.com/valnoxy/t480-oc).

<details>
<summary><strong>💻 My Hardware</strong></summary>
<br>
These are the Hardware component I use. But this OpenCore configuation <strong>should still work</strong> with your device, even if the components are not equal.

Check the model of your WiFi & Bluetooth card. Intel cards should be compatible with itlwm (or AirportItlwm). If your card is from another manufacturer, please check if your card supports macOS. macOS Sonoma no longer supports Broadcom Wifi cards.

| Category  | Component                            |
| --------- | ------------------------------------ |
| CPU       | Intel Core i5-8350U                  |
| GPU       | Intel UHD Graphics 620               |
| SSD       | WD SN520 512GB NVMe SSD (WWAN slot)  |
| SSD       | Samsung PM981a (main m.2 slot)       |
| Memory    | 32GB DDR4 2400Mhz                    |
| Camera    | 720p Camera                          |
| WiFi & BT | Broadcom BCM94360CS2*                |

*highly recommend to use adapter with extension cable

</details>  

</details>

&nbsp;

## Status

<details>  
<summary><strong>✅ General </strong></summary>
</br>
 
- [x] WiFi & Bluetooth (Intel requires spoofing for root patches)
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
- [X] Thunderbolt 3 (Cold Boot only for now)
- [X] Dualbooting (fully supported, both windows / linux)
</details>

<details>  
<summary><strong>⚠️ What's not working</strong></summary>
</br>

- [ ] Fingerprint Reader (Disabled by default or it needed, my thinkpad didn't have fp reader so, idk)
- [ ] Apple GuC Firmware (igfxfw=2) (unable to load the firmware)

```
2025-03-19 12:13:38.871683+0700  localhost kernel[0]: (AppleIntelKBLGraphics) [IGPU] Hash data from ME never returned, status = 1, doing retry #50
2025-03-19 12:13:38.871698+0700  localhost kernel[0]: (AppleIntelKBLGraphics) [IGPU] Hash data from ME never returned, status = 1, doing retry #50
2025-03-19 12:13:38.871702+0700  localhost kernel[0]: (AppleIntelKBLGraphics) [IGPU] Begin Gfx firmware load process
2025-03-19 12:13:38.871708+0700  localhost kernel[0]: (AppleIntelKBLGraphics) [IGPU] Begin Gfx firmware load process
2025-03-19 12:13:38.871711+0700  localhost kernel[0]: (AppleIntelKBLGraphics) [IGPU]    ForceWake Multithread = 0x30002
2025-03-19 12:13:38.871716+0700  localhost kernel[0]: (AppleIntelKBLGraphics) [IGPU]    ForceWake Multithread = 0x30002
2025-03-19 12:13:38.871719+0700  localhost kernel[0]: (AppleIntelKBLGraphics) [IGPU]    CONFIG0 (0xD00)       = 0x8000000e
2025-03-19 12:13:38.871724+0700  localhost kernel[0]: (AppleIntelKBLGraphics) [IGPU]    CONFIG0 (0xD00)       = 0x8000000e
2025-03-19 12:13:38.871727+0700  localhost kernel[0]: (AppleIntelKBLGraphics) [IGPU]    GT_THREAD_STATUS      = 0x400b0000
2025-03-19 12:13:38.871732+0700  localhost kernel[0]: (AppleIntelKBLGraphics) [IGPU]    GT_THREAD_STATUS      = 0x400b0000
2025-03-19 12:13:38.871734+0700  localhost kernel[0]: (AppleIntelKBLGraphics) [IGPU]    Doing retry #50
2025-03-19 12:13:38.871737+0700  localhost kernel[0]: (AppleIntelKBLGraphics) [IGPU]    Doing retry #50
2025-03-19 12:13:40.694501+0700  localhost kernel[0]: (AppleIntelKBLGraphics) [IGPU] Failed to initialize graphics firmware.
2025-03-19 12:13:40.694513+0700  localhost kernel[0]: (AppleIntelKBLGraphics) [IGPU] Failed to initialize graphics firmware.
2025-03-19 12:13:40.694544+0700  localhost kernel[0]: (AppleIntelKBLGraphics) [IGPU] Failed to start graphics engine
2025-03-19 12:13:40.694548+0700  localhost kernel[0]: (AppleIntelKBLGraphics) [IGPU] Failed to start graphics engine
```

- [ ] DRM (Partially, but considered it broken, use unfairgva=4 if you want drm working on apple music and partially on apple TV)
- [ ] Native Color display without any external patches (color banding is quite bad here, required either EDID patching or igpu fixup)
</details>

<details>  
<summary><strong>🔄 Not tested</strong></summary>
</br>

- [ ] WWAN, Sierra Wireless (74xx) is "HIGHLY" recommend, L850-GL is also good to considered as well [Look on HeySora's ACPI for it](https://gist.github.com/HeySora/d720554aa5564a7800de8eca45403ef7)
- [ ] TB3 hotplug, <strike>i don't have any thunderbolt support devices (2017 MBP is currently broken so i can't use TDM) (as i might plan to buy apple silicon mac mini later, i might try fixing it)</strike> i bought the mbp m1, will fix once i got it on hand
- [ ] Secure Boot, too much setup and i'm lazy to do
- [ ] ACPI method of usb mapping (since wwan and thinkpad dock path are missing, i can't properly do it without breaking sleep cycle)
</details>

<details>  
<summary><strong> 🍎 Specific Features (Boardcom Only) </strong></summary>
</br>
 
- [x] Continuity (including use iDevices as camera / microphone)
- [x] Airdrop
- [x] Sidecar (Wired)
- [ ] Sidecar (Wireless, pre sonoma works fine, post sonoma won't works after OCLP patch)
- [x] AirPlay (To iDevices / To Mac)
- [x] Universal Clipboard
- [x] Handoff
- [ ] Apple Watch Unlock (my AW S6 is currently broken...)
- [ ] Iphone mirroring (15.0+) (Require macbook with T2 chips)
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
