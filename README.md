# Sunrise

An automated blinds system using Raspberry PI controlled by an UI-friendly mobile application. This product will help the user be more comfortable in his house by allowing him to close and open his blinds remotely. Furthermore, for more convenience, he will be able to schedule the opening and closing time of his blinds.


## Local Development

The code is divided into 2 parts:

### Mobile App
The Cross platform Mobile App written in Flutter. Make sure you have flutter installed.<br/>
We recommend using android studio for developing.<br/><br/>
Download the flutter packages by running:
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

## Contributing
You are welcome to contribute

Guideline:
1. Fork the repository
2. Clone it
3. Make changes
4. Push your code
5. Create a pull request

If you find a bug, feel free to just open an [Issue](https://github.com/zoghlami-khalil/Sunrise/issues). Make sure you explain how to reproduce it.<br/>
If you have a feature request, post it as an issue and mention that it is a feature request.<br/>
Please try to use the Issue templates when creating an Issue.<br/>

Contributions should be under the terms of the [MIT](/LICENSE) license

## Preview

<img src="https://user-images.githubusercontent.com/76956031/168439515-6d438cf0-0efb-42b1-9f37-c4b9818500a6.PNG" width="200"><img src="https://user-images.githubusercontent.com/76956031/168439520-640a3335-3d01-4e72-bdae-debbbf62539a.PNG" width="200">

## Original developers

The project was originally developed by:
[Khalil Zoghlami](https://github.com/zoghlami-khalil)

## License

This project is licensed under the [MIT](/LICENSE) license.
