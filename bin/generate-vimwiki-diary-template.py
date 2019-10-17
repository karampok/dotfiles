#!/usr/bin/python
import sys
import datetime

template = """# {date}

## Daily Journal

* arrive at 08:30

* lunch at ...

* leave at 17:45


[TODO](TODO)


"""

date = (datetime.date.today() if len(sys.argv) < 2
        # Expecting filename in YYYY-MM-DD.foo format
        else sys.argv[1].rsplit(".", 1)[0])
print(template.format(date=date))
