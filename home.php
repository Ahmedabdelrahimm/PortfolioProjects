<!DOCTYPE html>
<html lang="en">
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
            display: flex;
            flex-direction: column;
            min-height: 100vh;
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

        main {
            display: flex;
            flex: 1;
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
.half {
            flex: 1;
            box-sizing: border-box;
            border: 0px;
            padding: 0px;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
            height: 585px;
        }

        .half img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        footer {
            background-color: #FFFBF0;
            color: #000000;
            text-align: center;
            padding: 10px;
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
    <form>
    <main>
        <div class="half">
            <section>
                <h1>Tradico: Trade Smart, Prosper Together!</h1>
                <div>
    <button type="submit" formaction="product.php"> <span></span>Shop Now</button>
  
    <button type="submit" formaction="signup.php"> <span></span>Register Here</button>
  </div>
            </section>
        </div>
        <div class="half">
            <section>
                <img src="home.jpg" alt="alt" width="500" height="700"/>
            </section>
        </div>
    </main>
    </form>
   <footer>
        &copy; <?php echo date('Y'); ?> Tradico Website. All rights reserved.
    </footer>

</body>
</html>
