import os.path

BASE_DIR = os.path.abspath(__file__)
print(BASE_DIR)
BASE_DIR = os.path.dirname(BASE_DIR)
print(BASE_DIR)
BASE_DIR = os.path.dirname(BASE_DIR)
print(BASE_DIR)

TEMPLATE_DIRS = BASE_DIR + '/templates'
print(TEMPLATE_DIRS)
STATIC_ROOT = BASE_DIR + '/static'
print(STATIC_ROOT)