CONFIG = {
    'mode': 'wsgi',
    'chdir': '/home/pi/stepic_web_project/web',
    'python': '/usr/bin/python3',
    'args': (
        '--bind=0.0.0.0:8080',
        #--workers=16',
        #'--timeout=60',
        'hello:wsgi_application',
    ),
}
