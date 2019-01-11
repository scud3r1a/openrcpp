## openrcpp
Open Self-Driving RC Car Project Platform

---

![ubuntu](https://img.shields.io/badge/Ubuntu-18.04.1-692242.svg)
![hypriot](https://img.shields.io/badge/HypriotOS-1.9.0-black.svg)
![python](https://img.shields.io/badge/Python-3.6.5-yellow.svg)
![cpp](https://img.shields.io/badge/C++-17-blue.svg)

A more tutorial-like, DIY-focused and well-documented *fork of https://github.com/hamuchiwa/AutoRCCar*.

![rangee](img/rangee.jpg)

---

## Dependencies
### Hardware
- Raspberry Pi version 2 or higher (2B used here)
- Arduino Uno R3
- Raspberry pi compatible camera supporting the `picamera` library (Python)
- HC-SR04 ultrasonic sensors

### Software
- Linux operating system (Ubuntu 18.04.1 used here)
- Arduino IDE and drivers for Arduino Uno R3
- Python 3 via Ana-/MiniConda, `pip`
- C++, `g++`
- `git`

#### Dev environment setup
```
git clone https://github.com/scud3r1a/openrcpp \
&& cd openrcpp \
&& conda create --name openrcpp -y \
&& source activate openrcpp \
&& pip install -r requirements.txt
```
Further dependencies are easily installed via `conda`/`pip` requirements text file.

---

#### Raspberry pi setup
As an operating system, I choose HypriotOS (https://blog.hypriot.com/downloads/) which is
basically a pure CLI version of Raspbian with extra Docker support and some improvements
considering the pre-configuration of the distro. The former goal was the adaption of Docker
for the Raspberry Pi platform. That is now possible via different methologies and software
products which the Hypriot community contributed to. I prefer to flash images to a Micro SD
card using Etcher (https://www.balena.io/etcher/) but other ways are possible.

---

#### RC car choices
In this project I used an RC car from _HSP Himoto_, as did the author of the original article.
Basically, most RC cars should work but it is necessary that the voltage supplied through the
Arduino connectors is high enough to actually trigger RC actions as replacement of the original
batteries. The size of the RC car should at least be _1:24_ of the original size of the car,
preferably bigger. Furthermore, the shape of the car should make it possible that hardware
is placed on top of it (at least the Raspberry Pi with a case).

The exact wiring of the RC module and the Arduino is described under _Modules - openrcpp-control - Wiring_.

---

## Modules
The project is divided into different modules.

---

### openrcpp-control
Controlling the RC module is done by this software module called _control_.
The simple goal is to access the RC emitter through hardware and let the
car receive commands that where previously sent to the controller in real time.

![arduino](img/arduino.jpg)

#### Testing
For keyboard testing, run `keyboard2serial.py`. With the arrow keys, controlling
certain IO pins (digital) on the Arduino board is possible. Therefore, you have
to upload the `serial2rc.ino` routine to the board. In its header, the pins controlled
via the keyboard are defined.

#### Wiring


#### References
- https://www.arduino.cc/en/tutorial/pushbutton

---

### openrcpp-capture
The fast _capture_ application is used to capture pictures of the environment
as a stream in real time. The image series stream has to be pre-processed
for transmission via _streamer_.

---

### openrcpp-lanes
The _lanes_ application subset focuses on lane detection for the car.

---

### openrcpp-sonic
The _sonic_ module is used for ultrasonic sensor data evaluation.

---

### openrcpp-streamer
The _streamer_ is used for a fast and stable transmission of
- captured video frames from the camera
- sensor data
to the workstation where the post-processing is done.

---

### openrcpp-vision
Computer vision and path prediction are done by the _vision_ application subset.
Image processing methods that go beyond eliminating noise or extracting features
for machine learning can be found in separate modules.

![raspi](img/raspi.jpg)
