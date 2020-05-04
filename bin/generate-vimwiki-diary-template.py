#!/usr/bin/python
import sys
import datetime

template = """# {date}

- pomodoro
- stay up (2 x 30min)
- 2 x 10 pups
- read 3 pockets (go,vim,arch)
- code read (1 per week)

# Day

08:30: Arrive
11:00:
11:30: Lunch @
12:00:
17:30: Leave
--
"""

date = (datetime.date.today() if len(sys.argv) < 2
        # Expecting filename in YYYY-MM-DD.foo format
        else sys.argv[1].rsplit(".", 1)[0])
print(template.format(date=date))
