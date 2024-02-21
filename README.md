# AthenaXAI

[![CI Status](https://img.shields.io/travis/nemanjacvetkovic-syncit/AthenaXAI.svg?style=flat)](https://travis-ci.org/nemanjacvetkovic-syncit/AthenaXAI)
[![Version](https://img.shields.io/cocoapods/v/AthenaXAI.svg?style=flat)](https://cocoapods.org/pods/AthenaXAI)
[![License](https://img.shields.io/cocoapods/l/AthenaXAI.svg?style=flat)](https://cocoapods.org/pods/AthenaXAI)
[![Platform](https://img.shields.io/cocoapods/p/AthenaXAI.svg?style=flat)](https://cocoapods.org/pods/AthenaXAI)

## Overview

⚡ Athena XAI ⚡
Athena XAI is a human-centric, explainable, AI platform that prioritizes user needs, improves their satisfaction and engagement with eCommerce stores, provides clear insights into the decision-making process, and dynamically provides personalized experiences based on individual users’ needs.

Athena XAI iOS Library consists of:

Advanced Search
Category Navigation
Visual Search
Analytics
Website: [Athena XAI](https://a-x.ai/)

[Athena XAI](https://github.com/syncitgroup/android-AthenaXAILibrary) is the Android version of this library

## Requirements

1. Software Requirements:

    i. Xcode: 12 or later.
    ii. iOS deployment Target: 16.0 or later.
    iii. Athena Access Token
    iv. Athena Website Token
    v. Base URL

## Latest Release

AthenaXAI is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:
 
    pod 'AthenaXAI'

## Installation
    
Follow the steps to integrate Cocoa-Pod in the Xcode project or [Refer CocoaPods Getting Started guide]:

1. Open the terminal and change directory to your project folder, and create and initialize Podfile using the commands below.

```'$ cd ./project_folder_path```

    - If pod not installed, run the below command
    ```$ sudo gem install cocoapods```

2. Initilize project
```$pod init```

    - this will create a folder and required files in the project directory

3. Open the Podfile created and add the package to the target section in the pod file.

```
platform :ios, '14.0'

target 'MyApp' do
#Pods for MyApp
    pod 'AthenaXAI'
end
```

4. Go back to the terminal and Run the command in your project directory to complete the SDK installation with Cocoapods.
```$pod install```

5. Open <<projectname>>.xcworkspace and build. This way, you can get the benefit of the pod and its installed packages.

6. Add import AthenaXAI in swift to get started.

7. Initialize AthenaXAI

let athenaService = AthenaXAI(baseUrl: yourBaseURL, accessToken: yourAccessToken, token: yourWebsiteToken)

## Author

nemanjacvetkovic-syncit, nemanja.cvetkovic@syncitgroup.com

## License

Copyright 2024 Syncit Group

AthenaXAI is available under the MIT license. See the LICENSE file for more info.
