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

button{
  width: 200px;
  padding: 15px 0;
text-align: center;
margin: 20px 10px;
border-radius: 25px;
font-weight: bold;
border: 2px solid #5C4033;
background: transparent;
color: black;
cursor: pointer;
position: relative;
overflow: hidden;
}
span{
  background: #FAF9F6;
height: 100%;
width: 0;
border-radius: 25px;
position: absolute;
left: 0;
bottom: 0;
z-index: -1;
transition: 0.5s;
}
button:hover span{
  width: 100%;
  border: none;
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
        <a href="home.php">Home</a>
        <a href="upload_products.php">Sell</a>
        <a href="product.php">Shop</a>
        <a href="signup.php">Register</a>
        <a href="signin.php">Log In</a>
        <a href="aboutus.php">About Us</a>
    </nav>
        <form action="shop.php" method="post">
            <div class="container">
            <section>
            <h3>Please enter your product details:</h3>
            <table cellpadding="5">
                <tr><th>Product Name</th><td><input type="Text" name="prod_name"></td></tr>
                <tr><th>Product Description</th><td><input type="Text" name="prod_desc"></td></tr>
                <tr><th>Product Price</th><td><input type="Text" name="prod_price"></td></tr>
                <tr><th>Product Image</th><td><input type="file" name="prod_img"></td></tr>
                <tr><th>Product Category</th><td><select name="category">
        <?php
        $conn= mysqli_connect("localhost","root","","tradico");
        $sql="select `category_id`, `category_name` from category";
                $result= mysqli_query($conn, $sql);
                while ($row= mysqli_fetch_array($result))
                {        
                echo "<option value=$row[0]>$row[1] </option>";}
     
        ?>
                            
                        </select></td></tr>
                        <tr><td><input type=submit></td></tr>
            </table>
            </section>
            </div>
        </form>
        
    <footer>
        &copy; <?php echo date('Y'); ?> Tradico Website. All rights reserved.
    </footer>

    </body>
</html>
