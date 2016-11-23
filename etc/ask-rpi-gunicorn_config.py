CONFIG = {
    'mode': 'wsgi',
    'working_dir': '/path/to/my/app',
    'python': '/usr/bin/python3',
    'args': (
        '--bind=0.0.0.0:8000',
        #'--workers=16',
        #'--timeout=60',
        'app.module',
    ),
}