<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/Scripting/EmptyPHPWebPage.php to edit this template
-->
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tradico</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        header {
            background-color: #5C4033;
            color: #FFFBF0;
            padding: 1px;
            text-align: center;
        }

        nav {
            background-color: #FFFBF0;
            padding: 10px;
        }

        nav a {
            color: #000000;
            text-decoration: none;
            padding: 10px;
            margin: 0 10px;
        }

        section {
            padding: 20px;
        }
        .container {
    width: 500px;
    margin: 0 auto;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 5px;
}

h1 {
    text-align: center;
    margin-bottom: 20px;
}

label {
    display: block;
    margin-bottom: 5px;
}

input {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 3px;
}

.buttons {
    text-align: center;
    margin-top: 20px;
}

button {
    padding: 10px 20px;
    border: 1px solid #ddd;
    border-radius: 3px;
    margin: 5px;
    cursor: pointer;
}

.error {
    color: red;
    margin-bottom: 10px;
}

        footer {
            background-color: #FFFBF0;
            color: #000000;
            text-align: center;
            padding: 10px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>

    <header>
        <h1>Welcome to Tradico</h1>
    </header>

    <nav>
        <a href="homedraft.php">Home</a>
        <a href="upload_products.php">Sell</a>
        <a href="product.php">Shop</a>
        <a href="signup.php">Register</a>
        <a href="signin.php">Log In</a>
        <a href="aboutus.php">About Us</a>
    </nav>
    <section>
       <?php

$error = "";
$user_name = $_POST["user_name"];
    $first_name = $_POST["first_name"];
    $last_name = $_POST["last_name"];
    $email = $_POST["email"];
    $password = $_POST["password"];
    $confirm_password = $_POST["confirm_password"];
    $city = $_POST["city"];
   $street = $_POST["street"];
    $building = $_POST["building"];
    $apartment = $_POST["apartment"];

    if ($password != $confirm_password) {
        $error = "Password and Confirm Password do not match.";
    }
  $conn = mysqli_connect("localhost", "root", "", "tradico");
$sql = "INSERT INTO `customer` (`UserName`, `FirstName`, `LastName`, `Email`, `Password`, `Street`  ,`City`, `Building`, `Apartment`)
VALUES ('$user_name', '$first_name', ' $last_name', '$email', '$password','$street','$city', '$building', '$apartment')";
$result = mysqli_query($conn, $sql);
if($result==FALSE)
echo "<h1>Error. $user_name was not added</h1>";
else
echo "<h1>$user_name was successfully added</h1>";
?>
            </section>
    <footer>
        &copy; <?php echo date('Y'); ?> Tradico Website. All rights reserved.
    </footer>

</body>
</html>
