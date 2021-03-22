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

                <h2><span class="fontawesome-lock"></span>Login</h2>

                <form action="SearchPage.jsp" method="POST">

                    <fieldset>

                        <p><label for="email">E-mail</label></p>
                        <p><input type="email" id="email" placeholder="mail@address.com"></p>

                        <p><label for="password">Password</label></p>
                        <p><input type="password" id="password" placeholder="password"></p>

                        <p><input type="submit" value="Login" name="login"></p>

                        <p>Don't have an account <a href="index.jsp">Sign Up</a></p>

                    </fieldset>

                </form>

            </div> <!-- end signup -->

        </div>
    </body>
</html>