# BookingClone
Booking is a web application that simulates a booking website for hotels

- Admin side
    - Admin can control hotels in system 
    - Admin can cancel reservations
    - admin can register new admins 
    - Admin can view clients' reviews and comments
- Client Side
    - Client can register using `Email` and `username`
    - Client can search for hotels rooms
    - Client can make a reservation to a room
    - Client can search with check in and check out
    - Client can search with location
    - Client can edit his profile
    - Client can review a hotel
    - Client can cancel his reservation

### Main functionalities
#### Client Functionalities
- User registration 
  - User must provide `Email` and `username`. 
  - User must check reCaptcha to avoid spam.
  - using Ajax to validate Email and username.
  - If `Email` and `Username` provided passes verification, an Email is sent to the Email provided with random generated password to Login with.
  - Notify client via his mail using SMTP
  - Admins only can register new Admins.
- login
  - User provide Email and password.
  - Using Ajax to validate `Email` and `Password` provided passes verification.
  - if User is authenticated, application redirect them to their `Home` page.
- Search for hotels
- Book a hotel room
- Add Hotel review
- Edit his profile
### Admin Functionalities
- Register new Admins
- Add new Hotels to website
- Check clients' reviews for hotels
- Update Hotels' data
- Notify admin via his mail using SMTP

### Built With
1. Java servlets
2. Javascript
3. JSP

### Authors
1. [Ali Gad](https://github.com/aligad1999)
2. [Abdulelah Adam]()
3. [Mahmoud Yossry]()
