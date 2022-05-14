from flask import Flask, request
import datetime
import RPi.GPIO as gpio
import time
from time import sleep, strftime
import threading

gpio.setwarnings(False)
gpio.setmode(gpio.BOARD)    
gpio.setup(7, gpio.OUT)
gpio.setup(11, gpio.OUT)
gpio.setup(13, gpio.OUT)
gpio.setup(15, gpio.OUT)
gpio.output(7, True)
gpio.output(11, True)
gpio.output(13, False)
gpio.output(15, False)
p=gpio.PWM(7,1)
p.start(7)
state=1

app=Flask(__name__)

def open():
    global state
    if state==1:
        print('start opening')
        gpio.output(13, True)
        gpio.output(15, False)
        time.sleep(2)
        gpio.output(13, False)
        gpio.output(15, False)
        print("Opened!")
        state=0

def close():
    global state
    if state==0:
        print("Closing the blinds!")
        gpio.output(13, False)
        gpio.output(15, True)
        time.sleep(2)
        gpio.output(13, False)
        gpio.output(15, False)
        print('closed!')
        state=1

@app.route('/open')
def opening():
    open()
    return "opening window"

@app.route('/close')
def closing():
    close()
    return "closing window"

def check1(o):
    print(o)
    print(strftime("%I:%M %p"))
    while True:
        time=strftime("%I:%M %p")
        if time==o:
            open()
            break

@app.route('/optime',methods=['post','get'])
def openingtime():
    print(request.form['op'])
    t1=threading.Thread(target=check1,args=(request.form['op'],))
    t1.start()
    t1.join()
    return " sched opening window"

def check2(c):
    print(c)
    print(strftime("%I:%M %p"))
    while True:
        time=strftime("%I:%M %p")
        if time==c:
            close()
            break
@app.route('/cltime',methods=['post','get'])
def closingtime():
    print(request.form['cl'])
    t2=threading.Thread(target=check2,args=(request.form['cl'],))
    t2.start()
    t2.join()
    return " schedu closing window"

if __name__=='__main__':
    app.run(debug=True, port=80, host='0.0.0.0')
