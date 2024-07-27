<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Us</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="b.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <style>
        body {
            padding-top: 70px;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
             background: url('https://cdn.prod.website-files.com/65cfc8641cecc667c97dc5dc/661d49dd4fa72f3790ba9177_contactus.jpg') no-repeat center center fixed;
            background-size: cover;
        }
        .navbar-brand i {
            margin-right: 10px;
        }
        .container {
            width: 90%;
            max-width: 600px;
            background-color: #fff;
            padding: 30px;
            margin: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: 600;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin: 10px 0 5px;
            color: #555;
            font-weight: 600;
        }
        input[type="text"],
        input[type="email"],
        textarea {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
        }
        textarea {
            resize: vertical;
            min-height: 100px;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 12px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }
        .rating {
            display: flex;
            justify-content: center;
            margin: 15px 0;
            position: relative;
        }
        .rating ul {
            margin: 0;
            padding: 0;
            list-style: none;
            display: flex;
        }
        .rating li {
            cursor: pointer;
            position: relative;
            margin: 0 16px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 36px;
            transition: transform 0.3s;
        }
        .rating .current {
            transform: scale(1.2);
        }
        .rating .hover {
            transform: scale(1.2);
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="index.jsp">
                    <i class="glyphicon glyphicon-home"></i> Real-Estate
                </a>
            </div>
            <ul class="nav navbar-nav">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="BuyerLR.jsp">Buyer</a></li>
                <li><a href="AgentLogin.jsp">Agent</a></li>
                <li><a href="SellerLR.jsp">Seller</a></li>
                <li class="active"><a href="contact.jsp">Contact Us</a></li>
            </ul>
        </div>
    </nav>
    <div class="container">
        <h1>Contact Us</h1>
        <form action="contact_us.jsp" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            
            <label for="message">Message:</label>
            <textarea id="message" name="message" required></textarea>

            <label for="rating">Rate Us:</label>
            <nav class="rating">
                <ul>
                    <li>😠</li>
                    <li>😕</li>
                    <li>😐</li>
                    <li>😊</li>
                    <li>😍</li>
                </ul>
                <div>
                    <span></span>
                </div>
            </nav>

            <input type="submit" value="Submit">
        </form>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const emojis = document.querySelectorAll('.rating li');
            const ratingDisplay = document.querySelector('.rating div span');

            emojis.forEach((emoji, index) => {
                emoji.addEventListener('click', () => {
                    updateRating(index + 1);
                });

                emoji.addEventListener('mouseover', () => {
                    highlightEmojis(index + 1);
                });

                emoji.addEventListener('mouseout', () => {
                    highlightEmojis(getCurrentRating());
                });
            });

            function updateRating(rating) {
                emojis.forEach((emoji, index) => {
                    if (index < rating) {
                        emoji.classList.add('current');
                    } else {
                        emoji.classList.remove('current');
                    }
                });
                ratingDisplay.textContent = rating;
            }

            function highlightEmojis(rating) {
                emojis.forEach((emoji, index) => {
                    if (index < rating) {
                        emoji.classList.add('hover');
                    } else {
                        emoji.classList.remove('hover');
                    }
                });
            }

            function getCurrentRating() {
                return document.querySelectorAll('.rating .current').length;
            }
        });
    </script>
</body>
</html>
