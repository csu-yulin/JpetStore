<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wangtianyu
  Date: 2022/11/12
  Time: 11:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Jpet宠物商店</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8" />
    <meta name="keywords" content="宠物商店" font="微软雅黑"/>
    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <!-- Custom Theme files -->
    <link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
    <link href="css/style.css" type="text/css" rel="stylesheet" media="all">
    <!-- banner slider -->
    <link rel="stylesheet" type="text/css" href="css/zoomslider.css" />
    <!--gallery -->
    <link type="text/css" rel="stylesheet" href="css/cm-overlay.css" />
    <!-- //gallery -->
    <script src="js/jquery-2.2.3.min.js"></script>
    <!-- numscroller -->
    <script type="text/javascript" src="js/numscroller-1.0.js"></script>
    <script src="js/bootstrap.js"></script>
    <!-- font-awesome icons -->
    <link href="css/font-awesome.css" rel="stylesheet">
    <!-- //Custom Theme files -->
    <!-- web-fonts -->
    <link href="//fonts.googleapis.com/css?family=Righteous" rel="stylesheet">
    <link href="//fonts.googleapis.com/css?family=Mukta+Mahee:200,300,400,500,600,700,800" rel="stylesheet">
    <!-- //web-fonts -->
</head>

<body>
<!--/banner-bottom-->
<div id="Welcome">
<div id="WelcomeContent"><c:if
        test="${sessionScope.accountBean != null }">
    <c:if test="${sessionScope.accountBean.authenticated}">
        Welcome ${sessionScope.accountBean.account.firstName}!
    </c:if>
</c:if></div>
</div>

<div class="w3_agilits_banner_bootm">
    <!-- header -->
    <div class="container">
        <div class="w3_agile_logo">
            <h1>
                <a href="index.html">
                    <img src="images/logo-topbar.gif" alt="" font="微软雅黑"/>JPet宠物商店</a>
            </h1>
        </div>
        <div class="agileits_w3layouts_nav">
            <div id="toggle_m_nav">
                <div id="m_nav_menu" class="m_nav">
                    <div class="m_nav_ham w3_agileits_ham" id="m_ham_1"></div>
                    <div class="m_nav_ham" id="m_ham_2"></div>
                    <div class="m_nav_ham" id="m_ham_3"></div>
                </div>

            </div>
            <div id="m_nav_container" class="m_nav wthree_bg">
                <nav class="menu menu--sebastian">
                    <ul id="m_nav_list" class="m_nav menu__list">
                        <li class="m_nav_item menu__item menu__item--current" id="m_nav_item_1">
                            <a href="index.html" class="menu__link"> Home </a>
                        </li>
                        <li class="m_nav_item menu__item" id="moble_nav_item_2">
                            <a href="help.html" class="menu__link"> About Us </a>
                        </li>
                        <li class="m_nav_item menu__item" id="moble_nav_item_3">
                            <a href="services.html" class="menu__link">Services</a>
                        </li>
                        <li class="m_nav_item menu__item" id="moble_nav_item_4">
                            <a href="gallery.html" class="menu__link">Gallery</a>
                        </li>
                        <li class="m_nav_item menu__item" id="moble_nav_item_5">
                            <a href="icons.html" class="menu__link">icons</a>
                        </li>
                        <li class="m_nav_item menu__item" id="moble_nav_item_6">
                            <a href="mailto:info@example.com" class="menu__link"> Contact </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
    <!--// header -->
    <div class="w3_agilits_inner_bottom">
        <div class="wthree_agile_login">
            <ul>

                <li>
                    <i class="fa fa-envelope-o list-icon" aria-hidden="true"></i>
                    <a href="mailto:info@example.com">xxx@csu.edu.cn</a>
                </li>
            </ul>
        </div>

    </div>
</div>
<!--//banner-bottom-->
<!--/banner-section-->
<div id="demo-1" data-zs-src='["images/1.jpg","images/2.jpg","images/3.jpg","images/4.jpg","images/5.jpg"]' data-zs-overlay="dots">
    <div class="demo-inner-content">

        <!--/banner-info-->
        <div class="baner-info">
            <h4>快来获得您的第一只 </h4>
            <h3>
                可爱宠物</h3>
            <p>Click and get your first kawaii pet</p>
            <a class="hvr-rectangle-out w3_play_icon1" href="loginForm"> 登录</a>
        </div>
        <!--/banner-ingo-->
    </div>
</div>
<!--/banner-section-->
<!--about -->
<div id="about" class="wthree-about section-w3ls">
    <div class="container">
        <div class="agileits-banner-grids text-center">
            <div class="banner-bottom-girds">
                <div class="services_agile" id="services">
                    <div class="services-top">
                        <div class="col-md-3 col-sm-4 col-xs-4 service_grid text-center">
                            <a href="categoryForm?categoryId=CATS"><div class="serviceinfo_agile ih-item circle colored effect17">
                                <div class="img">
                                    <img src="images/cat1.gif" class="img-responsive" alt="img">
                                </div>
                                <div class="info">
                                    <p>cat</p>
                                </div>
                            </div>
                            </a>
                        </div>
                        <div class="col-md-3 col-sm-4 col-xs-4 service_grid text-center">
                            <a href="categoryForm?categoryId=Dogs"> <div class="serviceinfo_agile ih-item circle colored effect17">
                                <div class="img">
                                    <img src="images/dog1.gif" class="img-responsive" alt="img">
                                </div>
                                <div class="info">
                                    <p>dog</p>
                                </div>
                            </div>
                            </a>
                        </div>
                        <div class="col-md-3 col-sm-4 col-xs-4 service_grid text-center">
                            <a href="categoryForm?categoryId=BIRDS"><div class="serviceinfo_agile ih-item circle colored effect17">
                                <div class="img">
                                    <img src="images/bird1.gif" class="img-responsive" alt="img">
                                </div>
                                <div class="info">
                                    <p>birds</p>
                                </div>
                            </div>
                            </a>
                        </div>
                        <div class="col-md-3 col-sm-4 col-xs-4 service_grid text-center">
                            <a href="categoryForm?categoryId=Fish"><div class="serviceinfo_agile ih-item circle colored effect17">
                                <div class="img">
                                    <img src="images/fish1.gif" class="img-responsive" alt="img">
                                </div>
                                <div class="info">
                                    <p>fish</p>
                                </div>
                            </div>
                            </a>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <h3 class="w3ls-title">
            <span>a</span>bout us</h3>
        <h5>我们致力于</h5>
        <div class="col-md-7  w3ls-about-left">
            <p>您和您宠物的开心</p>
            <p class="about-bottom">CSU宠物商店团队</p>
        </div>
        <div class="col-md-5 w3ls-row">
            <div class="col-md-6 col-sm-6 wthree-about-left">
                <img src="images/cat2.gif" class="img-responsive" alt="" />
            </div>
            <div class="col-md-6 col-sm-6 w3ls-row alert wthree-about-right">
                <img src="images/dog2.gif" class="img-responsive" alt="" />
            </div>
            <div class="clearfix"> </div>
        </div>
        <div class="clearfix"> </div>

    </div>
</div>
<!-- //about -->
<!-- stats -->
<div class="wthree-stats">
    <div class="stats-bg col-md-6">
    </div>
    <div class="col-md-6 stats-info agileits-w3layouts">
        <div class="col-sm-6 col-xs-3 stats-grid">
            <div class='numscroller numscroller-big-bottom' data-slno='1' data-min='0' data-max='2000' data-delay='.5' data-increment="1">70</div>
            <div class="stats-img stat2">
                <p>顾客</p>
            </div>
        </div>
        <div class="col-sm-6 col-xs-3 stats-grid">
            <div class='numscroller numscroller-big-bottom' data-slno='1' data-min='0' data-max='1000' data-delay='.5' data-increment="1">60</div>
            <div class="stats-img stat2">
                <p>营销额</p>
            </div>
        </div>
        <div class="col-sm-6 col-xs-3 stats-grid stat1">
            <div class='numscroller numscroller-big-bottom' data-slno='1' data-min='0' data-max='1000' data-delay='.5' data-increment="1">50</div>
            <div class="stats-img stat2">
                <p>好评</p>
            </div>
        </div>
<%--        <div class="col-sm-6 col-xs-3 stats-grid stat1">--%>
<%--            <div class='numscroller numscroller-big-bottom' data-slno='1' data-min='0' data-max='9999' data-delay='.5' data-increment="1">100</div>--%>
<%--            <div class="stats-img stat2">--%>
<%--                <p>摆烂度</p>--%>
<%--            </div>--%>
<%--        </div>--%>
        <div class="clearfix"></div>
    </div>
    <div class="clearfix"></div>
</div>
<!-- //stats -->
<!-- menu -->
<div class="w3ls-services section-w3ls">
    <div class="container">
        <h3 class="w3ls-title">
            <span>P</span>ets</h3>
        <div class="grid">
            <figure class="col-md-3 col-xs-6 w3l-service-hover">
                <a href="categoryForm?categoryId=CATS"><img src="images/cat1.gif" alt="t1" class="img-responsive" /></a>
                <figcaption>
                    <h4>小猫</h4>
                </figcaption>
            </figure>
            <figure class="col-md-3 col-xs-6  w3l-service-hover s2">
                <a href="categoryForm?categoryId=Dogs"><img src="images/dog1.gif" alt="t2" class="img-responsive" /></a>
                <figcaption>
                    <h4>小狗</h4>
                </figcaption>
            </figure>
            <figure class="col-md-3 col-xs-6 w3l-service-hover s3">
                <a href="categoryForm?categoryId=Fish"><img src="images/fish1.gif" alt="t1" class="img-responsive" /></a>
                <figcaption>
                    <h4>鱼类</h4>
                </figcaption>
            </figure>
            <figure class="col-md-3 col-xs-6 w3l-service-hover s4">
                <a href="categoryForm?categoryId=REPTILES"><img src="images/lizard1.gif" alt="t3" class="img-responsive" /></a>
                <figcaption>
                    <h4>爬行动物</h4>
                </figcaption>
            </figure>
            <div class="clearfix"></div>
            <figure class="col-md-3 col-xs-6  w3l-service-hover s2">
                <a href="categoryForm?categoryId=BIRDS"><img src="images/bird1.gif" alt="t2" class="img-responsive" /></a>
                <figcaption>
                    <h4>鸟类</h4>
                </figcaption>
            </figure>
<%--            <figure class="col-md-3 col-xs-6 w3l-service-hover s4">--%>
<%--                <img src="images/2.jpg" alt="t3" class="img-responsive" />--%>
<%--                <figcaption>--%>
<%--                    <h4>蝾螈</h4>--%>
<%--                </figcaption>--%>
<%--            </figure>--%>


        </div>
    </div>
</div>
<!-- //menu -->
<
<!-- testimonials -->
<div class="testimonials section-w3ls" id="testimonials">
    <div class="container">
        <h3 class="w3ls-title">
            <span>C</span>ustomers</h3>
        <div class="w3_testimonials_grids w3_testimonials_grids">
            <div class="sreen-gallery-cursual">
                <div id="owl-demo" class="owl-carousel">
                    <div class="item-owl">
                        <div class="col-md-3 col-sm-3 col-xs-3 img-agile">
                            <img src="images/s1.jpg" class="img-responsive" alt="" />
                            <h6>小美</h6>
                        </div>
                        <div class="col-md-9 col-sm-9 col-xs-9 test-review test-tooltip1">
                            <p>
                                <i class="fa fa-quote-left" aria-hidden="true"></i> 这里的小猫太牛逼啦，天天抱着我啃
                                <i class="fa fa-quote-right" aria-hidden="true"></i>
                            </p>
                        </div>
                    </div>
                    <div class="item-owl">
                        <div class="col-md-3 col-sm-3 col-xs-3 img-agile">
                            <img src="images/s2.jpg" class="img-responsive" alt="" />
                            <h6>小红</h6>
                        </div>
                        <div class="col-md-9 col-sm-9 col-xs-9 test-review test-tooltip1">
                            <p>
                                <i class="fa fa-quote-left" aria-hidden="true"></i> 这里的狗帮我咬死了3个OP！！
                                <i class="fa fa-quote-right" aria-hidden="true"></i>
                            </p>
                        </div>
                    </div>
                    <div class="item-owl">
                        <div class="col-md-3 col-sm-3 col-xs-3 img-agile">
                            <img src="images/s3.jpg" class="img-responsive" alt="" />
                            <h6>小紫</h6>
                        </div>
                        <div class="col-md-9 col-sm-9 col-xs-9 test-review test-tooltip1">
                            <p>
                                <i class="fa fa-quote-left" aria-hidden="true"></i>这里的鱼眼睛会发出诡异的光
                                <i class="fa fa-quote-right" aria-hidden="true"></i>
                            </p>
                        </div>
                    </div>
                </div>
                <!--//screen-gallery-->
            </div>
        </div>
    </div>
</div>
<!-- //testimonials -->
<!-- footer -->
<div class="agile-footer w3ls-section">
    <div class="container">
        <div class="list-footer">
            <ul class="footer-nav">
                <li>
                    <a href="index.html">Home</a>
                </li>
                <li>
                    <a href="help.html">About</a>
                </li>
                <li>
                    <a href="services.html">Pets</a>
                </li>
                <li>
                    <a href="gallery.html">Gallery</a>
                </li>
                <li>
                    <a href="contact.html">Contact</a>
                </li>
            </ul>
        </div>
        <div class="agileits_w3layouts-footer-bottom">
            <div class="w3_agile-footer-grids">
                <div class="col-md-3  w3_agile-footer1 f1">
                    <h2>
                        <a href="index.html">宠物商店</a>
                    </h2>
                    <h5 class="f1">about us</h5>
                    <p>CSU专业团队</p>
                </div>
                <div class="col-md-6  w3_agile-footer1 f2">
                    <div class="col-md-4 col-sm-4 col-xs-4 inner-li">
                        <h5>宠物</h5>
                        <ul class="w3ls-footer-bottom-list">
                            <li>
                                <a class="page-scroll scroll" href="#about">猫</a>
                            </li>
                            <li>
                                <a class="page-scroll scroll" href="#pricing">狗</a>
                            </li>
                            <li>
                                <a class="page-scroll scroll" href="#gallery">鱼</a>
                            </li>
                            <li>
                                <a class="page-scroll scroll" href="#team">鸟</a>
                            </li>

                        </ul>
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-4 inner-li">
                        <h5>在线购买</h5>
                        <ul class="w3ls-footer-bottom-list">

                        </ul>
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-4 inner-li">
                        <h5>support</h5>
                        <ul class="w3ls-footer-bottom-list">
                            <li>
                                <a href="#">suppport</a>
                            </li>
                            <li>
                                <a href="#">FAQ</a>
                            </li>
                            <li>
                                <a href="#">media</a>
                            </li>
                        </ul>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="col-md-3  w3_agile-footer1 f3">
                    <h5>follow us</h5>
                    <ul class="footer-social-icons">
                        <li>
                            <a href="#">
                                <i class="fa icon1 fa-facebook icons" aria-hidden="true"></i>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fa icon2 fa-twitter icons" aria-hidden="true"></i>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fa icon3 fa-google-plus icons" aria-hidden="true"></i>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fa icon3 fa-linkedin icon4 icons" aria-hidden="true"></i>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="agileits_w3layouts-copyright">
            <p>© Central South University. All Rights Reserved | Design by
                <a href="http://csu.edu.cn/" target="=_blank"> CSU </a>
            </p>
        </div>
    </div>
</div>
<!-- //footer -->
<!-- banner slider -->
<script src="js/modernizr-2.6.2.min.js"></script>
<script src="js/jquery.zoomslider.min.js"></script>
<!-- //banner slider -->
<!-- //gallery -->
<script src="js/jquery.tools.min.js"></script>
<script src="js/jquery.mobile.custom.min.js"></script>
<script src="js/jquery.cm-overlay.js"></script>

<script>
    $(document).ready(function () {
        $('.cm-overlay').cmOverlay();
    });
</script>
<!-- //gallery -->
<!-- testimonials -->
<!-- required-js-files-->
<link href="css/owl.carousel.css" rel="stylesheet">
<script src="js/owl.carousel.js"></script>
<script>
    $(document).ready(function () {
        $("#owl-demo").owlCarousel({
            items: 1,
            lazyLoad: true,
            autoPlay: false,
            navigation: true,
            navigationText: true,
            pagination: true,
        });
    });
</script>
<!--//required-js-files-->
<!-- start-smooth-scrolling -->
<script src="js/move-top.js"></script>
<script src="js/easing.js"></script>
<script>
    jQuery(document).ready(function ($) {
        $(".scroll").click(function (event) {
            event.preventDefault();

            $('html,body').animate({
                scrollTop: $(this.hash).offset().top
            }, 1000);
        });
    });
</script>
<!-- //end-smooth-scrolling -->
<!-- smooth-scrolling-of-move-up -->
<script>
    $(document).ready(function () {

     var defaults = {
         containerID: 'toTop', // fading element id
         containerHoverID: 'toTopHover', // fading element hover id
         scrollSpeed: 1200,
         easingType: 'linear'
     };


        $().UItoTop({
            easingType: 'easeOutQuart'
        });

    });
</script>
<script src="js/SmoothScroll.min.js"></script>
<!-- //smooth-scrolling-of-move-up -->
<!-- navigation  -->
<script src="js/main.js"></script>
<!-- //navigation -->

</body>

</html>
