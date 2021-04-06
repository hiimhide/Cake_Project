<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Cake_Project.GUI.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
         body {
                margin-top: 20px;padding: 0;
                background: #FFFFFF;
                text-align: justify;
                font-family: "Helvetica Neue", "Lucida Grande", "Segoe UI", Arial, Helvetica, Verdana, sans-serif;
                font-size:  0.875em;
                color: #616161;	/*xám*/
            }

            h1 {
                padding-top: 10px;
                padding-bottom: 50px;
                padding-left: 50px;
                color: #000000;
                font-weight: normal;
                font-size: 2em;
            }

            p {
                font-size: 14px; 
                font-weight: bold;
            }



            /* Menu */

            #menuContaniner {
                width: 500px;
                float: right;
                margin: -60px 0 0 0;
                background-color:#FFFFFF;/* trắng */
            }
            ul.main_nav {
                margin: 0 auto;
                margin-left: -150px;	
                padding: 0;
                list-style: none;
                height: 50px;
            }

            ul.main_nav li {
                border-right: 1px solid #BCBCBC;
                float: left;
                position: relative;
                text-align: center;
                margin: 0;
                padding: 0;
                display: inline;
                height: 45px;
                padding-top: 5px;
            }
            ul.main_nav li a {
                color: #000000;
                width: 100px;
                padding: 10px;
                text-decoration: none;
                display: block;
            }

            /* Content */

            #mainContainer {
                width: 1200px;
                height: 100%;
                margin: 40px auto;
                padding: 20px 5px;
                background: #FFFFFF;
            }
            div.para1 {
                padding-bottom: 0px;
                line-height: 200%;
                padding:50px;
                margin-top : 30px;
                margin-left : 1px;
                margin-bottom : 30px;
                background-color:#f5eacf;
                width:650px;
                height:500px;
            }
            div.para1 h2 {
                color:#000000;
                text-align:left;
                font-size:45px;
                margin:100px;
                line-height:50px;
            }
            div.para1 h3{
                color:#556B2F;
                margin-top:-50px;
            }
            div.para1 p{
                border:1px ridge white;
                text-align:center;
                width:120px; height:50px;
                margin-left:300px;


                background-color:#FFE4C4;
                font-size:17px;

            }
            div.para1 a {
                color: #000000;
                width: 100px;
                padding: 10px;
                text-decoration: none;
                display: block;
            }

            div.para2 {
                margin:1px; 
                display:inline;
            }

            div.boderPara2 {
                margin:15px;
                font-size: 30px;
                font-family: Arial;
            }

            div.boderPara2 a{
                text-decoration : none;
                color: #20B2AA;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div id="header" style="width: 100%; height: 100px; margin: 0 auto; background-color:#FFFFFF; border: none solid #8C0209;">
            <div>
                <h1 style="float:left; margin-left:15px; font-size:50px;">
                    <span style=""><a href="Home.aspx" style="text-decoration: none;color:#f435bc">Nam</a> </span><span style=""><a href="Home.aspx"style="text-decoration: none;color:#000000">Store</a></span>
                </h1>
                
                <p style="float:left;margin-top:80px;font-weight:900;margin-left: 5px;word-spacing: 2px;color:black;font-size:20px;">
                    Baking Store
                </p>
            </div>
        </div>
        </header> 
    <section id="menuContaniner">
            <ul class="main_nav">
                <li ><a  href="Home.aspx" style="color:orange;">Home</a></li>
                <li ><a href="About.aspx" style="color:red;">About </a></li>
                <li ><a  href="Product.aspx"style="color:green;">Product</a></li>
                <li ><a  href="CustomerGUI.aspx" style="color:deeppink;">Customer</a></li>
                <li ><a  href="StaffGUI.aspx" style="color:blueviolet;">Staff</a></li>
            </ul>
        </section>
        <section id="mainContainer">
            <img src="/Images/home1.png" style="width:100%;height:500px;"/>
            <div class="para1">
                <h2><span style="color:#32CD32">CAKES</span> <span style="color:#FFFFFF" >ARE</span> <br/> <span style="color:#FFFFFF">HANDCRAFTED</span> <br/> <span style="color:#FFFFFF" >WITH LOVE.</span></h2>
                <div style="color:#000000">We bake our signature cakes freshly everyday and by orders to make sure that the cake you 
                    would receive is at its best.<br/>Browse our signature products and get your next order at your door now.
                </div>
                <p><a href="About.aspx"> OUR STORY </a></p>
            </div>

            
            <img src="../Images/home5.png" style="float:right;margin-top:-630px;height:600px; width:420px;"/>
            <!-- PARA 2 -->
            <div class="para2">
                <span style="padding-right:25px;">
                <span>
                    <img src="../Images/home2.png"style="width:380px;height:500px;"/>
                </span>
                </span>
                <span style="padding-right:25px;">
                    <img src="../Images/home4.png" style="width:380px;height:500px;"/>
                </span>
                <span>
                    <img src="../Images/home3.png"  style="width:380px;height:500px;"/>
                </span>
            </div>
            <div class="boderPara2">	
                <span style="float:left; padding-left:50px;"><a href="shop">PRODUCT HERE</a></span>
                <span style="float:left; padding-left:180px;"><a href="About.aspx">MORE ABOUT US</a></span>
                <span style="float:right; padding-right:80px;"><a href="edit">MEMBERSHIP</a></span>
            </div>
        </section>
        <footer>
            <div id="footer" style="height: 200px; margin: 0 auto;padding: 0 20px;
             background-color: #D3D3D3; border: none solid #8C0209;">
            <p style="float:left; margin:30px; font-size:60px;"> <span style="color:#DAA520">Nam </span><span style="color:#000000">Store</span>
            </p>
                        <p style="float:right;margin:30px;text-align:left;font-size:15px;margin-right:10px;">
                            <b style="text-align:center;">Our Story</b><br/><br/>
                            <span style="color:#556B2F;">Nam Store is a Hanoi-based bakeshop, which is <br/>
                                known for it’s elegant and delicious selection of <br/>
                                freshly baked sweet treats and beautifully detailed<br/> custom cakes. 
                                Our custom and bakeshop treats are<br/>  
                                baked fresh daily, using only the best ingredients
                            </span>
                            </p>
                            </div>
                            <div  style=" margin: 0 auto;padding: 0 20px; background-color: #D3D3D3; border: none solid #8C0209; text-align:center" >© 2021 by Nam Studio Co. All Rights Reserved.</div>
        </footer>
    </form>
</body>
</html>
