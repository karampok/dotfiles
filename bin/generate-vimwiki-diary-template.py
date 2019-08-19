#!/usr/bin/python
import sys
import datetime

template = """# {date}

## Daily checklist

* [ ] Take your vitamins
* [ ] Drink water

## Todo(ne)

* [ ] Make the todos for tomorrow

## For another day (tomorrow)

* [ ] Todo 1

## Notes"""

date = (datetime.date.today() if len(sys.argv) < 2
        # Expecting filename in YYYY-MM-DD.foo format
        else sys.argv[1].rsplit(".", 1)[0])
print(template.format(date=date))
