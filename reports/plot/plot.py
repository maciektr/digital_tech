from scipy import signal 
import matplotlib.pyplot as plt
import numpy as np


t = np.linspace(0, 1, 500, endpoint=False)
plt.figure()
clk = signal.square(np.pi * 5 * t)
pwm = signal.square(2 * np.pi * 5 * t)

plt.subplot(2, 1, 1)
plt.plot(t, clk)
plt.subplot(2, 1, 2)
plt.plot(t, pwm)
plt.ylim(-1.5, 1.5)
plt.show()