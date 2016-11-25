import multiprocessing

comand = '/usr/bin/gunicorn'
bind = '0.0.0.0:8080'
pythonpath = '/home/pi/stepic_web_project/web'
workers = multiprocessing.cpu_count() * 2 + 1
