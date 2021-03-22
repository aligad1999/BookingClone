<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" >
        <title>Hotel Reservation System</title>
        <link rel="stylesheet" href="css/signup.css">

    </head>

    <body>

        <div class="grid">

            <div id="signup">

                <h2><span class="fontawesome-lock"></span>Sign Up</h2>
                <!--action="LoginServlet"-->
                <form action="#" method="POST">

                    <fieldset>

                        <p><label for="email">E-mail address</label></p>
                        <p><input type="email" id="email" placeholder="mail@address.com"></p>

                        <p><label for="username">User Name</label></p>
                        <p><input type="username" id="username" placeholder="JohnDoe123"></p>

                        <p><input type="submit" value="Sign Up" name="signup"></p>

                        <p>Already have an account <a href="login.jsp">Sign in</a></p>

                    </fieldset>

                </form>

            </div> <!-- end signup -->

        </div>
    </body>
</html>