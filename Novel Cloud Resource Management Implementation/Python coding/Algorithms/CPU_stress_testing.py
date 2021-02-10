from multiprocessing import Process, Lock
from time import sleep
import random
import schedule

operation_value = 64000
cycle_value = 87
def f(l, i):
    l.acquire()
    print('worker ', i)
    x = 0
    while x < operation_value:
        a= random.random()
        b = x * a
        print(b)
        x += 1
    l.release()
    sleep(0.8)



if __name__ == '__main__':
    while True:
        lock = Lock()
        for num in range(cycle_value): # approximately 5 minutes to complete the loop
            action_process = Process(target=f, args=(lock, num))
            action_process.start()
            sleep(0.5)
        
        action_process.terminate()
        sleep(300)
