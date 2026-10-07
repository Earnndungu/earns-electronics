<?php require_once __DIR__.'/config.php'; ?>
<!doctype html>
<html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title><?=e(STORE_NAME)?></title><link rel="stylesheet" href="assets/css/store.css"></head>
<body>
<header><div class="nav"><a class="brand" href="index.php">Earns Electronics<small>& MOBILE STORE</small></a>
<nav><a href="#products">Shop</a><a href="customer/login.php">Account</a><button onclick="openCart()">Cart (<span id="cartCount">0</span>)</button><a class="adminLink" href="admin/login.php">Admin</a></nav></div></header>
<section class="hero"><div><span>ONLINE ELECTRONICS STORE</span><h1>Smart tech.<br>Simple shopping.</h1><p>Phones, electronics and accessories with convenient ordering, delivery and pickup.</p><a class="primary" href="#products">Shop now</a></div></section>
<main class="wrap" id="products"><div class="toolbar"><div><h2>Featured products</h2><p>Quality products at competitive prices.</p></div><div><input id="search" placeholder="Search products..." oninput="loadProducts()"><select id="category" onchange="loadProducts()"><option value="">All categories</option></select></div></div><div id="productsGrid" class="grid"></div></main>
<div id="cartModal" class="modal"><div class="modalBox"><button class="close" onclick="closeCart()">×</button><h2>Your Cart</h2><div id="cartItems"></div><div id="cartTotal"></div><button class="primary full" onclick="checkout()">Proceed to checkout</button></div></div>
<div id="checkoutModal" class="modal"><div class="modalBox"><button class="close" onclick="closeCheckout()">×</button><h2>Checkout</h2><div id="checkoutArea"></div></div></div>
<footer><div class="wrap"><b>Earns Electronics & Mobile Store</b><p>Phones • Electronics • Accessories • Delivery • Pickup</p></div></footer>
<script src="assets/js/store.js"></script></body></html>
