import time
import pyfirmata
import matplotlib.pyplot as plt
board = pyfirmata.Arduino('COM3')
it = pyfirmata.util.Iterator(board)
it.start()

QA1input = board.get_pin('a:0:i')
HVinput = board.get_pin('a:2:i')
QSHinput = board.get_pin('a:1:i')
QSHcontrol = board.get_pin('d:3:p')
HVcontrol = board.get_pin('d:6:p')

while True:
    try:
        HVset = float(input("Input the desired HV value (0-10K)\n"))
        
    except ValueError:
        continue
    else:
        break

if HVset > 0 and HVset < 10000:
    HVset =((HVset / 5000) + .04 * (HVset/5000))  # converts user input into 0 - 1 scale + error
else:
    print('You must choose a number between 0 and 10K')
QSHset = 0.11

QSHcontrol.write(float(QSHset))
HVcontrol.write(float(HVset))
while True:   
    QA1data = []
    QSHdata = []
    HVdata = []
    for i in range (10000):
        time.sleep(2)
        QA1 = float(QA1input.read()) * 5 *  .769 
        QSH = float(QSHinput.read())
        HV = float(HVinput.read()) * 10000
        print("%.2f" % QA1 + ',' + str(QSH) + ',' + str(HV))
    
        QA1data.append(QA1)
        QSHdata.append(QSH)
        HVdata.append(HV)
    break
# plt.figure(1)
# plt.subplot(131)
# plt.title('Aerosol Flow Rate vs. Time')
# plt.xlabel('Time (seconds)')
# plt.ylabel('Aerosol Flow Rate (lpm)')
# plt.plot(QA1data)
# plt.subplot(131)
# plt.figure(2)
# plt.title('Sheath Flow Rate vs. Time')
# plt.xlabel('Time (seconds)')
# plt.ylabel('Sheath Flow Rate (lpm)')
# plt.plot(QSHdata)
# plt.figure(3)
plt.subplot(131)
plt.title('High Voltage vs. Time')
plt.xlabel('Time (seconds)')
plt.ylabel('High Voltage (V)')
plt.plot(HVdata)
plt.show()






# for i in range(1):
    
# #     print(HVset)
# ser = serial.Serial('COM5', 115200)
# #     #ial= serial.Serial('COM1',115200)
# time.sleep(2)
# #     # Read and record the data
# QA1data = []
# QSHdata = []
# HVdata = []                        # empty list to store the data
# for i in range(10):
#      b = ser.readline()         # read a byte string
#          #c = ial.readline()
#      string_n1 = b.decode()  # decode byte string into Unicode
#          #string_n2 = c.decode()
#      string = string_n1.rstrip()
#          # string2= string_n2.rstrip() # remove \n and \r
#      string = string.split(",")
#      print(string)
#      #QA1data.append(float(string[0]))           # add to the end of data list
#      time.sleep(0.1)
# #rint(QA1data)
# #plt.plot(QA1data)
# #plt.xlabel('Time (seconds)')
# #plt.ylabel('Aerosol Flow Rate')
# #plt.title('Aerosol Flow Rate vs. Time')
# #plt.show()            # wait (sleep) 0.1 seconds

# ser.close()
