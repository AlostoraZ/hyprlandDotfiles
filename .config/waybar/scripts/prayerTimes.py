#!/usr/bin/env python3
import requests
from datetime import date, datetime

def to_minutes(tstr):
    h, m = map(int, tstr.split(":"))
    return h * 60 + m


def to_string(tmnt):
    h = int(tmnt / 60)
    m = (tmnt % 60)
    if h < 10:
        h = "0" + str(h)
    if m < 10:
        m = "0" + str(m)
    
    return str(h) + ":" + str(m)

baseUrl = "https://api.aladhan.com/v1/timingsByAddress/"

def getPrayerTimes(currentDate, address):
    url = f"{baseUrl}{currentDate}?address={address}&method={method}"
    response = requests.get(url)
    if response.status_code == 200:
        return response.json()
    else:
        print("API error:", response.status_code)
        return None

currentDate = date.today().strftime("%d-%m-%Y")
currentMinutes = to_minutes(datetime.now().strftime("%H:%M"))

address = "Nabarouh,Egypt" # Add your addres in the following format "Dubai,UAE"
method = "5" 
times = getPrayerTimes(currentDate,address)

if times:
    prayers = [
        ("Fajr",    times["data"]["timings"]["Fajr"]),
        ("Shuruq",  times["data"]["timings"]["Sunrise"]),
        ("Dhuhr",   times["data"]["timings"]["Dhuhr"]),
        ("Asr",     times["data"]["timings"]["Asr"]),
        ("Maghrib", times["data"]["timings"]["Maghrib"]),
        ("Isha",    times["data"]["timings"]["Isha"]),
    ]

    # find next prayer
    next_prayer = None
    for name, tstr in prayers:
        if currentMinutes < to_minutes(tstr):
            next_prayer = (name, tstr)
            break

    # if none left → (past Isha), next is Fajr next day
    if not next_prayer:
        next_prayer = ("Fajr", prayers[0][1])

    name, tstr = next_prayer

    tmnt = to_minutes(tstr)
    # if tmnt < 720 and currentMinutes > 720:
    if currentMinutes > tmnt:
        remainingtime = abs(1440 - currentMinutes + tmnt);
    else:
        remainingtime = abs(tmnt - currentMinutes)
    remainingtime = to_string(remainingtime)

    # Convert output to 12h format
    t12 = datetime.strptime(tstr, "%H:%M").strftime("%I:%M")

    # hijriDay = times["data"]["date"]["hijri"]["day"]
    # hijriMonth = times["data"]["date"]["hijri"]["month"]["en"]
    # hijriYear = times["data"]["date"]["hijri"]["year"]
    #
    # hijriDate = hijriDay + "-" + hijriMonth + "-" + hijriYear
    #
    print(f"{name}: {t12} | {remainingtime}")

else:
    print("Error")
