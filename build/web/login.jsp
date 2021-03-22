<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" >
        <title>Hotel Reservation System</title>
        <link rel="stylesheet" href="css/signup.css">
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>

    </head>

    <body>

        <div class="grid">

            <div id="signup">

                <h2><span class="fontawesome-lock"></span>Login</h2>

                <form action="LoginServlet" method="POST">

                    <fieldset>

                        <p><label for="email">E-mail</label></p>
                        <p><input type="email" id="email" name="email" placeholder="mail@address.com"></p>

                        <p><label for="password">Password</label></p>
                        <p><input type="password" id="password" name="password" placeholder="password"></p>
                        <div class="g-recaptcha" data-sitekey="6LcMCy4aAAAAAOWLsEQsXYCgSaJqbaBzzQdgrFIj"></div>
                        <p><input type="submit" value="Login" name="login"></p>

                        <p>Don't have an account <a href="index.jsp">Sign Up</a></p>

                    </fieldset>

                </form>

            </div> <!-- end signup -->

        </div>
        <script>
            window.onload = function () {
                var recaptcha = document.forms["myForm"]["g-recaptcha-response"];
                recaptcha.required = true;
                recaptcha.oninvalid = function (e) {
                    // do something
                    alert("Please complete the captcha");
                }
            }
        </script>
    </body>
</html>