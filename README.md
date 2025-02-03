# Fedora Powerhouse Setup Guide

Hello there, ready to start your journey of setting up your **Fedora Powerhouse**? This guide will walk you through every step to get your Fedora system up and running with a fully customized development environment. Just follow these steps, and you'll be there in no time!

---

## **Step 1: Install Fedora Workstation**

1. Download the Fedora Workstation ISO file from the [official Fedora website](https://getfedora.org/).
2. Create a bootable USB drive using tools like \*\*Rufus, Etcher, Ventoy (Recommended)\*\*
3. Boot your system from the USB drive and follow the installation instructions to set up Fedora (You must have a phone that supports USB Tethering with a USB cable that supports it as well to install Fedora as you cannot connect to wifi while installing it)

---

## **Step 2: Update Your System**

After installation, update your system to ensure you have the latest packages:

```bash
sudo dnf update -y
```

---

## **Step 3: Optimize DNF Configuration**

Make your package manager faster by tweaking its configuration:

1. Open the DNF configuration file:
   ```bash
   sudo nano /etc/dnf/dnf.conf
   ```
2. Add the following lines at the end of the file:
   ```
   max_parallel_downloads=7
   fastestmirror=True
   ```
3. Save and exit (`Ctrl+O`, `Enter`, `Ctrl+X`).

---

## **Step 4: Connect to Wi-Fi**

If your Wi-Fi isn’t working out of the box, follow these steps:

1. **Find Your Wi-Fi Driver:**

   ```bash
   lspci | grep -i network
   ```

   This will show the Wi-Fi hardware. Note the driver needed.

2. **Install the Driver:**

   ```bash
   sudo dnf install <driver-package-name>
   ```

   Replace `<driver-package-name>` with the appropriate driver (e.g., `broadcom-wl` for Broadcom cards).

3. **Reboot the System:**

   ```bash
   reboot
   ```

4. **Load the Module:**

   ```bash
   sudo modprobe wl
   ```

5. **Reboot Again:**

   ```bash
   reboot
   ```

6. **Connect to Wi-Fi:**
   Use the network manager in your desktop environment to connect to your Wi-Fi network.

---

## **Step 5: Clone Your Dotfiles Repository**

Set up your development environment by cloning your dotfiles:

```bash
git clone https://github.com/Deshraj-Tiwari-Official/Fedora-Powerhouse.git ~/dotfiles
```

---

## **Step 6: Run the Setup Script**

Make your setup script executable and run it:

```bash
chmod +x ~/dotfiles/00_scripts/main.sh
~/dotfiles/00_scripts/main.sh
```

---

## **Step 7:Fix Your Hyprland Wallpaper**

Replace `deshraj` with the username you created for each line in the file ~/dotfiles/hypr/hyprpaper.conf

---

## **Step 8: Final Touches**

- Reboot your system one last time to ensure all changes are applied:
  ```bash
  reboot
  ```
  - Remember to boot in Hyprland this time :) {There would be a tiny gear icon in the login screen to do so}
- Enjoy your freshly configured Fedora Powerhouse!

---
