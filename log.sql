-- Keep a log of any SQL queries you execute as you solve the mystery.

SELECT description FROM crime_scene_reports
WHERE year = 2021;
Theft of the CS50 duck took place at 10:15am at the Humphrey Street bakery.
Interviews were conducted today with three witnesses who were present at the time,
each of their interview transcripts mentions the bakery.

SELECT transcript FROM interviews
WHERE year = 2021 AND day = 28;
Sometime within ten minutes of the theft, I saw the thief get into a car in the bakery parking lot and drive away.
If you have security footage from the bakery parking lot, you might want to look for cars that left the parking lot in that time frame.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |

I don't know the thief's name, but it was someone I recognized. Earlier this morning, before I arrived at Emma's bakery,
I was walking by the ATM on Leggett Street and saw the thief there withdrawing some money.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |

As the thief was leaving the bakery, they called someone who talked to them for less than a minute.
In the call, I heard the thief say that they were planning to take the earliest flight out of Fiftyville tomorrow.
The thief then asked the person on the other end of the phone to purchase the flight ticket.

SELECT license_plate FROM bakery_security_logs
WHERE year = 2021 AND month = 7 AND day = 28 AND hour = 10 AND minute > 15;
+---------------+
| license_plate |
+---------------+
| 5P2BI95       |
| 94KL13X       |
| 6P58WS2       |
| 4328GD8       |
| G412CB7       |
| L93JTIZ       |
| 322W7JE       |
| 0NTHK55       |
| 1106N58       |
| NRYN856       |
| WD5M8I6       |
| V47T75I       |

SELECT caller, receiver FROM phone_calls
WHERE duration < 60;

SELECT caller, receiver, name FROM phone_calls
JOIN people ON phone_calls.caller = people.phone_number
WHERE duration < 60;
+----------------+----------------+
|     caller     |    receiver    |
+----------------+----------------+
| (398) 555-1013 | (006) 555-0505 |
| (492) 555-5484 | (406) 555-4440 |
| (286) 555-0131 | (056) 555-0309 |
| (984) 555-5921 | (826) 555-1652 |
| (343) 555-0167 | (973) 555-3809 |
| (751) 555-6567 | (826) 555-1652 |
| (558) 555-9741 | (738) 555-2050 |
| (337) 555-9411 | (568) 555-3190 |
| (452) 555-8550 | (994) 555-3373 |
| (375) 555-8161 | (211) 555-3762 |
| (505) 555-5698 | (027) 555-1068 |
| (380) 555-4380 | (037) 555-8455 |
| (891) 555-5672 | (869) 555-6696 |
| (801) 555-8906 | (450) 555-8297 |
| (789) 555-8833 | (960) 555-2044 |
| (130) 555-0289 | (996) 555-8899 |
| (499) 555-9472 | (892) 555-8872 |
| (367) 555-5533 | (375) 555-8161 |
| (499) 555-9472 | (717) 555-1342 |
| (286) 555-6063 | (676) 555-6554 |
| (770) 555-1861 | (725) 555-3243 |
| (031) 555-6622 | (910) 555-3251 |
| (826) 555-1652 | (066) 555-9701 |
| (338) 555-6650 | (704) 555-2131 |
| (558) 555-9741 | (801) 555-9266 |
| (211) 555-3762 | (956) 555-1395 |
| (547) 555-8781 | (337) 555-9411 |
| (344) 555-9601 | (340) 555-8872 |
| (910) 555-3251 | (579) 555-5030 |
| (831) 555-0973 | (033) 555-9033 |
| (901) 555-8732 | (487) 555-5865 |
| (455) 555-5315 | (234) 555-1294 |
| (007) 555-2874 | (956) 555-1395 |
| (367) 555-5533 | (455) 555-5315 |
| (337) 555-9411 | (060) 555-2489 |
| (033) 555-9033 | (293) 555-1469 |
| (973) 555-3809 | (959) 555-4871 |
| (356) 555-6641 | (558) 555-9741 |
| (676) 555-6554 | (608) 555-9302 |
+----------------+----------------+

SELECT account_number FROM atm_transactions
WHERE atm_location = 'Leggett Street' AND year = 2021 AND month = 7 AND day = 28 AND transaction_type = 'withdraw';
+----------------+
| account_number |
+----------------+
| 28500762       |
| 28296815       |
| 76054385       |
| 49610011       |
| 16153065       |
| 25506511       |
| 81061156       |
| 26013199       |
+----------------+

SELECT * FROM flights
WHERE year = 2021 AND month = 7 AND day = 29 AND hour < 9;
+----+-------------------+------------------------+------+-------+-----+------+--------+
| id | origin_airport_id | destination_airport_id | year | month | day | hour | minute |
+----+-------------------+------------------------+------+-------+-----+------+--------+
| 36 | 8                 | 4                      | 2021 | 7     | 29  | 8    | 20     |
+----+-------------------+------------------------+------+-------+-----+------+--------+

SELECT full_name FROM airports
WHERE id = 8;
+-----------------------------+
|          full_name          |
+-----------------------------+
| Fiftyville Regional Airport |
+-----------------------------+

SELECT full_name FROM airports
WHERE id = 4;
+-------------------+
|     full_name     |
+-------------------+
| LaGuardia Airport |
+-------------------+

SELECT city FROM airports
WHERE id = 4;
+---------------+
|     city      |
+---------------+
| New York City |
+---------------+

Find person name by license plate number.
SELECT * FROM people
JOIN bakery_security_logs ON people.license_plate = bakery_security_logs.license_plate
WHERE year = 2021 AND month = 7 AND day = 28 AND hour = 10 AND minute > 15 AND minute < 25;
+--------+---------+----------------+-----------------+---------------+-----+------+-------+-----+------+--------+----------+---------------+
|   id   |  name   |  phone_number  | passport_number | license_plate | id  | year | month | day | hour | minute | activity | license_plate |
+--------+---------+----------------+-----------------+---------------+-----+------+-------+-----+------+--------+----------+---------------+
| 221103 | Vanessa | (725) 555-4692 | 2963008352      | 5P2BI95       | 260 | 2021 | 7     | 28  | 10   | 16     | exit     | 5P2BI95       |
| 686048 | Bruce   | (367) 555-5533 | 5773159633      | 94KL13X       | 261 | 2021 | 7     | 28  | 10   | 18     | exit     | 94KL13X       |
| 243696 | Barry   | (301) 555-4174 | 7526138472      | 6P58WS2       | 262 | 2021 | 7     | 28  | 10   | 18     | exit     | 6P58WS2       |
| 467400 | Luca    | (389) 555-5198 | 8496433585      | 4328GD8       | 263 | 2021 | 7     | 28  | 10   | 19     | exit     | 4328GD8       |
| 398010 | Sofia   | (130) 555-0289 | 1695452385      | G412CB7       | 264 | 2021 | 7     | 28  | 10   | 20     | exit     | G412CB7       |
| 396669 | Iman    | (829) 555-5269 | 7049073643      | L93JTIZ       | 265 | 2021 | 7     | 28  | 10   | 21     | exit     | L93JTIZ       |
| 514354 | Diana   | (770) 555-1861 | 3592750733      | 322W7JE       | 266 | 2021 | 7     | 28  | 10   | 23     | exit     | 322W7JE       |
| 560886 | Kelsey  | (499) 555-9472 | 8294398571      | 0NTHK55       | 267 | 2021 | 7     | 28  | 10   | 23     | exit     | 0NTHK55       |
+--------+---------+----------------+-----------------+---------------+-----+------+-------+-----+------+--------+----------+---------------+

SELECT * FROM passengers
JOIN people ON passengers.passport_number = people.passport_number
WHERE flight_id = 36;
+-----------+-----------------+------+--------+--------+----------------+-----------------+---------------+
| flight_id | passport_number | seat |   id   |  name  |  phone_number  | passport_number | license_plate |
+-----------+-----------------+------+--------+--------+----------------+-----------------+---------------+
| 36        | 7214083635      | 2A   | 953679 | Doris  | (066) 555-9701 | 7214083635      | M51FA04       |
| 36        | 1695452385      | 3B   | 398010 | Sofia  | (130) 555-0289 | 1695452385      | G412CB7       |
| 36        | 5773159633      | 4A   | 686048 | Bruce  | (367) 555-5533 | 5773159633      | 94KL13X       |
| 36        | 1540955065      | 5C   | 651714 | Edward | (328) 555-1152 | 1540955065      | 130LD9Z       |
| 36        | 8294398571      | 6C   | 560886 | Kelsey | (499) 555-9472 | 8294398571      | 0NTHK55       |
| 36        | 1988161715      | 6D   | 449774 | Taylor | (286) 555-6063 | 1988161715      | 1106N58       |
| 36        | 9878712108      | 7A   | 395717 | Kenny  | (826) 555-1652 | 9878712108      | 30G67EN       |
| 36        | 8496433585      | 7B   | 467400 | Luca   | (389) 555-5198 | 8496433585      | 4328GD8       |
+-----------+-----------------+------+--------+--------+----------------+-----------------+---------------+

Either Bruce, Sofia or Kelsey.

SELECT name FROM atm_transactions
JOIN bank_accounts ON atm_transactions.account_number = bank_accounts.account_number
JOIN people ON bank_accounts.person_id = people.id
WHERE atm_location = 'Leggett Street' AND year = 2021 AND month = 7 AND day = 28 AND transaction_type = 'withdraw';
+---------+
|  name   |
+---------+
| Bruce   |
| Diana   |
| Brooke  |
| Kenny   |
| Iman    |
| Luca    |
| Taylor  |
| Benista |

SELECT caller, receiver, name FROM phone_calls
JOIN people ON phone_calls.caller = people.phone_number
WHERE duration < 60 AND year = 2021 AND month = 7 AND day = 28;
+----------------+----------------+---------+
|     caller     |    receiver    |  name   |
+----------------+----------------+---------+
| (130) 555-0289 | (996) 555-8899 | Sofia   |
| (499) 555-9472 | (892) 555-8872 | Kelsey  |
| (367) 555-5533 | (375) 555-8161 | Bruce   |
| (499) 555-9472 | (717) 555-1342 | Kelsey  |
| (286) 555-6063 | (676) 555-6554 | Taylor  |
| (770) 555-1861 | (725) 555-3243 | Diana   |
| (031) 555-6622 | (910) 555-3251 | Carina  |
| (826) 555-1652 | (066) 555-9701 | Kenny   |
| (338) 555-6650 | (704) 555-2131 | Benista |
+----------------+----------------+---------+
Bruce called (375) 555-8161

SELECT name FROM people
WHERE phone_number = '(375) 555-8161';
+-------+
| name  |
+-------+
| Robin |
+-------+
