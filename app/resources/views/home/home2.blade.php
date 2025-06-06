<!DOCTYPE html>
<html lang="en">


<!-- Mirrored from portotheme.com/html/porto_ecommerce/demo42.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 20 Jan 2024 12:53:58 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Porto - Bootstrap eCommerce Template</title>

    <meta name="keywords" content="HTML5 Template" />
    <meta name="description" content="Porto - Bootstrap eCommerce Template">
    <meta name="author" content="SW-THEMES">

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="{{url('/')}}/assets/home/images/icons/favicon.png">
    <link rel="preload" href="{{url('/')}}/assets/home/vendor/fontawesome-free/webfonts/fa-regular-400.woff2" as="font" type="font/woff2"
        crossorigin="anonymous">
    <link rel="preload" href="{{url('/')}}/assets/home/vendor/fontawesome-free/webfonts/fa-solid-900.woff2" as="font" type="font/woff2"
        crossorigin="anonymous">
    <link rel="preload" href="{{url('/')}}/assets/home/vendor/fontawesome-free/webfonts/fa-brands-400.woff2" as="font" type="font/woff2"
        crossorigin="anonymous">

    <script>
        WebFontConfig = {
            google: { families: [ 'Open+Sans:400,600', 'Poppins:400,500,600,700' ] }
        };
        ( function ( d ) {
            var wf = d.createElement( 'script' ), s = d.scripts[ 0 ];
            wf.src = 'assets/js/webfont.js';
            wf.async = true;
            s.parentNode.insertBefore( wf, s );
        } )( document );
    </script>

    <!-- Plugins CSS File -->
    <link rel="stylesheet" href="{{url('/')}}/assets/home/css/bootstrap.min.css">

    <!-- Main CSS File -->
    <link rel="stylesheet" href="{{url('/')}}/assets/home/css/demo42.min.css">
    <link rel="stylesheet" type="text/css" href="{{url('/')}}/assets/home/vendor/fontawesome-free/css/all.min.css">
</head>

<body>
    <div class="page-wrapper">
        <div class="top-notice bg-dark text-white pt-3">
            <div class="container text-center d-flex align-items-center justify-content-center flex-wrap">
                <h4 class="text-uppercase font-weight-bold mr-2">Deal of the week</h4>
                <h6>- 15% OFF in All Performance Parts -</h6>

                <a href="demo42-shop.html" class="ml-2">Shop Now</a>
            </div><!-- End .container -->
        </div><!-- End .top-notice -->

        <header class="header">
            <div class="header-top">
                <div class="container">
                    <div class="header-left d-none d-md-block">
                        <div class="info-box info-box-icon-left text-primary justify-content-start p-0">
                            <i class="icon-shipping"></i>

                            <div class="info-box-content">
                                <h4>FREE Next Day Delivery For Orders $35+</h4>
                            </div><!-- End .info-box-content -->
                        </div>
                    </div><!-- End .header-left -->

                    <div class="header-right header-dropdowns ml-0 ml-md-auto w-md-100">
                        <div class="header-dropdown ">
                            <a href="#">USD</a>
                            <div class="header-menu">
                                <ul>
                                    <li><a href="#">EUR</a></li>
                                    <li><a href="#">USD</a></li>
                                </ul>
                            </div><!-- End .header-menu -->
                        </div><!-- End .header-dropown -->

                        <div class="header-dropdown mr-auto mr-md-0">
                            <a href="#"><i class="flag-us flag"></i>ENG</a>
                            <div class="header-menu">
                                <ul>
                                    <li><a href="#"><i class="flag-us flag mr-2"></i>ENG</a>
                                    </li>
                                    <li><a href="#"><i class="flag-fr flag mr-2"></i>FRA</a></li>
                                </ul>
                            </div><!-- End .header-menu -->
                        </div><!-- End .header-dropown -->

                        <span class="separator d-none d-xl-block"></span>

                        <ul class="top-links mega-menu d-none d-xl-flex mb-0 pr-2">
                            <li class="menu-item menu-item-type-post_type menu-item-object-page narrow">
                                <a href="#"><i class="icon-pin"></i>Our Stores</a></li>
                            <li class="menu-item menu-item-type-custom menu-item-object-custom narrow">
                                <a href="#"><i class="icon-shipping-truck"></i>Track Your Order</a></li>
                            <li class="menu-item menu-item-type-post_type menu-item-object-page narrow">
                                <a href="#"><i class="icon-help-circle"></i>Help</a></li>
                            <li class="menu-item menu-item-type-post_type menu-item-object-page narrow">
                                <a href="#"><i class="icon-wishlist-2"></i>Wishlist</a></li>
                        </ul>

                        <span class="separator d-none d-md-block mr-0 ml-4"></span>

                        <div class="social-icons">
                            <a href="#" class="social-icon social-facebook icon-facebook" target="_blank"
                                title="facebook"></a>
                            <a href="#" class="social-icon social-twitter icon-twitter" target="_blank"
                                title="twitter"></a>
                            <a href="#" class="social-icon social-instagram icon-instagram mr-0" target="_blank"
                                title="instagram"></a>
                        </div><!-- End .social-icons -->
                    </div><!-- End .header-right -->
                </div><!-- End .container -->
            </div><!-- End .header-top -->

            <div class="header-middle sticky-header" data-sticky-options="{'mobile': true}">
                <div class="container">
                    <div class="header-left col-lg-2 w-auto pl-0">
                        <button class="mobile-menu-toggler text-dark mr-2" type="button">
                            <i class="fas fa-bars"></i>
                        </button>
                        <a href="demo42.html" class="logo">
                            <img src="{{url('/')}}/assets/home/images/demoes/demo42/shop42_logo.png" class="w-100" width="202" height="80"
                                alt="Porto Logo">
                        </a>
                    </div><!-- End .header-left -->

                    <div class="header-right w-lg-max">
                        <div
                            class="header-icon header-search header-search-inline header-search-category w-lg-max text-right mb-0">
                            <a href="#" class="search-toggle" role="button"><i class="icon-search-3"></i></a>
                            <form action="#" method="get">
                                <div class="header-search-wrapper">
                                    <input type="search" class="form-control" name="q" id="q" placeholder="Search..."
                                        required>

                                    <button class="btn icon-magnifier p-0" title="search" type="submit"></button>
                                </div><!-- End .header-search-wrapper -->
                            </form>
                        </div><!-- End .header-search -->

                        <span class="separator d-none d-lg-block"></span>

                        <div class="sicon-box mb-0 d-none d-lg-flex align-items-center pr-3 mr-1">
                            <div class=" sicon-default">
                                <i class="icon-phone-1"></i>
                            </div>
                            <div class="sicon-header">
                                <h4 class="sicon-title ls-n-25">CALL US NOW</h4>
                                <p>+123 5678 890</p>
                            </div> <!-- header -->
                        </div>

                        <span class="separator d-none d-lg-block mr-4"></span>

                        <a href="login.html" class="d-lg-block d-none">
                            <div class="header-user">
                                <i class="icon-user-2"></i>
                                <div class="header-userinfo">
                                    <span>Welcome</span>
                                    <h4>Sign In / Register</h4>
                                </div>
                            </div>
                        </a>

                        <span class="separator d-block"></span>

                        <div class="dropdown cart-dropdown">
                            <a href="#" title="Cart" class="dropdown-toggle dropdown-arrow cart-toggle" role="button"data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-display="static">
                                <i class="icon-cart-thick"></i>
                                <span class="cart-count badge-circle">3</span>
                            </a>
                            <div class="cart-overlay"></div>

                            <div class="dropdown-menu mobile-cart">
                                <a href="#" title="Close (Esc)" class="btn-close">×</a>

                                <div class="dropdownmenu-wrapper custom-scrollbar">
                                    <div class="dropdown-cart-header">Shopping Cart</div>
                                    <!-- End .dropdown-cart-header -->

                                    <div class="dropdown-cart-products">
                                        <div class="product">
                                            <div class="product-details">
                                                <h4 class="product-title">
                                                    <a href="demo42-product.html">Ultimate 3D Bluetooth Speaker</a>
                                                </h4>

                                                <span class="cart-product-info">
                                                    <span class="cart-product-qty">1</span>
                                                    × $99.00
                                                </span>
                                            </div><!-- End .product-details -->

                                            <figure class="product-image-container">
                                                <a href="demo42-product.html" class="product-image">
                                                    <img src="{{url('/')}}/assets/home/images/products/product-1.jpg" alt="product"
                                                        width="80" height="80">
                                                </a>
                                                <a href="#" class="btn-remove" title="Remove Product"><span>×</span></a>
                                            </figure>
                                        </div><!-- End .product -->

                                        <div class="product">
                                            <div class="product-details">
                                                <h4 class="product-title">
                                                    <a href="demo42-product.html">Brown Women Casual HandBag</a>
                                                </h4>

                                                <span class="cart-product-info">
                                                    <span class="cart-product-qty">1</span>
                                                    × $35.00
                                                </span>
                                            </div><!-- End .product-details -->

                                            <figure class="product-image-container">
                                                <a href="demo42-product.html" class="product-image">
                                                    <img src="{{url('/')}}/assets/home/images/products/product-2.jpg" alt="product"
                                                        width="80" height="80">
                                                </a>

                                                <a href="#" class="btn-remove" title="Remove Product"><span>×</span></a>
                                            </figure>
                                        </div><!-- End .product -->

                                        <div class="product">
                                            <div class="product-details">
                                                <h4 class="product-title">
                                                    <a href="demo42-product.html">Circled Ultimate 3D Speaker</a>
                                                </h4>

                                                <span class="cart-product-info">
                                                    <span class="cart-product-qty">1</span>
                                                    × $35.00
                                                </span>
                                            </div><!-- End .product-details -->

                                            <figure class="product-image-container">
                                                <a href="demo42-product.html" class="product-image">
                                                    <img src="{{url('/')}}/assets/home/images/products/product-3.jpg" alt="product"
                                                        width="80" height="80">
                                                </a>
                                                <a href="#" class="btn-remove" title="Remove Product"><span>×</span></a>
                                            </figure>
                                        </div><!-- End .product -->
                                    </div><!-- End .cart-product -->

                                    <div class="dropdown-cart-total">
                                        <span>SUBTOTAL:</span>

                                        <span class="cart-total-price float-right">$134.00</span>
                                    </div><!-- End .dropdown-cart-total -->

                                    <div class="dropdown-cart-action">
                                        <a href="cart.html" class="btn btn-gray btn-block view-cart">View
                                            Cart</a>
                                        <a href="checkout.html" class="btn btn-dark btn-block">Checkout</a>
                                    </div><!-- End .dropdown-cart-total -->
                                </div><!-- End .dropdownmenu-wrapper -->
                            </div><!-- End .dropdown-menu -->
                        </div><!-- End .dropdown -->
                    </div><!-- End .header-right -->
                </div><!-- End .container -->
            </div><!-- End .header-middle -->

            <div class="header-bottom sticky-header d-none d-lg-flex" data-sticky-options="{'mobile': false}">
                <div class="container">
                    <nav class="main-nav w-100">
                        <ul class="menu w-100">
                            <li class="menu-item d-flex align-items-center">
                                <a href="#" class="d-inline-flex align-items-center sf-with-ul">
                                    <i class="custom-icon-toggle-menu d-inline-table"></i><span>All
                                        Departments</span></a>
                                <div class="menu-depart">
                                    <a href="#"><i class="icon-category-motorcycles"></i>Auto Parts</a>

                                    <a href="#">
                                        <i class="icon-category-internal-accessories"></i>Interior Accessories
                                    </a>

                                    <a href="#"><i class="icon-category-mechanics"></i>Performance</a>

                                    <a href="#"><i class="icon-category-sound-video"></i>Sound & Video</a>

                                    <a href="#"><i class="icon-category-steering"></i>Steering Wheels</a>

                                </div>
                            </li>
                            <li class="active">
                                <a href="demo42.html">Home</a>
                            </li>
                            <li>
                                <a href="demo42-shop.html">Shop</a>
                                <div class="megamenu megamenu-fixed-width megamenu-3cols">
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <a href="#" class="nolink">VARIATION 1</a>
                                            <ul class="submenu">
                                                <li><a href="demo42-shop.html" title="shop">Fullwidth Banner</a></li>
                                                <li><a href="category-banner-boxed-slider.html">Boxed Slider
                                                        Banner</a>
                                                </li>
                                                <li><a href="category-banner-boxed-image.html">Boxed Image
                                                        Banner</a>
                                                </li>
                                                <li><a href="demo42-shop.html" title="shop">Left Sidebar</a></li>
                                                <li><a href="category-sidebar-right.html">Right Sidebar</a></li>
                                                <li><a href="category-off-canvas.html">Off Canvas Filter</a></li>
                                                <li><a href="category-horizontal-filter1.html">Horizontal
                                                        Filter1</a>
                                                </li>
                                                <li><a href="category-horizontal-filter2.html">Horizontal
                                                        Filter2</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="col-lg-4">
                                            <a href="#" class="nolink">VARIATION 2</a>
                                            <ul class="submenu">
                                                <li><a href="category-list.html">List Types</a></li>
                                                <li><a href="category-infinite-scroll.html">Ajax Infinite Scroll</a>
                                                </li>
                                                <li><a href="demo42-shop.html" title="shop">3 Columns Products</a></li>
                                                <li><a href="category-4col.html">4 Columns Products</a></li>
                                                <li><a href="category-5col.html">5 Columns Products</a></li>
                                                <li><a href="category-6col.html">6 Columns Products</a></li>
                                                <li><a href="category-7col.html">7 Columns Products</a></li>
                                                <li><a href="category-8col.html">8 Columns Products</a></li>
                                            </ul>
                                        </div>
                                        <div class="col-lg-4 p-0">
                                            <div class="menu-banner">
                                                <figure>
                                                    <img src="{{url('/')}}/assets/home/images/menu-banner.jpg" width="192" height="313"
                                                        alt="Menu banner">
                                                </figure>
                                                <div class="banner-content">
                                                    <h4>
                                                        <span class="">UP TO</span><br />
                                                        <b class="">50%</b>
                                                        <i>OFF</i>
                                                    </h4>
                                                    <a href="demo42-shop.html" class="btn btn-sm btn-dark">SHOP NOW</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div><!-- End .megamenu -->
                            </li>
                            <li>
                                <a href="demo42-product.html">Products</a>
                                <div class="megamenu megamenu-fixed-width">
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <a href="#" class="nolink">PRODUCT PAGES</a>
                                            <ul class="submenu">
                                                <li><a href="product.html">SIMPLE PRODUCT</a></li>
                                                <li><a href="product-variable.html">VARIABLE PRODUCT</a></li>
                                                <li><a href="product.html">SALE PRODUCT</a></li>
                                                <li><a href="product.html">FEATURED & ON SALE</a></li>
                                                <li><a href="product-custom-tab.html">WITH CUSTOM TAB</a></li>
                                                <li><a href="product-sidebar-left.html">WITH LEFT SIDEBAR</a></li>
                                                <li><a href="product-sidebar-right.html">WITH RIGHT SIDEBAR</a></li>
                                                <li><a href="product-addcart-sticky.html">ADD CART STICKY</a></li>
                                            </ul>
                                        </div><!-- End .col-lg-4 -->

                                        <div class="col-lg-4">
                                            <a href="#" class="nolink">PRODUCT LAYOUTS</a>
                                            <ul class="submenu">
                                                <li><a href="product-extended-layout.html">EXTENDED LAYOUT</a></li>
                                                <li><a href="product-grid-layout.html">GRID IMAGE</a></li>
                                                <li><a href="product-full-width.html">FULL WIDTH LAYOUT</a></li>
                                                <li><a href="product-sticky-info.html">STICKY INFO</a></li>
                                                <li><a href="product-sticky-both.html">LEFT & RIGHT STICKY</a></li>
                                                <li><a href="product-transparent-image.html">TRANSPARENT IMAGE</a>
                                                </li>
                                                <li><a href="product-center-vertical.html">CENTER VERTICAL</a></li>
                                                <li><a href="#">BUILD YOUR OWN</a></li>
                                            </ul>
                                        </div><!-- End .col-lg-4 -->

                                        <div class="col-lg-4 p-0">
                                            <div class="menu-banner menu-banner-2">
                                                <figure>
                                                    <img src="{{url('/')}}/assets/home/images/menu-banner-1.jpg" alt="Menu banner"
                                                        class="product-promo">
                                                </figure>
                                                <i>OFF</i>
                                                <div class="banner-content">
                                                    <h4>
                                                        <span class="">UP TO</span><br />
                                                        <b class="">50%</b>
                                                    </h4>
                                                </div>
                                                <a href="demo42-shop.html" class="btn btn-sm btn-dark">SHOP NOW</a>
                                            </div>
                                        </div><!-- End .col-lg-4 -->
                                    </div><!-- End .row -->
                                </div><!-- End .megamenu -->
                            </li>
                            <li>
                                <a href="#">Pages</a>
                                <ul>
                                    <li><a href="wishlist.html">Wishlist</a></li>
                                    <li><a href="cart.html">Shopping Cart</a></li>
                                    <li><a href="checkout.html">Checkout</a></li>
                                    <li><a href="dashboard.html">Dashboard</a></li>
                                    <li><a href="about.html">About Us</a></li>
                                    <li><a href="#">Blog</a>
                                        <ul>
                                            <li><a href="blog.html">Blog</a></li>
                                            <li><a href="single.html">Blog Post</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="contact.html">Contact Us</a></li>
                                    <li><a href="login.html">Login</a></li>
                                    <li><a href="forgot-password.html">Forgot Password</a></li>
                                </ul>
                            </li>
                            <li><a href="https://1.envato.market/DdLk5" rel="noopener" target="_blank">Buy Porto!</a>
                            </li>
                            <li class="float-right"><a href="#" class="pr-0">Special Offers</a></li>
                        </ul>
                    </nav>
                </div><!-- End .container -->
            </div><!-- End .header-bottom -->
        </header><!-- End .header -->

        <main class="main">
            <section class="intro-section">
                <div class="home-slider slide-animate owl-carousel owl-theme owl-carousel-lazy dot-inside" data-owl-options="{
                    'nav': false,
                    'dots': true,
                    'responsive': {
                        '576': {
                            'dots': false
                        }
                    }
                }">
                    <div class="home-slide banner" style="background-image: url('{{url('/')}}/assets/home/images/demoes/demo21/slider/slide1.jpg');">
                        <div class="banner-layer banner-layer-middle">
                            <div class="container banner-content">
                                <h2 class="font1 font-weight-normal text-uppercase mb-0 appear-animate" data-animation-name="fadeInUpShorter" data-animation-delay="200">start the revolution
                                </h2>
                                <h1 class="font1 font-weight-bold text-uppercase appear-animate" data-animation-name="fadeInUpShorter" data-animation-delay="500">
                                    drone pro 4
                                </h1>
                                <h2 class="font1 font-weight-normal text-uppercase mb-3 appear-animate" data-animation-name="fadeInUpShorter" data-animation-delay="800">from
                                    <strong>$499</strong></h2>
                                <a class="btn btn-dark btn-buy appear-animate" data-animation-name="fadeInUpShorter" data-animation-delay="1100" href="demo21-shop.html">BUY NOW</a>
                            </div>
                        </div>
                        <!-- End .home-slide-content -->
                    </div>
                    <!-- End .home-slide -->

                    <div class="home-slide banner" style="background-image: url('{{url('/')}}/assets/home/images/demoes/demo21/slider/slide2.jpg');">
                        <div class="banner-layer banner-layer-middle">
                            <div class="container banner-content">
                                <h2 class="font1 font-weight-normal text-uppercase mb-0 appear-animate" data-animation-name="fadeInUpShorter" data-animation-delay="200">amazing deals</h2>
                                <h1 class="font1 font-weight-bold text-uppercase appear-animate" data-animation-name="fadeInUpShorter" data-animation-delay="500">
                                    smartphone
                                </h1>
                                <h2 class="font1 font-weight-normal text-uppercase mb-3 appear-animate" data-animation-name="fadeInUpShorter" data-animation-delay="800">from
                                    <strong>$199</strong></h2>
                                <a class="btn btn-dark btn-buy appear-animate" data-animation-name="fadeInUpShorter" data-animation-delay="1100" href="demo21-shop.html">BUY NOW</a>
                            </div>
                        </div>
                        <!-- End .home-slide-content -->
                    </div>
                    <!-- End .home-slide -->

                    <div class="home-slide banner" style="background-image: url('{{url('/')}}/assets/home/images/demoes/demo21/slider/slide3.jpg');">
                        <div class="banner-layer banner-layer-middle">
                            <div class="container banner-content">
                                <h2 class="font1 font-weight-normal text-uppercase mb-0 appear-animate" data-animation-name="fadeInUpShorter" data-animation-delay="200">best price of the year
                                </h2>
                                <h1 class="font1 font-weight-bold text-uppercase appear-animate" data-animation-name="fadeInUpShorter" data-animation-delay="500">
                                    top accessories
                                </h1>
                                <h2 class="font1 font-weight-normal text-uppercase mb-3 appear-animate" data-animation-name="fadeInUpShorter" data-animation-delay="800">from
                                    <strong>$19</strong></h2>
                                <a class="btn btn-dark btn-buy appear-animate" data-animation-name="fadeInUpShorter" data-animation-delay="1100" href="demo21-shop.html">BUY NOW</a>
                            </div>
                        </div>
                        <!-- End .home-slide-content -->
                    </div>
                    <!-- End .home-slide -->
                </div>

                <div class="home-slider-sidebar d-none d-sm-block">
                    <div class="container">
                        <ul>
                            <li class="active">Drones</li>
                            <li>Phones</li>
                            <li>Accessories</li>
                        </ul>
                    </div>
                </div>
            </section>
            <section class="search-section" style="background-color: #f4f4f4;">
                <div class="container">
                    <div class="search-name d-lg-flex align-items-center appear-animate"
                        data-animation-name="fadeInUpShorter">
                        <h2 class="search-title"><i class="icon-business-book"></i>Add A Vehicle To
                            Find Exact Fit Parts:</h2>
                        <h4 class="search-info">Shop for your specific vehicle to find parts that fit.
                        </h4>
                    </div>
                    <div class="row search-form appear-animate" data-animation-name="fadeInUpShorter">
                        <div class="col-md-6 col-lg-3">
                            <div class="select-custom">
                                <select class="form-control mb-0">
                                    <option>By make</option>
                                    <option>Dolor</option>
                                    <option>Ipsum</option>
                                    <option>Lorem</option>
                                    <option>Sit</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-4">
                            <div class="select-custom">
                                <select class="form-control mb-0">
                                    <option>By model</option>
                                    <option>Engine</option>
                                    <option>Motor</option>
                                    <option>Sound</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                            <div class="select-custom">
                                <select class="form-control mb-0">
                                    <option>By product-year</option>
                                    <option>2018</option>
                                    <option>2019</option>
                                    <option>2020</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-2">
                            <a href="demo42-shop.html"
                                class="btn btn-borders btn-rounded btn-outline-primary ls-25 btn-block">Find
                                Auto Parts</a>
                        </div>
                    </div>
                </div>
            </section>
            <section class="category-section container">
                <div class="d-lg-flex align-items-center appear-animate" data-animation-name="fadeInLeftShorter">
                    <h2 class="title title-underline divider">Shop Categories</h2>
                    <a href="demo42-shop.html" class="sicon-title">VIEW CATEGORIES<i class="fas fa-arrow-right"></i></a>
                </div>
                <div class="owl-carousel owl-theme appear-animate" data-owl-options="{
                    'loop': false,
                    'dots': false,
                    'nav': true,
                    'responsive': {
                        '0': {
                            'items': 2
                        },
                        '576': {
                            'items': 3
                        },
                        '991': {
                            'items': 4
                        }
                    }
                }">
                    <div class="product-category">
                        <a href="demo42-shop.html">
                            <figure>
                                <img src="{{url('/')}}/assets/home/images/demoes/demo42/category/cat1.jpg" alt="category" width="250"
                                    height="250">
                            </figure>
                        </a>
                        <div class="category-content">
                            <h3 class="category-title">Auto Parts</h3>
                            <ul class="sub-categories">
                                <li><a href="#">Batteries, Starting And Charging</a></li>
                                <li><a href="#">Brakes And Traction Control</a></li>
                                <li><a href="#">Climate Control</a></li>
                                <li><a href="#">Collision And Hardware</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="product-category">
                        <a href="demo42-shop.html">
                            <figure>
                                <img src="{{url('/')}}/assets/home/images/demoes/demo42/category/cat2.jpg" alt="category" width="250"
                                    height="250">
                            </figure>
                        </a>
                        <div class="category-content">
                            <h3 class="category-title">Interior Accessories</h3>
                            <ul class="sub-categories">
                                <li><a href="#">Alarm And Security</a></li>
                                <li><a href="#">Dash Covers, Headliners And Visor</a></li>
                                <li><a href="#">Seat Covers And Seats Accessories</a></li>
                                <li><a href="#">Sun / Heat Protection</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="product-category">
                        <a href="demo42-shop.html">
                            <figure>
                                <img src="{{url('/')}}/assets/home/images/demoes/demo42/category/cat3.jpg" alt="category" width="250"
                                    height="250">
                            </figure>
                        </a>
                        <div class="category-content">
                            <h3 class="category-title">External Accessories</h3>
                            <ul class="sub-categories">
                                <li><a href="#">Antenna Cables And Masts</a></li>
                                <li><a href="#">Decals And Graphics</a></li>
                                <li><a href="#">Exterior Lighting</a></li>
                                <li><a href="#">License Plate And Accessories</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="product-category">
                        <a href="demo42-shop.html">
                            <figure>
                                <img src="{{url('/')}}/assets/home/images/demoes/demo42/category/cat4.jpg" alt="category" width="250"
                                    height="250">
                            </figure>
                        </a>
                        <div class="category-content">
                            <h3 class="category-title">Performance</h3>
                            <ul class="sub-categories">
                                <li><a href="#">Body, Suspension, And Steering</a></li>
                                <li><a href="#">Exhaust</a></li>
                                <li><a href="#">Fuel System</a></li>
                                <li><a href="#">Power Adders Components</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </section>
            <section class="product-section1" style="background-color: #f4f4f4;">
                <div class="container">
                    <h2 class="title title-underline pb-1 appear-animate" data-animation-name="fadeInLeftShorter">Hot
                        Deals</h2>
                    <div class="owl-carousel owl-theme appear-animate" data-owl-options="{
                    'loop': false,
                    'dots': false,
                    'nav': true,
                    'margin': 20,
                    'responsive': {
                        '0': {
                            'items': 2
                        },
                        '576': {
                            'items': 4
                        },
                        '991': {
                            'items': 6
                        }
                    }
                }">
                        <div class="product-default inner-quickview inner-icon">
                            <figure>
                                <a href="demo42-product.html">
                                    <img src="{{url('/')}}/assets/home/images/demoes/demo42/product/product1-300x300.jpg" width="300"
                                        height="300" alt="product">
                                </a>
                                <div class="label-group">
                                    <span class="product-label label-sale">-13%</span>
                                </div>
                                <div class="btn-icon-group">
                                    <a href="#" class="btn-icon btn-add-cart product-type-simple"><i
                                            class="icon-shopping-cart"></i></a>
                                </div>
                                <a href="ajax/product-quick-view.html" class="btn-quickview" title="Quick View">Quick
                                    View</a>
                            </figure>
                            <div class="product-details">
                                <div class="category-wrap">
                                    <div class="category-list">
                                        <a href="#">External Accessories</a>,
                                        <a href="#">Hot Deals</a>
                                    </div>
                                    <a href="wishlist.html" class="btn-icon-wish" title="wishlist"><i
                                            class="icon-heart"></i></a>
                                </div>
                                <h3 class="product-title">
                                    <a href="demo42-product.html">Product Short Name</a>
                                </h3>
                                <div class="ratings-container">
                                    <div class="product-ratings">
                                        <span class="ratings" style="width:0%"></span>
                                        <!-- End .ratings -->
                                        <span class="tooltiptext tooltip-top"></span>
                                    </div><!-- End .product-ratings -->
                                </div><!-- End .product-container -->
                                <div class="price-box">
                                    <del class="old-price">$299.00</del>
                                    <span class="product-price">$259.00</span>
                                </div><!-- End .price-box -->
                            </div><!-- End .product-details -->
                        </div>
                        <div class="product-default inner-quickview inner-icon">
                            <figure>
                                <a href="demo42-product.html">
                                    <img src="{{url('/')}}/assets/home/images/demoes/demo42/product/product2-300x300.jpg" width="300"
                                        height="300" alt="product">
                                </a>
                                <div class="label-group">
                                    <span class="product-label label-sale">-13%</span>
                                </div>
                                <div class="btn-icon-group">
                                    <a href="#" class="btn-icon btn-add-cart product-type-simple"><i
                                            class="icon-shopping-cart"></i></a>
                                </div>
                                <a href="ajax/product-quick-view.html" class="btn-quickview" title="Quick View">Quick
                                    View</a>
                            </figure>
                            <div class="product-details">
                                <div class="category-wrap">
                                    <div class="category-list">
                                        <a href="#">Hot Deals</a>,
                                        <a href="#">Interior Accessories</a>
                                    </div>
                                    <a href="wishlist.html" class="btn-icon-wish" title="wishlist"><i
                                            class="icon-heart"></i></a>
                                </div>
                                <h3 class="product-title">
                                    <a href="demo42-product.html">Product Short Name</a>
                                </h3>
                                <div class="ratings-container">
                                    <div class="product-ratings">
                                        <span class="ratings" style="width:0%"></span>
                                        <!-- End .ratings -->
                                        <span class="tooltiptext tooltip-top"></span>
                                    </div><!-- End .product-ratings -->
                                </div><!-- End .product-container -->
                                <div class="price-box">
                                    <del class="old-price">$299.00</del>
                                    <span class="product-price">$259.00</span>
                                </div><!-- End .price-box -->
                            </div><!-- End .product-details -->
                        </div>
                        <div class="product-default inner-quickview inner-icon">
                            <figure>
                                <a href="demo42-product.html">
                                    <img src="{{url('/')}}/assets/home/images/demoes/demo42/product/product3-300x300.jpg" width="300"
                                        height="300" alt="product">
                                </a>
                                <div class="label-group">
                                    <span class="product-label label-sale">-35%</span>
                                </div>
                                <div class="btn-icon-group">
                                    <a href="#" class="btn-icon btn-add-cart product-type-simple"><i
                                            class="icon-shopping-cart"></i></a>
                                </div>
                                <a href="ajax/product-quick-view.html" class="btn-quickview" title="Quick View">Quick
                                    View</a>
                            </figure>
                            <div class="product-details">
                                <div class="category-wrap">
                                    <div class="category-list">
                                        <a href="#">External Accessories</a>,
                                        <a href="#">Hot Deals</a>
                                    </div>
                                    <a href="wishlist.html" class="btn-icon-wish" title="wishlist"><i
                                            class="icon-heart"></i></a>
                                </div>
                                <h3 class="product-title">
                                    <a href="demo42-product.html">Product Short Name</a>
                                </h3>
                                <div class="ratings-container">
                                    <div class="product-ratings">
                                        <span class="ratings" style="width:0%"></span>
                                        <!-- End .ratings -->
                                        <span class="tooltiptext tooltip-top"></span>
                                    </div><!-- End .product-ratings -->
                                </div><!-- End .product-container -->
                                <div class="price-box">
                                    <del class="old-price">$199.00</del>
                                    <span class="product-price">$129.00</span>
                                </div><!-- End .price-box -->
                            </div><!-- End .product-details -->
                        </div>
                        <div class="product-default inner-quickview inner-icon">
                            <figure>
                                <a href="demo42-product.html">
                                    <img src="{{url('/')}}/assets/home/images/demoes/demo42/product/product4-300x300.jpg" width="300"
                                        height="300" alt="product">
                                </a>
                                <div class="btn-icon-group">
                                    <a href="#" class="btn-icon btn-add-cart product-type-simple"><i
                                            class="icon-shopping-cart"></i></a>
                                </div>
                                <a href="ajax/product-quick-view.html" class="btn-quickview" title="Quick View">Quick
                                    View</a>
                            </figure>
                            <div class="product-details">
                                <div class="category-wrap">
                                    <div class="category-list">
                                        <a href="#">Hot Deals</a>,
                                        <a href="#">Sound & Video</a>
                                    </div>
                                    <a href="wishlist.html" class="btn-icon-wish" title="wishlist"><i
                                            class="icon-heart"></i></a>
                                </div>
                                <h3 class="product-title">
                                    <a href="demo42-product.html">Product Short Name</a>
                                </h3>
                                <div class="ratings-container">
                                    <div class="product-ratings">
                                        <span class="ratings" style="width:60%"></span>
                                        <!-- End .ratings -->
                                        <span class="tooltiptext tooltip-top"></span>
                                    </div><!-- End .product-ratings -->
                                </div><!-- End .product-container -->
                                <div class="price-box">
                                    <span class="product-price">$199.00</span>
                                </div><!-- End .price-box -->
                            </div><!-- End .product-details -->
                        </div>
                        <div class="product-default inner-quickview inner-icon">
                            <figure>
                                <a href="demo42-product.html">
                                    <img src="{{url('/')}}/assets/home/images/demoes/demo42/product/product5-300x300.jpg" width="300"
                                        height="300" alt="product">
                                </a>
                                <div class="btn-icon-group">
                                    <a href="#" class="btn-icon btn-add-cart product-type-simple"><i
                                            class="icon-shopping-cart"></i></a>
                                </div>
                                <a href="ajax/product-quick-view.html" class="btn-quickview" title="Quick View">Quick
                                    View</a>
                            </figure>
                            <div class="product-details">
                                <div class="category-wrap">
                                    <div class="category-list">
                                        <a href="#">Hot Deals</a>,
                                        <a href="#">Steering Wheels</a>
                                    </div>
                                    <a href="wishlist.html" class="btn-icon-wish" title="wishlist"><i
                                            class="icon-heart"></i></a>
                                </div>
                                <h3 class="product-title">
                                    <a href="demo42-product.html">Product Short Name</a>
                                </h3>
                                <div class="ratings-container">
                                    <div class="product-ratings">
                                        <span class="ratings" style="width:80%"></span>
                                        <!-- End .ratings -->
                                        <span class="tooltiptext tooltip-top"></span>
                                    </div><!-- End .product-ratings -->
                                </div><!-- End .product-container -->
                                <div class="price-box">
                                    <span class="product-price">$55.00</span>
                                </div><!-- End .price-box -->
                            </div><!-- End .product-details -->
                        </div>
                        <div class="product-default inner-quickview inner-icon">
                            <figure>
                                <a href="demo42-product.html">
                                    <img src="{{url('/')}}/assets/home/images/demoes/demo42/product/product6-300x300.jpg" width="300"
                                        height="300" alt="product">
                                </a>
                                <div class="btn-icon-group">
                                    <a href="#" class="btn-icon btn-add-cart product-type-simple"><i
                                            class="icon-shopping-cart"></i></a>
                                </div>
                                <a href="ajax/product-quick-view.html" class="btn-quickview" title="Quick View">Quick
                                    View</a>
                            </figure>
                            <div class="product-details">
                                <div class="category-wrap">
                                    <div class="category-list">
                                        <a href="#">Fluids & Chemicals</a>,
                                        <a href="#">Hot Deals</a>
                                    </div>
                                    <a href="wishlist.html" class="btn-icon-wish" title="wishlist"><i
                                            class="icon-heart"></i></a>
                                </div>
                                <h3 class="product-title">
                                    <a href="demo42-product.html">Product Short Name</a>
                                </h3>
                                <div class="ratings-container">
                                    <div class="product-ratings">
                                        <span class="ratings" style="width:80%"></span>
                                        <!-- End .ratings -->
                                        <span class="tooltiptext tooltip-top"></span>
                                    </div><!-- End .product-ratings -->
                                </div><!-- End .product-container -->
                                <div class="price-box">
                                    <span class="product-price">$299.00</span>
                                </div><!-- End .price-box -->
                            </div><!-- End .product-details -->
                        </div>
                    </div>
                </div>
            </section>
            <section class="product-section2 container">
                <div class="row">
                    <div class="col-md-4 appear-animate" data-animation-name="fadeInLeftShorter">
                        <h3 class="custom-title">Special Offers</h3>
                        <div class="owl-carousel owl-theme dots-simple">
                            <div class="banner banner1"
                                style="background: url(assets/images/demoes/demo42/banner/banner1.jpg) rgb(232, 127, 59);
                            background-position: center; background-size: cover; background-repeat: no-repeat; min-height: 40.2rem;">
                                <div class="banner-content banner-layer-middle position-absolute">

                                    <img src="{{url('/')}}/assets/home/images/demoes/demo42/shop_brand1.png" width="232" height="28"
                                        alt="brand" />
                                    <h3 class="banner-subtitle text-uppercase text-white">Interior
                                        Accessories</h3>
                                    <h2 class="banner-title text-uppercase text-white font-weight-bold">
                                        Starting<br>At <sup>$</sup>99<sup>99</sup>
                                    </h2>
                                    <p class="banner-desc text-white">Start Shopping Right Now</p>
                                    <a href="#" class="btn btn-dark btn-rounded btn-icon-right ls-25" role="button">Shop
                                        Now
                                        <i class="fas fa-arrow-right"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="banner banner2"
                                style="background: url(assets/images/demoes/demo42/banner/banner2.jpg) rgb(83, 86, 91);
                            background-position: center; background-size: cover; background-repeat: no-repeat; min-height: 40.2rem;">
                                <div class="banner-content banner-layer-middle position-absolute">

                                    <img src="{{url('/')}}/assets/home/images/demoes/demo42/shop_brand1.png" width="232" height="28"
                                        alt="brand" />
                                    <h3 class="banner-subtitle text-uppercase text-white">Interior
                                        Accessories</h3>
                                    <h2 class="banner-title text-uppercase text-white font-weight-bold">
                                        Starting<br>At <sup>$</sup>99<sup>99</sup>
                                    </h2>
                                    <p class="banner-desc text-white">Start Shopping Right Now</p>
                                    <a href="#" class="btn btn-primary btn-rounded btn-icon-right ls-25"
                                        role="button">Shop
                                        Now
                                        <i class="fas fa-arrow-right"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 appear-animate" data-animation-name="fadeInLeftShorter"
                        data-animation-delay="200">
                        <div class="d-lg-flex align-items-center">
                            <h3 class="custom-title divider">We Suggest</h3>
                            <a href="demo42-shop.html" class="sicon-title">VIEW ALL<i
                                    class="fas fa-arrow-right"></i></a>
                        </div>
                        <div class="product-default left-details product-widget">
                            <figure>
                                <a href="demo42-product.html">
                                    <img src="{{url('/')}}/assets/home/images/demoes/demo42/product/product7-300x300.jpg" width="95"
                                        height="95" alt="product">
                                </a>
                            </figure>
                            <div class="product-details">
                                <div class="category-list">
                                    <a href="category.html">Interior Accessories</a>
                                </div>
                                <h3 class="product-title">
                                    <a href="#">Product Short Name</a>
                                </h3>
                                <div class="ratings-container">
                                    <div class="product-ratings">
                                        <span class="ratings" style="width:0%"></span>
                                        <!-- End .ratings -->
                                        <span class="tooltiptext tooltip-top"></span>
                                    </div>
                                    <!-- End .product-ratings -->
                                </div>
                                <!-- End .product-container -->
                                <div class="price-box">
                                    <del class="old-price">$199.00</del>
                                    <span class="product-price">$129.00</span>
                                </div>
                                <!-- End .price-box -->
                            </div>
                            <!-- End .product-details -->
                        </div>
                        <div class="product-default left-details product-widget">
                            <figure>
                                <a href="demo42-product.html">
                                    <img src="{{url('/')}}/assets/home/images/demoes/demo42/product/product8-300x300.jpg" width="95"
                                        height="95" alt="product">
                                </a>
                            </figure>
                            <div class="product-details">
                                <div class="category-list">
                                    <a href="category.html">Auto Parts</a>
                                </div>
                                <h3 class="product-title">
                                    <a href="#">Product Short Name</a>
                                </h3>
                                <div class="ratings-container">
                                    <div class="product-ratings">
                                        <span class="ratings" style="width:0%"></span>
                                        <!-- End .ratings -->
                                        <span class="tooltiptext tooltip-top"></span>
                                    </div>
                                    <!-- End .product-ratings -->
                                </div>
                                <!-- End .product-container -->
                                <div class="price-box">
                                    <span class="product-price">$288.00</span>
                                </div>
                                <!-- End .price-box -->
                            </div>
                            <!-- End .product-details -->
                        </div>
                        <div class="product-default left-details product-widget">
                            <figure>
                                <a href="demo42-product.html">
                                    <img src="{{url('/')}}/assets/home/images/demoes/demo42/product/product9-300x300.jpg" width="95"
                                        height="95" alt="product">
                                </a>
                            </figure>
                            <div class="product-details">
                                <div class="category-list">
                                    <a href="category.html">Interior Accessories</a>
                                </div>
                                <h3 class="product-title">
                                    <a href="#">Product Short Name</a>
                                </h3>
                                <div class="ratings-container">
                                    <div class="product-ratings">
                                        <span class="ratings" style="width:0%"></span>
                                        <!-- End .ratings -->
                                        <span class="tooltiptext tooltip-top"></span>
                                    </div>
                                    <!-- End .product-ratings -->
                                </div>
                                <!-- End .product-container -->
                                <div class="price-box">
                                    <del class="old-price">$299.00</del>
                                    <span class="product-price">$259.00</span>
                                </div>
                                <!-- End .price-box -->
                            </div>
                            <!-- End .product-details -->
                        </div>
                    </div>
                    <div class="col-md-4 appear-animate" data-animation-name="fadeInLeftShorter"
                        data-animation-delay="400">
                        <div class="d-lg-flex align-items-center">
                            <h3 class="custom-title divider">Customer Favorites</h3>
                            <a href="demo42-shop.html" class="sicon-title">VIEW ALL<i
                                    class="fas fa-arrow-right"></i></a>
                        </div>
                        <div class="product-default left-details product-widget">
                            <figure>
                                <a href="demo42-product.html">
                                    <img src="{{url('/')}}/assets/home/images/demoes/demo42/product/product10-300x300.jpg" width="95"
                                        height="95" alt="product">
                                </a>
                            </figure>
                            <div class="product-details">
                                <div class="category-list">
                                    <a href="category.html">Performance</a>
                                </div>
                                <h3 class="product-title">
                                    <a href="#">Product Short Name</a>
                                </h3>
                                <div class="ratings-container">
                                    <div class="product-ratings">
                                        <span class="ratings" style="width:100%"></span>
                                        <!-- End .ratings -->
                                        <span class="tooltiptext tooltip-top"></span>
                                    </div>
                                    <!-- End .product-ratings -->
                                </div>
                                <!-- End .product-container -->
                                <div class="price-box">
                                    <span class="product-price">$488.00</span>
                                </div>
                                <!-- End .price-box -->
                            </div>
                            <!-- End .product-details -->
                        </div>
                        <div class="product-default left-details product-widget">
                            <figure>
                                <a href="demo42-product.html">
                                    <img src="{{url('/')}}/assets/home/images/demoes/demo42/product/product11-300x300.jpg" width="95"
                                        height="95" alt="product">
                                </a>
                            </figure>
                            <div class="product-details">
                                <div class="category-list">
                                    <a href="category.html">Sound & Video</a>
                                </div>
                                <h3 class="product-title">
                                    <a href="#">Product Short Name</a>
                                </h3>
                                <div class="ratings-container">
                                    <div class="product-ratings">
                                        <span class="ratings" style="width:80%"></span>
                                        <!-- End .ratings -->
                                        <span class="tooltiptext tooltip-top"></span>
                                    </div>
                                    <!-- End .product-ratings -->
                                </div>
                                <!-- End .product-container -->
                                <div class="price-box">
                                    <span class="product-price">$299.00</span>
                                </div>
                                <!-- End .price-box -->
                            </div>
                            <!-- End .product-details -->
                        </div>
                        <div class="product-default left-details product-widget">
                            <figure>
                                <a href="demo42-product.html">
                                    <img src="{{url('/')}}/assets/home/images/demoes/demo42/product/product12-300x300.jpg" width="95"
                                        height="95" alt="product">
                                </a>
                            </figure>
                            <div class="product-details">
                                <div class="category-list">
                                    <a href="category.html">Hot Deals</a>,
                                    <a href="category.html">Steering Wheels</a>
                                </div>
                                <h3 class="product-title">
                                    <a href="#">Product Short Name</a>
                                </h3>
                                <div class="ratings-container">
                                    <div class="product-ratings">
                                        <span class="ratings" style="width:80%"></span>
                                        <!-- End .ratings -->
                                        <span class="tooltiptext tooltip-top"></span>
                                    </div>
                                    <!-- End .product-ratings -->
                                </div>
                                <!-- End .product-container -->
                                <div class="price-box">
                                    <span class="product-price">$55.00</span>
                                </div>
                                <!-- End .price-box -->
                            </div>
                            <!-- End .product-details -->
                        </div>
                    </div>
                </div>
            </section>
            <section class="brand-section appear-animate" style="background-color: #f4f4f4;">
                <div class="container">
                    <h2 class="title title-underline pb-1 appear-animate" data-animation-name="fadeInLeftShorter">Shop
                        By
                        Brand</h2>
                    <div class="owl-carousel owl-theme nav-big nav-outer appear-animate" data-owl-options="{
                    'loop': false,
                    'dots': false,
                    'nav': true,
                    'margin': 20,
                    'responsive': {
                        '0': {
                            'items': 1
                        },
                        '750': {
                            'items': 2
                        }
                    }
                }">
                        <div class="brand-box">
                            <div class="brand-name">
                                <h3>Shop Ron Jones:</h3>
                                <img src="{{url('/')}}/assets/home/images/demoes/demo42/new_brand2.png" width="140" height="60"
                                    alt="brand" />
                            </div>
                            <div class="shop-products owl-carousel owl-theme dots-simple" data-owl-options="{
                                'loop': false,
                                'dots': true,
                                'nav': false,
                                'items': 2,
                                'margin': 30
                            }">
                                <div class="product-default inner-quickview inner-icon">
                                    <figure>
                                        <a href="demo42-product.html">
                                            <img src="{{url('/')}}/assets/home/images/demoes/demo42/product/product10-300x300.jpg"
                                                width="300" height="300" alt="product">
                                        </a>
                                        <div class="btn-icon-group">
                                            <a href="#" class="btn-icon btn-add-cart product-type-simple"><i
                                                    class="icon-shopping-cart"></i></a>
                                        </div>
                                        <a href="ajax/product-quick-view.html" class="btn-quickview"
                                            title="Quick View">Quick
                                            View</a>
                                    </figure>
                                    <div class="product-details">
                                        <div class="category-wrap">
                                            <div class="category-list">
                                                <a href="#">Performance</a>
                                            </div>
                                            <a href="wishlist.html" class="btn-icon-wish" title="wishlist"><i
                                                    class="icon-heart"></i></a>
                                        </div>
                                        <h3 class="product-title">
                                            <a href="demo42-product.html">Product Short Name</a>
                                        </h3>
                                        <div class="ratings-container">
                                            <div class="product-ratings">
                                                <span class="ratings" style="width:100%"></span>
                                                <!-- End .ratings -->
                                                <span class="tooltiptext tooltip-top"></span>
                                            </div><!-- End .product-ratings -->
                                        </div><!-- End .product-container -->
                                        <div class="price-box">
                                            <span class="product-price">$488.00</span>
                                        </div><!-- End .price-box -->
                                    </div><!-- End .product-details -->
                                </div>
                                <div class="product-default inner-quickview inner-icon">
                                    <figure>
                                        <a href="demo42-product.html">
                                            <img src="{{url('/')}}/assets/home/images/demoes/demo42/product/product13-300x300.jpg"
                                                width="300" height="300" alt="product">
                                        </a>
                                        <div class="label-group">
                                            <span class="product-label label-sale">-17%</span>
                                        </div>
                                        <div class="btn-icon-group">
                                            <a href="#" class="btn-icon btn-add-cart product-type-simple"><i
                                                    class="icon-shopping-cart"></i></a>
                                        </div>
                                        <a href="ajax/product-quick-view.html" class="btn-quickview"
                                            title="Quick View">Quick
                                            View</a>
                                    </figure>
                                    <div class="product-details">
                                        <div class="category-wrap">
                                            <div class="category-list">
                                                <a href="#">Auto Parts</a>
                                            </div>
                                            <a href="wishlist.html" class="btn-icon-wish" title="wishlist"><i
                                                    class="icon-heart"></i></a>
                                        </div>
                                        <h3 class="product-title">
                                            <a href="demo42-product.html">Product Short Name</a>
                                        </h3>
                                        <div class="ratings-container">
                                            <div class="product-ratings">
                                                <span class="ratings" style="width:80%"></span>
                                                <!-- End .ratings -->
                                                <span class="tooltiptext tooltip-top"></span>
                                            </div><!-- End .product-ratings -->
                                        </div><!-- End .product-container -->
                                        <div class="price-box">
                                            <del class="old-price">$59.00</del>
                                            <span class="product-price">$49.00</span>
                                        </div><!-- End .price-box -->
                                    </div><!-- End .product-details -->
                                </div>
                                <div class="product-default inner-quickview inner-icon">
                                    <figure>
                                        <a href="demo42-product.html">
                                            <img src="{{url('/')}}/assets/home/images/demoes/demo42/product/product6-300x300.jpg"
                                                width="300" height="300" alt="product">
                                        </a>
                                        <div class="label-group">
                                            <span class="product-label label-sale">-35%</span>
                                        </div>
                                        <div class="btn-icon-group">
                                            <a href="#" class="btn-icon btn-add-cart product-type-simple"><i
                                                    class="icon-shopping-cart"></i></a>
                                        </div>
                                        <a href="ajax/product-quick-view.html" class="btn-quickview"
                                            title="Quick View">Quick
                                            View</a>
                                    </figure>
                                    <div class="product-details">
                                        <div class="category-wrap">
                                            <div class="category-list">
                                                <a href="#">External Accessories</a>
                                                <a href="#">Hot Deals</a>
                                            </div>
                                            <a href="wishlist.html" class="btn-icon-wish" title="wishlist"><i
                                                    class="icon-heart"></i></a>
                                        </div>
                                        <h3 class="product-title">
                                            <a href="demo42-product.html">Product Short Name</a>
                                        </h3>
                                        <div class="ratings-container">
                                            <div class="product-ratings">
                                                <span class="ratings" style="width:0%"></span>
                                                <!-- End .ratings -->
                                                <span class="tooltiptext tooltip-top"></span>
                                            </div><!-- End .product-ratings -->
                                        </div><!-- End .product-container -->
                                        <div class="price-box">
                                            <del class="old-price">$199.00</del>
                                            <span class="product-price">$129.00</span>
                                        </div><!-- End .price-box -->
                                    </div><!-- End .product-details -->
                                </div>
                            </div>
                        </div>
                        <div class="brand-box">
                            <div class="brand-name">
                                <h3>Shop Golden Grid:</h3>
                                <img src="{{url('/')}}/assets/home/images/demoes/demo42/new_brand3.png" width="140" height="60"
                                    alt="brand" />
                            </div>
                            <div class="shop-products owl-carousel owl-theme dots-simple" data-owl-options="{
                                'loop': false,
                                'dots': true,
                                'nav': false,
                                'items': 2,
                                'margin': 30
                            }">
                                <div class="product-default inner-quickview inner-icon">
                                    <figure>
                                        <a href="demo42-product.html">
                                            <img src="{{url('/')}}/assets/home/images/demoes/demo42/product/product3-300x300.jpg"
                                                width="300" height="300" alt="product">
                                        </a>
                                        <div class="btn-icon-group">
                                            <a href="#" class="btn-icon btn-add-cart product-type-simple"><i
                                                    class="icon-shopping-cart"></i></a>
                                        </div>
                                        <a href="ajax/product-quick-view.html" class="btn-quickview"
                                            title="Quick View">Quick
                                            View</a>
                                    </figure>
                                    <div class="product-details">
                                        <div class="category-wrap">
                                            <div class="category-list">
                                                <a href="#">Hot Deals</a>,
                                                <a href="#">Steering Wheels</a>
                                            </div>
                                            <a href="wishlist.html" class="btn-icon-wish" title="wishlist"><i
                                                    class="icon-heart"></i></a>
                                        </div>
                                        <h3 class="product-title">
                                            <a href="demo42-product.html">Product Short Name</a>
                                        </h3>
                                        <div class="ratings-container">
                                            <div class="product-ratings">
                                                <span class="ratings" style="width:80%"></span>
                                                <!-- End .ratings -->
                                                <span class="tooltiptext tooltip-top"></span>
                                            </div><!-- End .product-ratings -->
                                        </div><!-- End .product-container -->
                                        <div class="price-box">
                                            <span class="product-price">$55.00</span>
                                        </div><!-- End .price-box -->
                                    </div><!-- End .product-details -->
                                </div>
                                <div class="product-default inner-quickview inner-icon">
                                    <figure>
                                        <a href="demo42-product.html">
                                            <img src="{{url('/')}}/assets/home/images/demoes/demo42/product/product14-300x300.jpg"
                                                width="300" height="300" alt="product">
                                        </a>
                                        <div class="btn-icon-group">
                                            <a href="#" class="btn-icon btn-add-cart product-type-simple"><i
                                                    class="icon-shopping-cart"></i></a>
                                        </div>
                                        <a href="ajax/product-quick-view.html" class="btn-quickview"
                                            title="Quick View">Quick
                                            View</a>
                                    </figure>
                                    <div class="product-details">
                                        <div class="category-wrap">
                                            <div class="category-list">
                                                <a href="#">Lanterns & lighting</a>
                                            </div>
                                            <a href="wishlist.html" class="btn-icon-wish" title="wishlist"><i
                                                    class="icon-heart"></i></a>
                                        </div>
                                        <h3 class="product-title">
                                            <a href="demo42-product.html">Product Short Name</a>
                                        </h3>
                                        <div class="ratings-container">
                                            <div class="product-ratings">
                                                <span class="ratings" style="width:0%"></span>
                                                <!-- End .ratings -->
                                                <span class="tooltiptext tooltip-top"></span>
                                            </div><!-- End .product-ratings -->
                                        </div><!-- End .product-container -->
                                        <div class="price-box">
                                            <span class="product-price">$299.00</span>
                                        </div><!-- End .price-box -->
                                    </div><!-- End .product-details -->
                                </div>
                                <div class="product-default inner-quickview inner-icon">
                                    <figure>
                                        <a href="demo42-product.html">
                                            <img src="{{url('/')}}/assets/home/images/demoes/demo42/product/product6-300x300.jpg"
                                                width="300" height="300" alt="product">
                                        </a>
                                        <div class="label-group">
                                            <span class="product-label label-sale">-35%</span>
                                        </div>
                                        <div class="btn-icon-group">
                                            <a href="#" class="btn-icon btn-add-cart product-type-simple"><i
                                                    class="icon-shopping-cart"></i></a>
                                        </div>
                                        <a href="ajax/product-quick-view.html" class="btn-quickview"
                                            title="Quick View">Quick
                                            View</a>
                                    </figure>
                                    <div class="product-details">
                                        <div class="category-wrap">
                                            <div class="category-list">
                                                <a href="#">External Accessories</a>,
                                                <a href="#">Hot Deals</a>
                                            </div>
                                            <a href="wishlist.html" class="btn-icon-wish" title="wishlist"><i
                                                    class="icon-heart"></i></a>
                                        </div>
                                        <h3 class="product-title">
                                            <a href="demo42-product.html">Product Short Name</a>
                                        </h3>
                                        <div class="ratings-container">
                                            <div class="product-ratings">
                                                <span class="ratings" style="width:0%"></span>
                                                <!-- End .ratings -->
                                                <span class="tooltiptext tooltip-top"></span>
                                            </div><!-- End .product-ratings -->
                                        </div><!-- End .product-container -->
                                        <div class="price-box">
                                            <del class="old-price">$199.00</del>
                                            <span class="product-price">$129.00</span>
                                        </div><!-- End .price-box -->
                                    </div><!-- End .product-details -->
                                </div>
                            </div>
                        </div>
                        <div class="brand-box">
                            <div class="brand-name">
                                <h3>Shop David Smith:</h3>
                                <img src="{{url('/')}}/assets/home/images/demoes/demo42/new_brand1.png" width="140" height="60"
                                    alt="brand" />
                            </div>
                            <div class="shop-products owl-carousel owl-theme dots-simple" data-owl-options="{
                                'loop': false,
                                'dots': true,
                                'nav': false,
                                'items': 2,
                                'margin': 30
                            }">
                                <div class="product-default inner-quickview inner-icon">
                                    <figure>
                                        <a href="demo42-product.html">
                                            <img src="{{url('/')}}/assets/home/images/demoes/demo42/product/product11-300x300.jpg"
                                                width="300" height="300" alt="product">
                                        </a>
                                        <div class="btn-icon-group">
                                            <a href="#" class="btn-icon btn-add-cart product-type-simple"><i
                                                    class="icon-shopping-cart"></i></a>
                                        </div>
                                        <a href="ajax/product-quick-view.html" class="btn-quickview"
                                            title="Quick View">Quick
                                            View</a>
                                    </figure>
                                    <div class="product-details">
                                        <div class="category-wrap">
                                            <div class="category-list">
                                                <a href="#">Sound & Video</a>
                                            </div>
                                            <a href="wishlist.html" class="btn-icon-wish" title="wishlist"><i
                                                    class="icon-heart"></i></a>
                                        </div>
                                        <h3 class="product-title">
                                            <a href="demo42-product.html">Product Short Name</a>
                                        </h3>
                                        <div class="ratings-container">
                                            <div class="product-ratings">
                                                <span class="ratings" style="width:80%"></span>
                                                <!-- End .ratings -->
                                                <span class="tooltiptext tooltip-top"></span>
                                            </div><!-- End .product-ratings -->
                                        </div><!-- End .product-container -->
                                        <div class="price-box">
                                            <span class="product-price">$299.00</span>
                                        </div><!-- End .price-box -->
                                    </div><!-- End .product-details -->
                                </div>
                                <div class="product-default inner-quickview inner-icon">
                                    <figure>
                                        <a href="demo42-product.html">
                                            <img src="{{url('/')}}/assets/home/images/demoes/demo42/product/product6-300x300.jpg"
                                                width="300" height="300" alt="product">
                                        </a>
                                        <div class="label-group">
                                            <span class="product-label label-sale">-35%</span>
                                        </div>
                                        <div class="btn-icon-group">
                                            <a href="#" class="btn-icon btn-add-cart product-type-simple"><i
                                                    class="icon-shopping-cart"></i></a>
                                        </div>
                                        <a href="ajax/product-quick-view.html" class="btn-quickview"
                                            title="Quick View">Quick
                                            View</a>
                                    </figure>
                                    <div class="product-details">
                                        <div class="category-wrap">
                                            <div class="category-list">
                                                <a href="#">External Accessories</a>,
                                                <a href="#">Hot Deals</a>
                                            </div>
                                            <a href="wishlist.html" class="btn-icon-wish" title="wishlist"><i
                                                    class="icon-heart"></i></a>
                                        </div>
                                        <h3 class="product-title">
                                            <a href="demo42-product.html">Product Short Name</a>
                                        </h3>
                                        <div class="ratings-container">
                                            <div class="product-ratings">
                                                <span class="ratings" style="width:0%"></span>
                                                <!-- End .ratings -->
                                                <span class="tooltiptext tooltip-top"></span>
                                            </div><!-- End .product-ratings -->
                                        </div><!-- End .product-container -->
                                        <div class="price-box">
                                            <del class="old-price">$199.00</del>
                                            <span class="product-price">$129.00</span>
                                        </div><!-- End .price-box -->
                                    </div><!-- End .product-details -->
                                </div>
                                <div class="product-default inner-quickview inner-icon">
                                    <figure>
                                        <a href="demo42-product.html">
                                            <img src="{{url('/')}}/assets/home/images/demoes/demo42/product/product7-300x300.jpg"
                                                width="300" height="300" alt="product">
                                        </a>
                                        <div class="label-group">
                                            <span class="product-label label-hot">HOT</span>
                                            <span class="product-label label-sale">-35%</span>
                                        </div>
                                        <div class="btn-icon-group">
                                            <a href="#" class="btn-icon btn-add-cart product-type-simple"><i
                                                    class="icon-shopping-cart"></i></a>
                                        </div>
                                        <a href="ajax/product-quick-view.html" class="btn-quickview"
                                            title="Quick View">Quick
                                            View</a>
                                    </figure>
                                    <div class="product-details">
                                        <div class="category-wrap">
                                            <div class="category-list">
                                                <a href="#">Interior Accessories</a>
                                            </div>
                                            <a href="wishlist.html" class="btn-icon-wish" title="wishlist"><i
                                                    class="icon-heart"></i></a>
                                        </div>
                                        <h3 class="product-title">
                                            <a href="demo42-product.html">Product Short Name</a>
                                        </h3>
                                        <div class="ratings-container">
                                            <div class="product-ratings">
                                                <span class="ratings" style="width:0%"></span>
                                                <!-- End .ratings -->
                                                <span class="tooltiptext tooltip-top"></span>
                                            </div><!-- End .product-ratings -->
                                        </div><!-- End .product-container -->
                                        <div class="price-box">
                                            <del class="old-price">$199.00</del>
                                            <span class="product-price">$129.00</span>
                                        </div><!-- End .price-box -->
                                    </div><!-- End .product-details -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section class="call-section appear-animate" style="background-color: #212529;">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-lg-7">
                            <h4 class="text-white text-uppercase">looking for help to
                                find auto parts?</h4>
                            <h2 class="text-white">Best Auto Parts Downtown Los Angeles CA</h2>
                            <h3>Call Us or Drop Us a Message Through Our Contact Form</h3>
                        </div>
                        <div class="col-lg-5 call-action">
                            <div class="d-inline-flex align-items-center text-left divider">
                                <i class="icon-phone-1 text-white mr-2"></i>
                                <h6 class="pt-1 line-height-1 text-uppercase text-white">Call us now<a href="tel:#"
                                        class="d-block text-white ls-10 pt-2">+123 5678 890</a></h6>
                            </div>
                            <a href="contact.html" class="btn btn-borders btn-rounded btn-outline-white ls-25">Send Us a
                                Message</a>
                        </div>
                    </div>
                </div>
                <svg class="custom-svg-3 appear-animate" data-animation-name="fadeIn" version="1.1"
                    xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                    viewBox="0 0 649 578">
                    <path fill="#f26100"
                        d="M-225.5,154.7l358.45,456.96c7.71,9.83,21.92,11.54,31.75,3.84l456.96-358.45c9.83-7.71,11.54-21.92,3.84-31.75
                        L267.05-231.66c-7.71-9.83-21.92-11.54-31.75-3.84l-456.96,358.45C-231.49,130.66-233.2,144.87-225.5,154.7z">
                    </path>
                    <path class="appear-animate appear-animate-svg" data-animation-name="customLineAnim"
                        data-animation-delay="300" data-animation-duration="5000" fill="none" stroke="#FFF"
                        stroke-width="1.5" stroke-miterlimit="10"
                        d="M416-21l202.27,292.91c5.42,7.85,3.63,18.59-4.05,24.25L198,603"></path>
                </svg>
            </section>
            <section class="product-section1 recently">
                <div class="container">
                    <h2 class="title title-underline pb-1 appear-animate" data-animation-name="fadeInLeftShorter">
                        Recently Arrived</h2>
                    <div class="owl-carousel owl-theme appear-animate" data-owl-options="{
                    'loop': false,
                    'dots': false,
                    'nav': true,
                    'margin': 20,
                    'responsive': {
                        '0': {
                            'items': 2
                        },
                        '576': {
                            'items': 4
                        },
                        '991': {
                            'items': 6
                        }
                    }
                }">
                        <div class="product-default inner-quickview inner-icon">
                            <figure>
                                <a href="demo42-product.html">
                                    <img src="{{url('/')}}/assets/home/images/demoes/demo42/product/product4-300x300.jpg" width="300"
                                        height="300" alt="product">
                                </a>
                                <div class="label-group">
                                    <span class="product-label label-sale">-13%</span>
                                </div>
                                <div class="btn-icon-group">
                                    <a href="#" class="btn-icon btn-add-cart product-type-simple"><i
                                            class="icon-shopping-cart"></i></a>
                                </div>
                                <a href="ajax/product-quick-view.html" class="btn-quickview" title="Quick View">Quick
                                    View</a>
                            </figure>
                            <div class="product-details">
                                <div class="category-wrap">
                                    <div class="category-list">
                                        <a href="#">Hot Deals</a>,
                                        <a href="#">Interior Accessories</a>
                                    </div>
                                    <a href="wishlist.html" class="btn-icon-wish" title="wishlist"><i
                                            class="icon-heart"></i></a>
                                </div>
                                <h3 class="product-title">
                                    <a href="demo42-product.html">Product Short Name</a>
                                </h3>
                                <div class="ratings-container">
                                    <div class="product-ratings">
                                        <span class="ratings" style="width:0%"></span>
                                        <!-- End .ratings -->
                                        <span class="tooltiptext tooltip-top"></span>
                                    </div><!-- End .product-ratings -->
                                </div><!-- End .product-container -->
                                <div class="price-box">
                                    <del class="old-price">$299.00</del>
                                    <span class="product-price">$259.00</span>
                                </div><!-- End .price-box -->
                            </div><!-- End .product-details -->
                        </div>
                        <div class="product-default inner-quickview inner-icon">
                            <figure>
                                <a href="demo42-product.html">
                                    <img src="{{url('/')}}/assets/home/images/demoes/demo42/product/product1-300x300.jpg" width="300"
                                        height="300" alt="product">
                                </a>
                                <div class="label-group">
                                    <span class="product-label label-sale">-13%</span>
                                </div>
                                <div class="btn-icon-group">
                                    <a href="#" class="btn-icon btn-add-cart product-type-simple"><i
                                            class="icon-shopping-cart"></i></a>
                                </div>
                                <a href="ajax/product-quick-view.html" class="btn-quickview" title="Quick View">Quick
                                    View</a>
                            </figure>
                            <div class="product-details">
                                <div class="category-wrap">
                                    <div class="category-list">
                                        <a href="#">External Accessories</a>,
                                        <a href="#">Hot Deals</a>
                                    </div>
                                    <a href="wishlist.html" class="btn-icon-wish" title="wishlist"><i
                                            class="icon-heart"></i></a>
                                </div>
                                <h3 class="product-title">
                                    <a href="demo42-product.html">Product Short Name</a>
                                </h3>
                                <div class="ratings-container">
                                    <div class="product-ratings">
                                        <span class="ratings" style="width:0%"></span>
                                        <!-- End .ratings -->
                                        <span class="tooltiptext tooltip-top"></span>
                                    </div><!-- End .product-ratings -->
                                </div><!-- End .product-container -->
                                <div class="price-box">
                                    <del class="old-price">$299.00</del>
                                    <span class="product-price">$259.00</span>
                                </div><!-- End .price-box -->
                            </div><!-- End .product-details -->
                        </div>
                        <div class="product-default inner-quickview inner-icon">
                            <figure>
                                <a href="demo42-product.html">
                                    <img src="{{url('/')}}/assets/home/images/demoes/demo42/product/product15-300x300.jpg" width="300"
                                        height="300" alt="product">
                                </a>
                                <div class="label-group">
                                    <span class="product-label label-sale">-13%</span>
                                </div>
                                <div class="btn-icon-group">
                                    <a href="#" class="btn-icon btn-add-cart product-type-simple"><i
                                            class="icon-shopping-cart"></i></a>
                                </div>
                                <a href="ajax/product-quick-view.html" class="btn-quickview" title="Quick View">Quick
                                    View</a>
                            </figure>
                            <div class="product-details">
                                <div class="category-wrap">
                                    <div class="category-list">
                                        <a href="#">Interior Accessories</a>
                                    </div>
                                    <a href="wishlist.html" class="btn-icon-wish" title="wishlist"><i
                                            class="icon-heart"></i></a>
                                </div>
                                <h3 class="product-title">
                                    <a href="demo42-product.html">Product Short Name</a>
                                </h3>
                                <div class="ratings-container">
                                    <div class="product-ratings">
                                        <span class="ratings" style="width:0%"></span>
                                        <!-- End .ratings -->
                                        <span class="tooltiptext tooltip-top"></span>
                                    </div><!-- End .product-ratings -->
                                </div><!-- End .product-container -->
                                <div class="price-box">
                                    <del class="old-price">$299.00</del>
                                    <span class="product-price">$259.00</span>
                                </div><!-- End .price-box -->
                            </div><!-- End .product-details -->
                        </div>
                        <div class="product-default inner-quickview inner-icon">
                            <figure>
                                <a href="demo42-product.html">
                                    <img src="{{url('/')}}/assets/home/images/demoes/demo42/product/product11-300x300.jpg" width="300"
                                        height="300" alt="product">
                                </a>
                                <div class="btn-icon-group">
                                    <a href="#" class="btn-icon btn-add-cart product-type-simple"><i
                                            class="icon-shopping-cart"></i></a>
                                </div>
                                <a href="ajax/product-quick-view.html" class="btn-quickview" title="Quick View">Quick
                                    View</a>
                            </figure>
                            <div class="product-details">
                                <div class="category-wrap">
                                    <div class="category-list">
                                        <a href="#">Sound & Video</a>
                                    </div>
                                    <a href="wishlist.html" class="btn-icon-wish" title="wishlist"><i
                                            class="icon-heart"></i></a>
                                </div>
                                <h3 class="product-title">
                                    <a href="demo42-product.html">Product Short Name</a>
                                </h3>
                                <div class="ratings-container">
                                    <div class="product-ratings">
                                        <span class="ratings" style="width:80%"></span>
                                        <!-- End .ratings -->
                                        <span class="tooltiptext tooltip-top"></span>
                                    </div><!-- End .product-ratings -->
                                </div><!-- End .product-container -->
                                <div class="price-box">
                                    <span class="product-price">$299.00</span>
                                </div><!-- End .price-box -->
                            </div><!-- End .product-details -->
                        </div>
                        <div class="product-default inner-quickview inner-icon">
                            <figure>
                                <a href="demo42-product.html">
                                    <img src="{{url('/')}}/assets/home/images/demoes/demo42/product/product14-300x300.jpg" width="300"
                                        height="300" alt="product">
                                </a>
                                <div class="btn-icon-group">
                                    <a href="#" class="btn-icon btn-add-cart product-type-simple"><i
                                            class="icon-shopping-cart"></i></a>
                                </div>
                                <a href="ajax/product-quick-view.html" class="btn-quickview" title="Quick View">Quick
                                    View</a>
                            </figure>
                            <div class="product-details">
                                <div class="category-wrap">
                                    <div class="category-list">
                                        <a href="#">Lanterns & lighting</a>
                                    </div>
                                    <a href="wishlist.html" class="btn-icon-wish" title="wishlist"><i
                                            class="icon-heart"></i></a>
                                </div>
                                <h3 class="product-title">
                                    <a href="demo42-product.html">Product Short Name</a>
                                </h3>
                                <div class="ratings-container">
                                    <div class="product-ratings">
                                        <span class="ratings" style="width:0%"></span>
                                        <!-- End .ratings -->
                                        <span class="tooltiptext tooltip-top"></span>
                                    </div><!-- End .product-ratings -->
                                </div><!-- End .product-container -->
                                <div class="price-box">
                                    <span class="product-price">$55.00</span>
                                </div><!-- End .price-box -->
                            </div><!-- End .product-details -->
                        </div>
                        <div class="product-default inner-quickview inner-icon">
                            <figure>
                                <a href="demo42-product.html">
                                    <img src="{{url('/')}}/assets/home/images/demoes/demo42/product/product7-300x300.jpg" width="300"
                                        height="300" alt="product">
                                </a>
                                <div class="label-group">
                                    <span class="product-label label-hot">HOT</span>
                                    <span class="product-label label-sale">-35%</span>
                                </div>
                                <div class="btn-icon-group">
                                    <a href="#" class="btn-icon btn-add-cart product-type-simple"><i
                                            class="icon-shopping-cart"></i></a>
                                </div>
                                <a href="ajax/product-quick-view.html" class="btn-quickview" title="Quick View">Quick
                                    View</a>
                            </figure>
                            <div class="product-details">
                                <div class="category-wrap">
                                    <div class="category-list">
                                        <a href="#">Interior Accessories</a>
                                    </div>
                                    <a href="wishlist.html" class="btn-icon-wish" title="wishlist"><i
                                            class="icon-heart"></i></a>
                                </div>
                                <h3 class="product-title">
                                    <a href="demo42-product.html">Product Short Name</a>
                                </h3>
                                <div class="ratings-container">
                                    <div class="product-ratings">
                                        <span class="ratings" style="width:0%"></span>
                                        <!-- End .ratings -->
                                        <span class="tooltiptext tooltip-top"></span>
                                    </div><!-- End .product-ratings -->
                                </div><!-- End .product-container -->
                                <div class="price-box">
                                    <span class="product-price">$299.00</span>
                                </div><!-- End .price-box -->
                            </div><!-- End .product-details -->
                        </div>
                    </div>
                </div>
            </section>
            <section class="subcats-section container">
                <div class="row">
                    <div class="col-md-4 part-item appear-animate" data-animation-name="fadeInLeftShorter">
                        <h3>Popular Parts:</h3>
                        <ul class="list-unstyled mb-0">
                            <li><a href="#">Brake Pads &amp; Shoes</a></li>
                            <li><a href="#">Brake Rotors</a></li>
                            <li><a href="#">Alternators</a></li>
                            <li><a href="#">Water Pumps</a></li>
                            <li><a class="show-action" href="#">Show All</a></li>
                        </ul>
                    </div>
                    <div class="col-md-4 part-item appear-animate" data-animation-name="fadeInLeftShorter"
                        data-animation-delay="200">
                        <h3>Popular Makes:</h3>
                        <ul class="list-unstyled mb-0">
                            <li><a href="#">Ford Parts</a></li>
                            <li><a href="#">Chevrolet Parts</a></li>
                            <li><a href="#">Honda Parts</a></li>
                            <li><a href="#">Dodge Parts</a></li>
                            <li><a class="show-action" href="#">Show All</a></li>
                        </ul>
                    </div>
                    <div class="col-md-4 part-item appear-animate" data-animation-name="fadeInLeftShorter"
                        data-animation-delay="400">
                        <h3>Routine Parts:</h3>
                        <ul class="list-unstyled mb-0">
                            <li><a href="#">Spark Plugs</a></li>
                            <li><a href="#">Car Batteries</a></li>
                            <li><a href="#">Oil Filters</a></li>
                            <li><a href="#">Motor Oil</a></li>
                            <li><a class="show-action" href="#">Show All</a></li>
                        </ul>
                    </div>

                </div>
            </section>
        </main>
        <!-- End .main -->

        <footer class="footer bg-dark position-relative">
            <div class="footer-middle">
                <div class="container position-static">
                    <div class="row">
                        <div class="col-lg-2 col-sm-6 pb-2 pb-sm-0 d-flex align-items-center">
                            <div class="widget m-b-3">
                                <img src="{{url('/')}}/assets/home/images/demoes/demo42/footer-logo.png" alt="Logo" width="202"
                                    height="54" class="logo-footer">
                            </div><!-- End .widget -->
                        </div><!-- End .col-lg-3 -->

                        <div class="col-lg-3 col-sm-6 pb-4 pb-sm-0">
                            <div class="widget mb-2">
                                <h4 class="widget-title mb-1 pb-1">Get In Touch</h4>
                                <ul class="contact-info">
                                    <li>
                                        <span class="contact-info-label">Address:</span>123 Street Name, City, England
                                    </li>
                                    <li>
                                        <span class="contact-info-label">Phone:</span><a href="tel:">Toll Free (123)
                                            456-7890</a>
                                    </li>
                                    <li>
                                        <span class="contact-info-label">Email:</span> <a href="https://portotheme.com/cdn-cgi/l/email-protection#cca1ada5a08ca9b4ada1bca0a9e2afa3a1"><span class="__cf_email__" data-cfemail="f895999194b89d80999588949dd69b9795">[email&#160;protected]</span></a>
                                    </li>
                                    <li>
                                        <span class="contact-info-label">Working Days/Hours:</span>
                                        Mon - Sun / 9:00 AM - 8:00 PM
                                    </li>
                                </ul>
                                <div class="social-icons">
                                    <a href="#" class="social-icon social-facebook icon-facebook" target="_blank"
                                        title="Facebook"></a>
                                    <a href="#" class="social-icon social-twitter icon-twitter" target="_blank"
                                        title="Twitter"></a>
                                    <a href="#" class="social-icon social-linkedin fab fa-linkedin-in" target="_blank"
                                        title="Linkedin"></a>
                                </div><!-- End .social-icons -->
                            </div><!-- End .widget -->
                        </div><!-- End .col-lg-3 -->

                        <div class="col-lg-3 col-sm-6 pb-2 pb-sm-0">
                            <div class="widget">
                                <h4 class="widget-title pb-1">Customer Services</h4>

                                <ul class="links">
                                    <li><a href="#">Help &amp; FAQs</a></li>
                                    <li><a href="#">Order Tracking</a></li>
                                    <li><a href="#">Shipping &amp; Delivery</a></li>
                                    <li><a href="#">Orders History</a></li>
                                    <li><a href="#">Advanced Search</a></li>
                                    <li><a href="login.html">Login</a></li>
                                    <li><a href="#">Careers</a></li>
                                    <li><a href="demo1-about.html">About Us</a></li>
                                    <li><a href="#">Corporate Sales</a></li>
                                </ul>
                            </div><!-- End .widget -->
                        </div><!-- End .col-lg-3 -->

                        <div class="col-lg-4 col-sm-6 pb-0">
                            <div class="widget widget-newsletter mb-1 mb-sm-3">
                                <h4 class="widget-title">Subscribe Newsletter</h4>

                                <p class="mb-2">Get all the latest information on events, sales and offers.
                                    Sign up for newsletter:</p>
                                <form action="#" class="d-flex mb-0 w-100">
                                    <input type="email" class="form-control mb-0" placeholder="Email address"
                                        required="">

                                    <input type="submit" class="btn shadow-none" value="OK">
                                </form>
                            </div><!-- End .widget -->
                        </div><!-- End .col-lg-3 -->
                    </div><!-- End .row -->
                </div><!-- End .container -->
            </div><!-- End .footer-middle -->

            <div class="container">
                <div class="footer-bottom d-sm-flex align-items-center bg-dark">
                    <div class="footer-left">
                        <span class="footer-copyright">Porto eCommerce. © 2021. All Rights Reserved</span>
                    </div>

                    <div class="footer-right ml-auto mt-1 mt-sm-0">
                        <div class="payment-icons">
                            <span class="payment-icon visa"
                                style="background-image: url(assets/images/payments/payment-visa.svg)"></span>
                            <span class="payment-icon paypal"
                                style="background-image: url(assets/images/payments/payment-paypal.svg)"></span>
                            <span class="payment-icon stripe"
                                style="background-image: url(assets/images/payments/payment-stripe.png)"></span>
                            <span class="payment-icon verisign"
                                style="background-image:  url(assets/images/payments/payment-verisign.svg)"></span>
                        </div>
                    </div>
                </div>
            </div><!-- End .footer-bottom -->
        </footer>
    </div><!-- End .page-wrapper -->

    <div class="loading-overlay">
        <div class="bounce-loader">
            <div class="bounce1"></div>
            <div class="bounce2"></div>
            <div class="bounce3"></div>
        </div>
    </div>

    <div class="mobile-menu-overlay"></div><!-- End .mobil-menu-overlay -->

    <div class="mobile-menu-container">
        <div class="mobile-menu-wrapper">
            <span class="mobile-menu-close"><i class="fa fa-times"></i></span>
            <nav class="mobile-nav">
                <ul class="mobile-menu">
                    <li><a href="demo42.html">Home</a></li>
                    <li>
                        <a href="demo42-shop.html" title="shop">Categories</a>
                        <ul>
                            <li><a href="category.html">Full Width Banner</a></li>
                            <li><a href="category-banner-boxed-slider.html">Boxed Slider Banner</a></li>
                            <li><a href="category-banner-boxed-image.html">Boxed Image Banner</a></li>
                            <li><a href="https://www.portotheme.com/html/porto_ecommerce/category-sidebar-left.html">Left Sidebar</a></li>
                            <li><a href="category-sidebar-right.html">Right Sidebar</a></li>
                            <li><a href="category-off-canvas.html">Off Canvas Filter</a></li>
                            <li><a href="category-horizontal-filter1.html">Horizontal Filter 1</a></li>
                            <li><a href="category-horizontal-filter2.html">Horizontal Filter 2</a></li>
                            <li><a href="#">List Types</a></li>
                            <li><a href="category-infinite-scroll.html">Ajax Infinite Scroll<span
                                        class="tip tip-new">New</span></a></li>
                            <li><a href="demo42-shop.html" title="shop">3 Columns Products</a></li>
                            <li><a href="category-4col.html">4 Columns Products</a></li>
                            <li><a href="category-5col.html">5 Columns Products</a></li>
                            <li><a href="category-6col.html">6 Columns Products</a></li>
                            <li><a href="category-7col.html">7 Columns Products</a></li>
                            <li><a href="category-8col.html">8 Columns Products</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="demo42-product.html">Products</a>
                        <ul>
                            <li>
                                <a href="#" class="nolink">PRODUCT PAGES</a>
                                <ul>
                                    <li><a href="product.html">SIMPLE PRODUCT</a></li>
                                    <li><a href="product-variable.html">VARIABLE PRODUCT</a></li>
                                    <li><a href="product.html">SALE PRODUCT</a></li>
                                    <li><a href="product.html">FEATURED & ON SALE</a></li>
                                    <li><a href="product-sticky-info.html">WIDTH CUSTOM TAB</a></li>
                                    <li><a href="product-sidebar-left.html">WITH LEFT SIDEBAR</a></li>
                                    <li><a href="product-sidebar-right.html">WITH RIGHT SIDEBAR</a></li>
                                    <li><a href="product-addcart-sticky.html">ADD CART STICKY</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#" class="nolink">PRODUCT LAYOUTS</a>
                                <ul>
                                    <li><a href="product-extended-layout.html">EXTENDED LAYOUT</a></li>
                                    <li><a href="product-grid-layout.html">GRID IMAGE</a></li>
                                    <li><a href="product-full-width.html">FULL WIDTH LAYOUT</a></li>
                                    <li><a href="product-sticky-info.html">STICKY INFO</a></li>
                                    <li><a href="product-sticky-both.html">LEFT & RIGHT STICKY</a></li>
                                    <li><a href="product-transparent-image.html">TRANSPARENT IMAGE</a></li>
                                    <li><a href="product-center-vertical.html">CENTER VERTICAL</a></li>
                                    <li><a href="#">BUILD YOUR OWN</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">Pages<span class="tip tip-hot">Hot!</span></a>
                        <ul>
                            <li>
                                <a href="wishlist.html">Wishlist</a>
                            </li>
                            <li>
                                <a href="cart.html">Shopping Cart</a>
                            </li>
                            <li>
                                <a href="checkout.html">Checkout</a>
                            </li>
                            <li>
                                <a href="dashboard.html">Dashboard</a>
                            </li>
                            <li>
                                <a href="login.html">Login</a>
                            </li>
                            <li>
                                <a href="forgot-password.html">Forgot Password</a>
                            </li>
                        </ul>
                    </li>
                    <li><a href="blog.html">Blog</a></li>
                    <li>
                        <a href="#">Elements</a>
                        <ul class="custom-scrollbar">
                            <li><a href="element-accordions.html">Accordion</a></li>
                            <li><a href="element-alerts.html">Alerts</a></li>
                            <li><a href="element-animations.html">Animations</a></li>
                            <li><a href="element-banners.html">Banners</a></li>
                            <li><a href="element-buttons.html">Buttons</a></li>
                            <li><a href="element-call-to-action.html">Call to Action</a></li>
                            <li><a href="element-countdown.html">Count Down</a></li>
                            <li><a href="element-counters.html">Counters</a></li>
                            <li><a href="element-headings.html">Headings</a></li>
                            <li><a href="element-icons.html">Icons</a></li>
                            <li><a href="element-info-box.html">Info box</a></li>
                            <li><a href="element-posts.html">Posts</a></li>
                            <li><a href="element-products.html">Products</a></li>
                            <li><a href="element-product-categories.html">Product Categories</a></li>
                            <li><a href="element-tabs.html">Tabs</a></li>
                            <li><a href="element-testimonial.html">Testimonials</a></li>
                        </ul>
                    </li>
                </ul>

                <ul class="mobile-menu mt-2 mb-2">
                    <li class="border-0">
                        <a href="#">
                            Special Offer!
                        </a>
                    </li>
                    <li class="border-0">
                        <a href="https://1.envato.market/DdLk5" target="_blank" rel="noopener" title="buy-porto">
                            Buy Porto!
                            <span class="tip tip-hot">Hot</span>
                        </a>
                    </li>
                </ul>

                <ul class="mobile-menu">
                    <li><a href="login.html">My Account</a></li>
                    <li><a href="contact.html">Contact Us</a></li>
                    <li><a href="blog.html">Blog</a></li>
                    <li><a href="wishlist.html">My Wishlist</a></li>
                    <li><a href="cart.html">Cart</a></li>
                    <li><a href="login.html" class="login-link">Log In</a></li>
                </ul>
            </nav><!-- End .mobile-nav -->

            <form class="search-wrapper mb-2" action="#">
                <input type="text" class="form-control mb-0" placeholder="Search..." required />
                <button class="btn icon-search text-white bg-transparent p-0" title="submit" type="submit"></button>
            </form>

            <div class="social-icons">
                <a href="#" class="social-icon social-facebook icon-facebook" target="_blank" title="facebook">
                </a>
                <a href="#" class="social-icon social-twitter icon-twitter" target="_blank" title="twitter">
                </a>
                <a href="#" class="social-icon social-instagram icon-instagram" target="_blank" title="instagram">
                </a>
            </div>
        </div><!-- End .mobile-menu-wrapper -->
    </div><!-- End .mobile-menu-container -->

    <div class="sticky-navbar">
        <div class="sticky-info">
            <a href="demo42.html">
                <i class="icon-home"></i>Home
            </a>
        </div>
        <div class="sticky-info">
            <a href="demo42-shop.html" class="">
                <i class="icon-bars"></i>Categories
            </a>
        </div>
        <div class="sticky-info">
            <a href="wishlist.html" class="">
                <i class="icon-wishlist-2"></i>Wishlist
            </a>
        </div>
        <div class="sticky-info">
            <a href="login.html" class="">
                <i class="icon-user-2"></i>Account
            </a>
        </div>
        <div class="sticky-info">
            <a href="cart.html" class="">
                <i class="icon-shopping-cart position-relative">
                    <span class="cart-count badge-circle">3</span>
                </i>Cart
            </a>
        </div>
    </div>

    <div class="newsletter-popup mfp-hide bg-img" id="newsletter-popup-form"
        style="background: #f1f1f1 no-repeat center/cover url(assets/images/newsletter_popup_bg.jpg)">
        <div class="newsletter-popup-content">
            <img src="{{url('/')}}/assets/home/images/logo-black.png" alt="Logo" class="logo-newsletter" width="111" height="44">
            <h2>Subscribe to newsletter</h2>

            <p>
                Subscribe to the Porto mailing list to receive updates on new
                arrivals, special offers and our promotions.
            </p>

            <form action="#">
                <div class="input-group">
                    <input type="email" class="form-control" id="newsletter-email" name="newsletter-email"
                        placeholder="Your email address" required />
                    <input type="submit" class="btn btn-primary" value="Submit" />
                </div>
            </form>
            <div class="newsletter-subscribe">
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" value="0" id="show-again" />
                    <label for="show-again" class="custom-control-label">
                        Don't show this popup again
                    </label>
                </div>
            </div>
        </div><!-- End .newsletter-popup-content -->

        <button title="Close (Esc)" type="button" class="mfp-close">
            ×
        </button>
    </div><!-- End .newsletter-popup -->

    <a id="scroll-top" href="#top" title="Top" role="button"><i class="icon-angle-up"></i></a>

    <!-- Plugins JS File -->
    <script src="{{url('/')}}/assets/home/js/jquery.min.js"></script>
    <script src="{{url('/')}}/assets/home/js/bootstrap.bundle.min.js"></script>
    <script src="{{url('/')}}/assets/home/js/optional/isotope.pkgd.min.js"></script>
    <script src="{{url('/')}}/assets/home/js/plugins.min.js"></script>
    <script src="{{url('/')}}/assets/home/js/jquery.appear.min.js"></script>
    <script src="{{url('/')}}/assets/home/js/jquery.plugin.min.js"></script>

    <!-- Main JS File -->
    <script src="{{url('/')}}/assets/home/js/main.min.js"></script>
    <script>
        $(document).on('click', '#btnSSave', async function () {
            let formData=await getData();
            swal({
                title: "Are you sure?",
                text: "You want @if($isEdit==true)Update @else Save @endif this customer!",
                type: "warning",
                showCancelButton: true,
                confirmButtonClass: "btn-outline-success",
                confirmButtonText: "Yes, @if($isEdit==true) Update @else Save @endif it!",
                closeOnConfirm: false
            },function(){
                swal.close();
                let postUrl=@if($isEdit) "{{url('/')}}/admin/users-and-permissions/manage-customers/edit/{{$CustomerID}}" @else "{{url('/')}}/admin/users-and-permissions/manage-customers/create" @endif;
                $.ajax({
                    type:"post",
                    url:postUrl,
                    headers: { 'X-CSRF-Token' : $('meta[name=_token]').attr('content') },
                    data:formData,
                    cache: false,
                    processData: false,
                    contentType: false,
                    error:function(e, x, settings, exception){ajax_errors(e, x, settings, exception);},
                    complete: function(e, x, settings, exception){btnReset($('#btnSave'));ajaxIndicatorStop();$("html, body").animate({ scrollTop: 0 }, "slow");},
                    success:function(response){
                        if(response.status==true){
                            swal({
                                title: "SUCCESS",
                                text: response.message,
                                type: "success",
                                showCancelButton: false,
                                confirmButtonClass: "btn-outline-success",
                                confirmButtonText: "Okay",
                                closeOnConfirm: false
                            },function(){
                                @if($isEdit==true)
                                    window.location.replace("{{url('/')}}/admin/users-and-permissions/manage-customers");
                                @else
                                    window.location.reload();
                                @endif
                            });
                        }else{
                            $('.tab').hide();
                            currentTab = 0;
                            showTab(currentTab);
                            setTimeout(() => {
                                $('#nextBtn').html('Next');
                            }, 100);
                            toastr.error(response.message, "Failed", {
                                positionClass: "toast-top-right",
                                containerId: "toast-top-right",
                                showMethod: "slideDown",
                                hideMethod: "slideUp",
                                progressBar: !0
                            })
                            if(response['errors']!=undefined){
                                $('.errors').html('');
                                $.each( response['errors'], function( KeyName, KeyValue ) {
                                    var key=KeyName;
                                    if(key=="Email"){$('#txtEmail-err').html(KeyValue);}
                                    if(key=="MobileNo1"){$('#txtMobileNo1-err').html(KeyValue);}
                                    if(key=="CustomerImage"){$('#txtCustomerImage-err').html(KeyValue);}

                                });
                            }
                        }
                    }
                });
            });
        });
    </script>
</body>
</html>