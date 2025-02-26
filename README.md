# Lenovo ThinkPad T480 - OpenCore Configuation

# ⚠️⚠️⚠️ WARNING ⚠️⚠️⚠️
THIS BRANCH IS HIGHLY WIP, AMEND PUSH AND FORCE PUSH IS EXPECTED TO HAPPENED
AND I TAKE 0 RESPONSIBLE FOR ANYTHING HAPPENED

## ⚠️ Disclaimer
This guide is only for the Lenovo ThinkPad T480. I am NOT responsible for any harm you cause to your device. This guide is provided "as-is" and all steps taken are done at your own risk.

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
- [X] Dualbooting 
</details>

<details>  
<summary><strong>⚠️ What's not working</strong></summary>
</br>

- [ ] Fingerprint Reader (Disabled by default)
- [ ] Apple GuC Firmware (igfxfw=2) (It does booted on T480, but cpu frequent stuck at very low frequency)
- [ ] DRM (Partially, but considered it broken)
</details>

<details>  
<summary><strong>🔄 Not tested</strong></summary>
</br>

- [ ] WWAN, Sierra Wireless (74xx) is "HIGHLY" recommend, L850-GL is also good to considered as well [Look on HeySora's ACPI for it](https://gist.github.com/HeySora/d720554aa5564a7800de8eca45403ef7)
</details>

<details>  
<summary><strong>🔧 Broadcom Specific </strong></summary>
</br>
 
- [x] Continuity
- [x] Airdrop
- [x] Sidecar (Wired), Wireless (Pre Sonoma)
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
