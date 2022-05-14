The code is divided into 2 parts:

### Mobile App
The Cross platform Mobile App written in Flutter. Make sure you have flutter installed.<br/>
We recommend using android studio for developing.<br/><br/>
Download the flutter packages
```
flutter pub get
```
Run the App using the emulator (works on both Android or IOS).
<br/>
### Raspberry Pi Code
The Raspberry Pi code that contains the web server (Written in python Flask) that will work as an API between flutter and the raspberry pi.<br/><br/>
Add the flask.py file to your Raspberry Pi.<br/><br/>
Open the console on the Raspberry Pi and run:
```
python flask.py
```
