# BookingClone
Booking is a web application that simulates a booking website for hotels

- Admin side
    - Admin can control hotels in system 
    - Admin can cancel reservations
    - admin can register new admins 
    - Admin can view clients' reviews
- Client Side
    - client can register using `Email` and `username`
    - client can search for hotels rooms
    - client can make a reservation to a room
    - client can search with check in and check out
    - client can search with location
    - client can edit his profile
    - client can review a hotel
    - client can cancel his reservation

### Main functionalities
#### client Functionalities
- User registration 
  - User must provide `Email` and `username`. 
  - User must check reCaptcha to avoid spam.
  - using Ajax to validate Email and username.
  - If `Email` and `Username` provided passes verification, an Email is sent to the Email provided with random generated password to Login with.
  - Admins only can register new Admins.
- login
  - User provide Email and password.
  - using Ajax to validate `Email` and `Password` provided passes verification.
  - if User is authenticated, application redirect them to their `Home` page.
- search for hotels
- book a hotel room
- Add Hotel review
- Edit his profile
### Admin Functionalities
- Register new Admins
- Add new Hotels to website
- Check clients' reviews for hotels
- Update Hotels' data

### Built With
1. Java servlets
2. Javascript
3. JSP

### Authors
1. [Ali Gad](https://github.com/aligad1999)
2. [Abdulelah Adam]()
3. [Mahmoud Yossry]()
