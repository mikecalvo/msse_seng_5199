Goals:
Mocks

---
# Assignment #1
## sellit.com
### sell it if you got it

---
# Introduction
- Implement an auction system similar to eBay
- Project will be completed in a series of 3 assignments
- The first assignment will focus on the domain and data layer

---
# Deliverables
1. Access to source code repository (preferrably git)
1. Working Grails project on which I can run without error or failure:
  - ./grailsw test-app
  - ./grailsw run-app
  - ./grailsw archive
1. All requirements implemented and tested
  - Specific types of tests (unit, integration or either) will be specified

---
# Account Requirements

---
- To list or bid at sellit.com a person must have an account
- A1: Account must include email, name, password, created date fields (unit)
- A2: Email must be unique (integration)
- A3: Email must have a valid email form (*@*.[com|net|edu...]) (integration)
- A4: Password must be 8-16 characters with at least 1 number and 1 letter (unit)

---
# Listing Requirements

---
- L1: Listings are required to have a name, created date, description, start date/time, number of days and starting bid price (unit)
- L2: Listing requires a delivery options: US Only, Worldwide, Pickup Only (unit)
- L3: Listing requires a seller (unit)
- L4: Start time must be in the future (integration)
- L5: Listing name must be less than 64 characters (integration)
- L6: Listing has an optional collection of images (up to 5) (unit)

---
# Category Requirements

---
- Listings can be placed in categories which help shoppers find them
- C1: A category consists of a name, description, and 0..n child categories (unit)
- C2: The category tree must be saved in a database (integration)
- C3: A listing must have a category to be created (integration)
- C4: A category must exist before a listing is created (cannot be created as part of creating a listing) (integration)

---
# Bidding Requirements

---
- A bid is the intent of specifying a price for which they will pay for an item
- B1: A bid requires a listing, a bidder, and an amount (unit)
- B3: A listing has a list of bids (unit)
- B4: The highest bidder when time expires on a listing is the winner (unit)
- B5: A bid is required to be at least .50 more than the previous bid (integration)
- B6: The first bid may be the same as the original price of a listing (integration)

---
# Review Requirements

---
- The seller and buyer can each be reviewed by each other after a listing has closed
- R1: A review consists of a description (required, max of 60 character) (integration)
- R2: A review consists of a thumbs up or thumbs down (unit)
- R3: A review has a timestamp of when the review was given (integration)
- R4: A listing will track if buyer and seller were prompted to provide a review (integration)
