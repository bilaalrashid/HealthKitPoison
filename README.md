#  HealthKitPoison

A quick proof-of-concept that demonstrates spoofing authentic data in HealthKit.

## Overview

The app generates spoof step count and heart rate data. It uses a series of personas describing different levels of activity throughout the day, with various different activity personas for weekdays, weekends and anomalous/illness days. No two generated days will be alike.

Note: This is a quick proof-of-concept. This is not an example of what production-ready code should look like.

## Mitigations

Two main (but ineffective) options exist to detect inauthentic data:
- Analysis the raw data through a model and compare it to known data that has been authentically created
- Check the name and/or bundle identifier of the source

Neither of these methods are particularly effective. An app's display name and bundle identifier can be spoofed to anything (excluding intervention from App Store review for production apps), and it is possible to create health data that could evade validation. 

The only foolproof mitigation would be to avoid trusting any data stored in HealthKit.
