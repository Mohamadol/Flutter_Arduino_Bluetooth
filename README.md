# Flutter+Arduino Communication with Bluetooth Low Energy (BLE)
This tutorial guides you through establishing Bluetooth communication between an Arduino and iPhone/Android devices using Flutter.

## What is Flutter?
Flutter is a powerful mobile development framework built by Google, based on the Dart programming language. It enables developers to create high-performance, cross-platform applications with a single codebase. With Flutter, you can develop apps for iOS, Android, and even web and desktop platforms like Chrome and Windows in certain cases.

### What to Expect in This Tutorial:
- Instructions for the initial one-time setup required for Flutter development.
- An example application to connect and communicate with an Arduino device.

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

### Visual Studio Code (VS-Code)

- Download from the [official website](https://code.visualstudio.com/download).

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

## Flutter SDK

### **For Mac**
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
     

### **For Windows**

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



