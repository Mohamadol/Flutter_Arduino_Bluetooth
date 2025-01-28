# Flutter+Arduino Communication with Bluetooth Low Energy (BLE)
This tutorial guides you through establishing Bluetooth communication between an Arduino and iPhone/Android devices using Flutter.

---

## Table of Contents
1. [What is Flutter?](#what-is-flutter)
2. [What to Expect in This Tutorial](#what-to-expect-in-this-tutorial)
3. [Prerequisites](#prerequisites)
   - [Git](#git)
   - [Visual Studio Code](#visual-studio-code)
   - [Android Studio (if developing for Android)](#android-studio-if-developing-for-android)
   - [Xcode (if developing for iOS)](#xcode-if-developing-for-ios)
   - [Flutter SDK](#flutter-sdk)
     - [For Mac](#for-mac)
     - [For Windows](#for-windows)
   - [Apple Developer Account & Certificates (if developing for iOS)](#apple-developer-account--certificates-if-developing-for-ios)
   - [Setting-up the Phone](#setting-up-the-phone)
     - [Setting-up Android for Development](#setting-up-android-for-development)
     - [Setting-up iPhone for Development](#setting-up-iphone-for-development)
4. [Running Applications](#running-applications)
---

## What is Flutter?
Flutter is a powerful mobile development framework built by Google, based on the Dart programming language. It enables developers to create high-performance, cross-platform applications with a single codebase. With Flutter, you can develop apps for iOS, Android, and even web and desktop platforms like Chrome and Windows in certain cases.

### What to Expect in This Tutorial:
- Instructions for the initial one-time setup required for Flutter development.
- An example application to connect and communicate with an Arduino device.

---

## Prerequisites
Before you begin, you need to install some tools and perform some actions:

### Git
Git is a version control system that you’ll need installed.

- **For Windows**:  
  Download and install Git from the [official website](https://git-scm.com/download/win). Follow the installation steps, and make sure to select "Git Bash" as your default terminal if prompted.

- **For Mac**:  
  Git is pre-installed on most macOS systems. You can verify by running the following command in the terminal:
  ```bash
  git --version

### Visual Studio Code

- Download from the [official website](https://code.visualstudio.com/download).

---

### Android Studio (if developing for Android)

1. Download and install Android Studio from the official website:  
   [https://developer.android.com/studio](https://developer.android.com/studio)

2. Launch Android Studio and configure the SDK tools:
   - Navigate to **More Actions** → **SDK Manager**.
   - Go to the **SDK Tools** tab.
     - <img src="https://github.com/user-attachments/assets/cbcfc6e7-f0ab-4438-898c-72957d576740" alt="SDK Manager More Actions" width="500" />
   - Check the following options and install them:
     - **Android SDK Command-line Tools**
     - **Google USB Driver** (only required on Windows)
     - <img src="https://github.com/user-attachments/assets/029a5e31-9b9c-4b8e-9b43-301567bfb08f" alt="SDK Tools Tab" width="500" />

---

### Xcode (if developing for iOS)

> **Note**:  
> You can only develop for iOS on a macOS device.  
> If you have a Mac with **Apple Silicon (M1/M2)**, you may need **Rosetta**, which helps translate applications not designed for Apple Silicon.  
> To install Rosetta, open the terminal and run:  
> ```bash
> sudo softwareupdate --install-rosetta --agree-to-license
> ```

1. **Install Xcode**:  
   - Download and install Xcode from the **App Store** on your Mac.

2. **Configure Xcode**:  
   - Open a terminal and run the following setup commands:  
   - For detailed instructions, refer to the official Flutter documentation:  
     [Install and Configure Xcode](https://docs.flutter.dev/get-started/install/macos/desktop#install-and-configure-xcode)

   ```bash
   # Set Xcode developer directory
   sudo sh -c 'xcode-select -s /Applications/Xcode.app/Contents/Developer && xcodebuild -runFirstLaunch'

   # Accept the Xcode license
   sudo xcodebuild -license

   # Install CocoaPods (a dependency manager for iOS projects)
   sudo gem install cocoapods

   # Add CocoaPods to the PATH (you need to run this command each time you open a new terminal)
   export PATH=$HOME/.gem/bin:$PATH

---

### Flutter SDK

#### **For Mac**
1. **Download Flutter SDK**:  
   - Get the latest Flutter SDK from the official Flutter documentation:  
     [Download Flutter SDK](https://docs.flutter.dev/get-started/install/macos/desktop#install-the-flutter-sdk)

2. **Unzip and Add to Path**:  
   - Unzip the downloaded file into a directory of your choice.  
     Here’s an example of unzipping it to the home directory (`~`):  
     ```bash
     unzip ~/Downloads/flutter_macos_arm64_3.27.1-stable.zip -d ~/
     ```

   - Add the Flutter SDK to your `PATH` environment variable:  
     ```bash
     export PATH=$HOME/flutter/bin:$PATH
     ```

   - **Note**:  
     - You can unzip the Flutter SDK into any directory you prefer (the example above uses the home directory `~`).
     - The `export` command needs to be run every time you open a new terminal. For a permanent solution, add the export command to your shell configuration file (e.g., `.bashrc`, `.zshrc`, or `.bash_profile`):
       ```bash
       echo 'export PATH=$HOME/flutter/bin:$PATH' >> ~/.zshrc
       source ~/.zshrc
       ```
3. **Verify Flutter and Xcode Setup**:  
   - In the terminal, run the following command to ensure Flutter and Xcode are configured correctly:  
     ```bash
     flutter doctor
     ```
   - The output should confirm that Flutter and Xcode are properly set up.  
     <img src="https://github.com/user-attachments/assets/daacf64d-0e22-45c9-b630-0963dfc15d89" alt="flutter doctor iOS" width="500" />
     
#### **For Windows**

1. **Install the Flutter Extension in VS Code**:  
   - Open VS Code and install the Flutter extension from the Extensions Marketplace.  
     <img width="468" alt="Flutter Extension" src="https://github.com/user-attachments/assets/658a7185-91aa-472a-b8d9-45dee62c09f3" />

2. **Create a New Flutter Project**:  
   - Open the Command Palette using `Ctrl+Shift+P` and search for `>Flutter: New Project`.  
     <img width="292" alt="Flutter New Project" src="https://github.com/user-attachments/assets/aea7b097-9054-4330-9778-20abc20e00ce" />

3. **Download Flutter SDK**:  
   - If an error is displayed stating that the SDK was not found, choose the **Download** option.

4. **Open the Terminal in VS Code**:  
   - Navigate to **View → Terminal** in the VS Code menu.  
     <img width="279" alt="Open Terminal" src="https://github.com/user-attachments/assets/f7337504-b476-456a-96a5-a73ccec9b7fe" />

5. **Run `flutter doctor`**:  
   - In the VS Code terminal, run the following command to check your Flutter installation:  
     ```bash
     flutter doctor
     ```
   - You should see an **OK** status for most items. Do not worry about warnings related to **Chrome** or **Visual Studio** checks, as they are not required.  
     <img width="377" alt="Flutter Doctor Output" src="https://github.com/user-attachments/assets/3508469f-8d94-45ae-860d-23ee9e5c9ee1" />

---

### Apple Developer Account & Certificates (if developing for iOS)

1. **Create an Apple Developer Account**:  
   - Sign up or log in to your Apple Developer account:  
     [Apple Developer](https://developer.apple.com/)

2. **Create Certificates**:  
   - Launch **Xcode**.  
   - Select **Xcode → Preferences**.  
   - In the Preferences window, click on **Accounts** in the toolbar.  
   - Click the **+** button in the lower-left corner to add your Apple Developer account.  
   - In the dialog that appears:
     - Choose **Apple ID** and click **Continue**.
     - Enter your Apple ID and password, then click **Next**.  
       Your Apple Developer account will now appear in the list.
   - Click **Manage Certificates**:
     - A dialog appears showing any existing certificates (if any). If you're new, this list will be empty.
     - Click the **+** button in the lower-left corner and choose **Apple Development** to create an Apple Development certificate.  
       The certificate will appear in the list.
     - Click the **+** button again and choose **Apple Distribution** to create an Apple Distribution certificate.  
       The certificate will also appear in the list.
   - Click **Done** to finish.

3. **More Information**:  
   For additional details, refer to the official documentation:  
   [Installing Xcode and Apple Certificates](https://documentation.xojo.com/topics/application_deployment/apple_requirements/installing_xcode_and_apple_certificates.html)

---

### Setting-up the Phone

#### Setting-up Android for Development

To load and debug apps on an Android phone, you need to configure your device for development. Follow these steps:

1. **Enable Developer Options and USB Debugging**:  
   - Detailed instructions can be found here:  
     [Enable Developer Options and USB Debugging](https://developer.android.com/studio/debug/dev-options)

2. **Connect Your Device**:  
   - Use a USB cable to connect your Android phone to your computer.  
   - Ensure your phone is unlocked, and allow USB debugging when prompted.

#### Setting-up iPhone for Development

1. **Connect Your Device**:  
   - Use a USB cable to connect your iPhone to your Mac.

2. **Enable Developer Mode**:  
   - Open **Xcode**, and in the top-left menu, navigate to:  
     **Window → Devices & Simulators**  
   - Select your connected device and enable **Developer Mode**.

   Alternatively, you can enable Developer Mode directly on your iPhone:  
   - Go to **Settings → Privacy & Security → Developer Mode**.

3. **Restart Your iPhone**:  
   - After enabling Developer Mode, restart your iPhone to ensure all settings are applied.

## Running Applications

### Running a Simple App

Follow these steps to create and run a basic Flutter app:

#### **On macOS**:
1. Open a terminal and execute the following commands:
    ```bash
    mkdir app_dir
    cd app_dir
    flutter create simple_app
    cd simple_app
    flutter run
    ```

#### **On Windows**:
1. Open the Command Palette in Visual Studio Code with `Ctrl+Shift+P`.
2. Run the command `>Flutter: New Project` and choose **Application**.
3. Specify the location for your new app.
4. Open PowerShell and navigate to your app's directory. For example, if you created your app in `Q:\app_dir\simple_app`, then in powershell you enter:
    ```powershell
    Set-Location "Q:\app_dir\simple_app"
    ```
5. Run the app:
    ```bash
    flutter run
    ```

This might take a few minutes, but afterwards you should be able to choose the phone that is connected to your computer and see an application that looks like this on your phone:

<p align="center">
  <img src="https://github.com/user-attachments/assets/466cfebd-cca6-42e4-a371-75e9985493fa" alt="simple app" width="200"/>
</p>
 
