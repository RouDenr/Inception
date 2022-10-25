import os
import json
import datetime
import mariadb
import sys
from flask import Flask

try:
    conn = mariadb.connect {
            user="decordel",
            password="1",
            host="mariadb:3306",
            port=72,
            database="db_mariasb_inception"
    }
    except mariadb.Error as e:
    print(f"Error connecting to MariaDB Platform: {e}")
    sys.exit(1)


while 1==1:

# Get Cursor
cur = conn.cursor()

