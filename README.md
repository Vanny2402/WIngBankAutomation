# README

### Introduction

    Wing Bank Mobile Automate is building useful for running automation testing existing services and checking UI on Wing Bank Mobile App.

### Installation

* [Python](https://www.python.org/downloads/) [3.6.5 up](https://www.python.org/downloads/)
* [NodeJS](https://nodejs.org/en/download)
* [Java JDK](https://www.oracle.com/java/technologies/javase/jdk11-archive-downloads.html)
* [Android Studio](https://developer.android.com/studio?gclid=CjwKCAjwhJukBhBPEiwAniIcNSU2DEw4a6xB69Z3a-GAkNvxzJ5dxeZu89iS4BQ_FD4qME_LtsO_-BoCMjoQAvD_BwE&gclsrc=aw.ds)
  If you already have [Python](http://python.org/) with [pip](https://pip.pypa.io/) installed, you can simply run:
  * ``pip install poetry``
  * ``npm install -g appium``
  * ` pip install robotframework`
  * ``npm install -g appium-doctor``

### Set up environment variables

* JAVA_HOME :		C:\Program Files\Java\jdk-1.8
* ANDROID_HOME : 	C:\Users\username\AppData\Local\Programs\android-sdk
* PATH:
  * C:\Program Files\Java\jdk-1.8\bin
  * C:\Users\sokpheak.seng\AppData\Local\Programs\Python\Python311\
  * C:\Users\sokpheak.seng\AppData\Local\Programs\Python\Python311\Scripts\
  * C:\Users\sokpheak.seng\AppData\Roaming\npm
  * C:\Users\sokpheak.seng\AppData\Roaming\npm\node_modules
  * C:\Users\sokpheak.seng\AppData\Roaming\npm\node_modules\appium
  * C:\Users\sokpheak.seng\AppData\Roaming\npm\node_modules\appium\scripts
  * C:\Users\sokpheak.seng\AppData\Roaming\npm\node_modules\appium-doctor
  * C:\Users\username\AppData\Local\Programs\android-sdk\tools
  * C:\Users\username\AppData\Local\Programs\android-sdk\tools\bin
  * C:\Users\username\AppData\Local\Programs\android-sdk\build-tools;
  * C:\Users\username\AppData\Local\Programs\android-sdk\platforms;
  * C:\Users\username\AppData\Local\Programs\android-sdk\platform-tools;

### Editor

* [PyCham](https://www.jetbrains.com/pycharm/download/#section=windows)
* [VS Code](https://code.visualstudio.com/download)
* [IntelliJ IDEA](https://www.jetbrains.com/idea/download/#section=windows)

### Running Script ?

* Go to project directory
* Open Terminal
* Run: poetry install
* Select Interpreter: Hold press: Shift + Ctrl + P => C:\Users\\[ User Name ]\AppData\Local\pypoetry\Cache\virtualenvs\wingbank-mobile-4AmKvypC-py3.11\Scripts\python.exe
* Type: poetry run [testcase name]
* OR:  D:\> [path of project] > robot -d results testcase.robot


New test