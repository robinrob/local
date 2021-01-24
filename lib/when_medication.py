#!/usr/bin/env python3

from datetime import datetime
from datetime import timedelta

now = datetime.now()

medrc = open("/Users/robin/.medicationrc")

med_date_str = medrc.readline().strip()

med_date = datetime.strptime(med_date_str, "%Y-%m-%d %H:%M:%S")

time_since = datetime.now() - med_date

expected_delta = timedelta(hours=12)

if time_since > expected_delta:
    time_overdue = time_since - expected_delta
    print('OVERDUE BY: %s :(' % time_overdue)
else:
    time_remaining = expected_delta - time_since
    print('TIME TO GO: %s :)' % time_remaining)
