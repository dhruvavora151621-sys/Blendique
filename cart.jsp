<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.math.BigDecimal,java.math.RoundingMode" %>
<%@ page import="com.blendique.CartItem" %>
<%
ArrayList<CartItem> cart =
    (ArrayList<CartItem>) session.getAttribute("blendiqueCart");

if (cart == null) {
    response.sendRedirect(request.getContextPath() + "/CartServlet");
    return;
}

int itemCount = 0;
BigDecimal subtotal = BigDecimal.ZERO;

for (CartItem item : cart) {
    itemCount += item.getQuantity();

    subtotal = subtotal.add(
        item.getPrice().multiply(
            BigDecimal.valueOf(item.getQuantity())
        )
    );
}

BigDecimal packaging = cart.isEmpty()
    ? BigDecimal.ZERO : new BigDecimal("15.00");

BigDecimal tax = subtotal.add(packaging)
    .multiply(new BigDecimal("0.05"))
    .setScale(2, RoundingMode.HALF_UP);

BigDecimal discount =
    subtotal.compareTo(new BigDecimal("300.00")) >= 0
    ? new BigDecimal("50.00") : BigDecimal.ZERO;

BigDecimal grandTotal =
    subtotal.add(packaging).add(tax).subtract(discount);

String ctx = request.getContextPath();
String orderId = request.getParameter("orderId");
%>

<!DOCTYPE html>

<html lang="en"><head><meta charset="utf-8"/><meta content="width=device-width, initial-scale=1.0" name="viewport"/><meta content="web_standard" name="shell-type"/><link href="https://fonts.googleapis.com" rel="preconnect"/><link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/><link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&amp;family=Syne:wght@700;800&amp;display=swap" rel="stylesheet"/><link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/><style>@layer base{html,body{margin:0;padding:0;}body{overscroll-behavior:none;}main>:first-child{margin-top:0!important;}main>:last-child{margin-bottom:0!important;}}::-webkit-scrollbar{display:none;}</style><script src="https://cdn.tailwindcss.com"></script><script id="tailwind-config">tailwind.config={darkMode:"class",theme:{extend:{"colors":{"outline-variant":"#d8c1bf","on-secondary-container":"#3d657e","secondary":"#3a637b","on-error-container":"#93000a","secondary-container":"#b9e2ff","on-background":"#1b1b1d","on-secondary":"#ffffff","surface-container-high":"#eae7ea","primary-container":"#71352f","on-surface":"#1b1b1d","on-tertiary-fixed":"#0d1d25","inverse-primary":"#ffb4ab","surface-bright":"#fcf8fb","surface-container-lowest":"#ffffff","on-primary-fixed":"#390b08","on-surface-variant":"#534341","on-error":"#ffffff","surface-container":"#f0edef","primary-fixed-dim":"#ffb4ab","error":"#ba1a1a","error-container":"#ffdad6","surface-dim":"#dcd9dc","surface":"#fcf8fb","on-tertiary-fixed-variant":"#394952","inverse-on-surface":"#f3f0f2","surface-tint":"#8d4c45","primary-fixed":"#ffdad6","on-primary":"#ffffff","outline":"#867370","on-secondary-fixed-variant":"#204b62","on-tertiary-container":"#a7b8c2","on-primary-container":"#f3a096","on-primary-fixed-variant":"#71352f","secondary-fixed-dim":"#a3cce8","tertiary-container":"#394952","on-tertiary":"#ffffff","tertiary-fixed":"#d4e5f0","tertiary-fixed-dim":"#b8c9d4","surface-container-highest":"#e4e2e4","background":"#fcf8fb","primary":"#551f1b","tertiary":"#23333b","surface-variant":"#e4e2e4","surface-container-low":"#f6f3f5","on-secondary-fixed":"#001e2d","inverse-surface":"#303032","secondary-fixed":"#c5e7ff"},"borderRadius":{"DEFAULT":"1rem","lg":"2rem","xl":"3rem","full":"9999px"},"spacing":{"margin":"1.25rem","space-lg":"1.5rem","space-xl":"2.5rem","space-2xl":"4rem","gutter-desktop":"2rem","gutter":"1.5rem","margin-desktop":"3rem","space-sm":"0.5rem","space-xs":"0.25rem","space-md":"1rem"},"fontFamily":{"body-md":["Plus Jakarta Sans"],"body-sm":["Plus Jakarta Sans"],"display":["Syne"],"body-lg":["Plus Jakarta Sans"],"label-sticker":["Syne"],"headline-sm":["Syne"],"display-mobile":["Syne"],"headline-lg-mobile":["Syne"],"label-lg":["Plus Jakarta Sans"],"label-md":["Plus Jakarta Sans"],"headline-md":["Syne"],"headline-lg":["Syne"]},"fontSize":{"body-md":["1rem",{"lineHeight":"1.5rem","fontWeight":"400"}],"body-sm":["0.875rem",{"lineHeight":"1.35rem","fontWeight":"400"}],"display":["4.5rem",{"lineHeight":"4.75rem","letterSpacing":"-0.03em","fontWeight":"800"}],"body-lg":["1.125rem",{"lineHeight":"1.75rem","fontWeight":"400"}],"label-sticker":["0.75rem",{"lineHeight":"0.875rem","letterSpacing":"0.08em","fontWeight":"800"}],"headline-sm":["1.375rem",{"lineHeight":"1.75rem","fontWeight":"700"}],"display-mobile":["2.75rem",{"lineHeight":"3rem","letterSpacing":"-0.02em","fontWeight":"800"}],"headline-lg-mobile":["2rem",{"lineHeight":"2.25rem","letterSpacing":"-0.01em","fontWeight":"700"}],"label-lg":["0.875rem",{"lineHeight":"1.25rem","letterSpacing":"0.04em","fontWeight":"700"}],"label-md":["0.75rem",{"lineHeight":"1rem","letterSpacing":"0.06em","fontWeight":"700"}],"headline-md":["2rem",{"lineHeight":"2.35rem","letterSpacing":"-0.01em","fontWeight":"700"}],"headline-lg":["3rem",{"lineHeight":"3.25rem","letterSpacing":"-0.02em","fontWeight":"700"}]}}}};</script></head><body class="bg-background font-body-md text-on-surface antialiased"><header class="fixed top-0 w-full z-50 bg-surface/90 backdrop-blur-md shadow-[0_1px_8px_rgba(0,0,0,0.04)]"><div class="h-20 w-full px-margin-desktop flex items-center justify-between"><div class="flex items-center gap-space-sm"><a class="flex items-center gap-space-xs" data-path="home" href="#"><div class="px-space-md py-space-xs bg-primary-container text-on-primary rounded-full font-headline-sm text-headline-sm uppercase tracking-wider flex items-center gap-space-xs"><span class="material-symbols-outlined text-[20px] text-secondary-container">coffee</span><span>BLENDIQUE</span></div><div class="hidden sm:flex px-space-xs py-space-xs bg-secondary-container text-on-secondary-container rounded-full font-label-sticker text-label-sticker uppercase">Roasters • Atelier</div></a></div><nav class="hidden md:flex items-center gap-space-xs bg-surface-container-low px-space-xs py-space-xs rounded-full shadow-[0_1px_4px_rgba(0,0,0,0.02)]" data-active-classes="bg-primary-container text-on-primary font-bold"><a class="px-space-md py-space-xs rounded-full font-label-lg text-label-lg text-on-surface-variant hover:text-on-surface transition-all" data-path="home" href="#">Home</a><a class="px-space-md py-space-xs rounded-full font-label-lg text-label-lg text-on-surface-variant hover:text-on-surface transition-all" data-path="menu" href="#">Menu</a><a class="px-space-md py-space-xs rounded-full font-label-lg text-label-lg text-on-surface-variant hover:text-on-surface transition-all" data-path="customize" href="#">Customize</a><a class="px-space-md py-space-xs rounded-full font-label-lg text-label-lg text-on-surface-variant hover:text-on-surface transition-all" data-path="about-us" href="#">About Us</a></nav><div class="flex items-center gap-space-md"><a class="hidden sm:inline-flex items-center justify-center px-space-md py-space-xs rounded-full bg-secondary-container text-on-secondary-container font-label-lg text-label-lg hover:bg-secondary hover:text-on-secondary transition-all" data-path="login" href="#">Login / Register</a><button aria-label="Cart" class="relative p-space-xs rounded-full bg-surface-container text-on-surface hover:bg-surface-container-high transition-colors flex items-center justify-center" type="button"><span class="material-symbols-outlined text-[22px]">shopping_bag</span><span class="absolute -top-1 -right-1 w-5 h-5 rounded-full bg-primary-container text-on-primary font-label-sticker text-label-sticker flex items-center justify-center leading-none">3</span></button><div class="w-8 h-8 rounded-full bg-primary flex items-center justify-center"><span class="material-symbols-outlined text-on-primary text-[18px]">person</span></div></div></div></header><main class="w-full pt-20 bg-background"><div class="flex flex-col w-full">
<div class="w-full max-w-7xl mx-auto px-margin-desktop py-space-xl">
<!-- Top Editorial Header & Perk Banner -->
<div class="flex flex-col gap-space-lg mb-space-xl">
<div class="flex flex-col md:flex-row md:items-end justify-between gap-space-md">
<div>
<div class="inline-flex items-center gap-space-xs px-space-md py-space-xs rounded-full bg-secondary-container text-on-secondary-container shadow-sm mb-space-sm">
<span class="w-2 h-2 rounded-full bg-primary-container animate-pulse"></span>
<span class="font-label-sticker text-label-sticker uppercase tracking-wider">YOUR ARTISANAL ORDER • 3 ITEMS</span>
</div>
<h1 class="font-display text-display text-primary tracking-tight">Your Cart</h1>
<p class="font-body-lg text-body-lg text-on-surface-variant max-w-xl">
            Your favourite coffee moments are just a step away. Calibrated for peak sensory extraction.
          </p>
</div>
<div class="flex items-center gap-space-sm text-on-surface-variant bg-surface-container-low px-space-md py-space-sm rounded-full shadow-sm">
    <span class="material-symbols-outlined text-secondary text-[20px]">local_shipping</span>
</div>
</div>

<!-- Main Two-Column Desktop Split -->
<div class="grid grid-cols-1 lg:grid-cols-12 gap-gutter-desktop items-start">
<!-- LEFT COLUMN: Basket Items & Actions (~65%) -->
<div class="lg:col-span-7 xl:col-span-8 flex flex-col gap-space-lg">
<div class="flex items-center justify-between bg-surface-container-low px-space-md py-space-xs rounded-full">
<span class="font-headline-sm text-headline-sm text-primary uppercase tracking-tight">Review Basket (3)</span>
<span class="font-label-sticker text-label-sticker text-on-surface-variant uppercase tracking-wider">Curated Fresh</span>
</div>
    
<% if (cart.isEmpty()) { %>

<div class="rounded-2xl bg-surface-container-low p-space-xl text-center">
    <h3 class="font-headline-sm text-headline-sm text-primary">
        Your cart is empty!
    </h3>
    <p class="font-body-md text-body-md text-on-surface-variant">
        Explore our menu and add your favourite coffee.
    </p>
</div>

<% } else { for (CartItem item : cart) { %>

<div class="rounded-2xl bg-surface-container-lowest p-space-lg shadow-sm flex flex-col sm:flex-row gap-space-lg">

    <div class="w-full sm:w-36 h-36 rounded-xl overflow-hidden shrink-0">
        <img class="w-full h-full object-cover"
             src="<%= CartItem.escape(item.getImageUrl()) %>"
             alt="<%= CartItem.escape(item.getName()) %>"/>
    </div>

    <div class="flex-1 flex flex-col justify-between">

        <div class="flex justify-between gap-space-sm">

            <div>
                <h3 class="font-headline-sm text-headline-sm text-on-surface">
                    <%= CartItem.escape(item.getName()) %>
                </h3>

                <p class="font-body-sm text-body-sm text-on-surface-variant">
                    <%= CartItem.escape(item.getDescription()) %>
                </p>
            </div>

            <div class="text-right">
                <span class="font-headline-sm text-primary font-bold">
                    ₹<%= item.getPrice() %>
                </span>

                <p class="text-sm">
                    Total: ₹<%= item.getPrice().multiply(
                        BigDecimal.valueOf(item.getQuantity())
                    ) %>
                </p>
            </div>

        </div>

        <div class="flex justify-between items-center">

            <div class="flex items-center gap-2">

                <form action="<%= ctx %>/CartServlet" method="post">
                    <input type="hidden" name="action" value="decrease"/>
                    <input type="hidden" name="key" value="<%= item.getKey() %>"/>
                    <button type="submit" class="w-8 h-8 rounded-full bg-surface-container">
                        −
                    </button>
                </form>

                <span class="font-bold">
                    <%= item.getQuantity() %>
                </span>

                <form action="<%= ctx %>/CartServlet" method="post">
                    <input type="hidden" name="action" value="increase"/>
                    <input type="hidden" name="key" value="<%= item.getKey() %>"/>
                    <button type="submit" class="w-8 h-8 rounded-full bg-surface-container">
                        +
                    </button>
                </form>

            </div>

            <form action="<%= ctx %>/CartServlet" method="post">
                <input type="hidden" name="action" value="remove"/>
                <input type="hidden" name="key" value="<%= item.getKey() %>"/>
                <button type="submit" class="text-error">
                    Remove
                </button>
            </form>

        </div>

    </div>

</div>

<% } } %>

<!-- Cart Item 1: Iced Tiramisu Latte
<div class="group relative rounded-2xl bg-surface-container-lowest p-space-lg shadow-sm hover:shadow-md transition-all flex flex-col sm:flex-row gap-space-lg" id="cart-item-1">
<div class="relative w-full sm:w-36 h-36 rounded-xl overflow-hidden shrink-0 bg-surface-container">
<img class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500" data-alt="Artisanal iced tiramisu latte in a fluted glass, showing distinct layered tiers of velvety mascarpone cream, dark espresso pour, and light milk froth, lightly dusted with fine Valrhona cocoa powder on a warm textured marble table with deep burgundy and powder blue studio styling." src="https://lh3.googleusercontent.com/aida-public/AB6AXuDBLBe8Tl_pgfiYVsMSFTAsO8rdS9QujldKyoaHeNHxQYBdSr-RBzkne-sxIowpgIjM8Of8dBx9J8A3vcYKhJ6A9jhnoK_X9kb62MJqN-apvHA5jm-uM35bveTuKY0MkpijkcBSEZbXhD5KMQXKXqoW_DHMVYDUED9Qby7V5yn3UgOwmmTJMbsZ9lPdPiZz-6wXEr4gX47fPSwjF-ziJqEELutF-ssfkPrwk7nRWuQ"/>
<span class="absolute top-2 left-2 px-space-xs py-0.5 rounded-full bg-secondary-container text-on-secondary-container font-label-sticker text-label-sticker uppercase shadow-sm">
              SIGNATURE
            </span>
</div>
<div class="flex-1 flex flex-col justify-between min-w-0">
<div>
<div class="flex items-start justify-between gap-space-sm mb-space-xs">
<div>
<h3 class="font-headline-sm text-headline-sm text-on-surface leading-tight">Iced Tiramisu Latte</h3>
<p class="font-body-sm text-body-sm text-on-surface-variant">Handcrafted with mascarpone layer &amp; cocoa dust</p>
</div>
<div class="text-right shrink-0">
<span class="font-headline-sm text-headline-sm text-primary font-bold">₹380</span>
<span class="block font-label-sticker text-label-sticker text-on-surface-variant">BASE ₹310 + ADD-ONS ₹70</span>
</div>
</div>
<!-- Customization Tags 
<div class="flex flex-wrap gap-1.5 my-space-sm">
<span class="px-space-sm py-0.5 rounded-full bg-surface-container text-on-surface font-label-md text-label-md">12 oz (Large)</span>
<span class="px-space-sm py-0.5 rounded-full bg-secondary-fixed text-on-secondary-fixed font-label-md text-label-md">Oat Milk (+₹40)</span>
<span class="px-space-sm py-0.5 rounded-full bg-surface-container text-on-surface font-label-md text-label-md">25% Subtle</span>
<span class="px-space-sm py-0.5 rounded-full bg-secondary-fixed text-on-secondary-fixed font-label-md text-label-md">Vanilla Caviar (+₹30)</span>
<span class="px-space-sm py-0.5 rounded-full bg-primary-fixed text-on-primary-fixed-variant font-label-md text-label-md">Double Shot</span>
</div>
</div>
<!-- Bottom Row: Stepper & Remove
<div class="flex items-center justify-between pt-space-sm">
<div class="flex items-center gap-space-xs bg-surface-container-low px-space-xs py-space-xs rounded-full">
<button aria-label="Decrease quantity" class="w-8 h-8 rounded-full bg-surface-container-lowest text-on-surface hover:bg-primary-container hover:text-on-primary transition-colors flex items-center justify-center shadow-sm text-body-lg font-bold leading-none" type="button">-</button>
<span class="w-8 text-center font-headline-sm text-headline-sm text-on-surface">1</span>
<button aria-label="Increase quantity" class="w-8 h-8 rounded-full bg-surface-container-lowest text-on-surface hover:bg-primary-container hover:text-on-primary transition-colors flex items-center justify-center shadow-sm text-body-lg font-bold leading-none" type="button">+</button>
</div>
<button class="p-space-xs rounded-full text-on-surface-variant hover:text-error hover:bg-error-container/40 transition-colors flex items-center gap-1 font-label-md text-label-md" onclick="document.getElementById('cart-item-1').remove()" title="Remove item" type="button">
<span class="material-symbols-outlined text-[20px]">delete</span>
<span class="hidden sm:inline">Remove</span>
</button>
</div>
</div>
</div>
<!-- Cart Item 2: Flat White 
<div class="group relative rounded-2xl bg-surface-container-lowest p-space-lg shadow-sm hover:shadow-md transition-all flex flex-col sm:flex-row gap-space-lg" id="cart-item-2">
<div class="relative w-full sm:w-36 h-36 rounded-xl overflow-hidden shrink-0 bg-surface-container">
<img class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500" data-alt="Steaming ceramic artisan cup of flat white with velvety micro-foam and delicate symmetrical rosetta latte art, set against deep burgundy linen background with roasted specialty coffee beans scattered casually." src="https://lh3.googleusercontent.com/aida-public/AB6AXuAV5Z-1P_StR6MSfgRfQ50XFnCKIBweD6_gVgUYSxr5cWSsTdfmpIKsFa0XkJi314rQztcNKmTWBDTt-PmafQOylnLFIoIUCUDvhftqjs50Zj1QQ77SZ086zaC3pohWClrYjMfd3nZzArvT9lvgLSSzA_RlGm_6947hUZva-rvVisNJnbR0jFNLGac0hRSykQLB7IVYvLLY1lh9CnUwTqYcMqKWyEfNT61HTGEyVOE"/>
<span class="absolute top-2 left-2 px-space-xs py-0.5 rounded-full bg-primary-fixed text-on-primary-fixed-variant font-label-sticker text-label-sticker uppercase shadow-sm">
              HOUSE VELVET
            </span>
</div>
<div class="flex-1 flex flex-col justify-between min-w-0">
<div>
<div class="flex items-start justify-between gap-space-sm mb-space-xs">
<div>
<h3 class="font-headline-sm text-headline-sm text-on-surface leading-tight">Flat White</h3>
<p class="font-body-sm text-body-sm text-on-surface-variant">Micro-textured milk finish over dual origin ristretto</p>
</div>
<div class="text-right shrink-0">
<span class="font-headline-sm text-headline-sm text-primary font-bold">₹230</span>
<span class="block font-label-sticker text-label-sticker text-on-surface-variant">STANDARD ROAST</span>
</div>
</div>
<!-- Customization Tags 
<div class="flex flex-wrap gap-1.5 my-space-sm">
<span class="px-space-sm py-0.5 rounded-full bg-surface-container text-on-surface font-label-md text-label-md">8 oz (Regular)</span>
<span class="px-space-sm py-0.5 rounded-full bg-surface-container text-on-surface font-label-md text-label-md">Whole Dairy</span>
<span class="px-space-sm py-0.5 rounded-full bg-surface-container text-on-surface font-label-md text-label-md">0% Unsweetened</span>
<span class="px-space-sm py-0.5 rounded-full bg-primary-fixed text-on-primary-fixed-variant font-label-md text-label-md">Double Ristretto</span>
</div>
</div>
<!-- Bottom Row: Stepper & Remove 
<div class="flex items-center justify-between pt-space-sm">
<div class="flex items-center gap-space-xs bg-surface-container-low px-space-xs py-space-xs rounded-full">
<button aria-label="Decrease quantity" class="w-8 h-8 rounded-full bg-surface-container-lowest text-on-surface hover:bg-primary-container hover:text-on-primary transition-colors flex items-center justify-center shadow-sm text-body-lg font-bold leading-none" type="button">-</button>
<span class="w-8 text-center font-headline-sm text-headline-sm text-on-surface">1</span>
<button aria-label="Increase quantity" class="w-8 h-8 rounded-full bg-surface-container-lowest text-on-surface hover:bg-primary-container hover:text-on-primary transition-colors flex items-center justify-center shadow-sm text-body-lg font-bold leading-none" type="button">+</button>
</div>
<button class="p-space-xs rounded-full text-on-surface-variant hover:text-error hover:bg-error-container/40 transition-colors flex items-center gap-1 font-label-md text-label-md" onclick="document.getElementById('cart-item-2').remove()" title="Remove item" type="button">
<span class="material-symbols-outlined text-[20px]">delete</span>
<span class="hidden sm:inline">Remove</span>
</button>
</div>
</div>
</div>
<!-- Cart Item 3: Almond Brioche Swirl 
<div class="group relative rounded-2xl bg-surface-container-lowest p-space-lg shadow-sm hover:shadow-md transition-all flex flex-col sm:flex-row gap-space-lg" id="cart-item-3">
<div class="relative w-full sm:w-36 h-36 rounded-xl overflow-hidden shrink-0 bg-surface-container">
<img class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500" data-alt="Freshly baked golden-brown artisanal almond brioche swirl pastry topped with toasted sliced almonds and powdered sugar, served on a bespoke ceramic plate in a chic European bakery setting with morning sunlight." src="https://lh3.googleusercontent.com/aida-public/AB6AXuDdj7YqpaLsGQmQFkSadYZCZpeP1a2To3BxzHrS0LrDGOL85jWrbc10ITY_uUkLXxdN3_rcBsL1oeBbTFDm9HHEQZ0MTDbSF70maCz-DSlHbFYFSrRzRmZSI3K0OJxLDFhstAEZOSoPNgb3XqmPsphkJwUZZAN3Wr8we3Hia-Y8TUayUjMo5wR0ezV5IzrM1Ig1lEVShQSsPkxutqN7IYhuWVvjlvnT1G6zDkTJiK0"/>
<span class="absolute top-2 left-2 px-space-xs py-0.5 rounded-full bg-secondary-fixed text-on-secondary-fixed font-label-sticker text-label-sticker uppercase shadow-sm">
              OVEN FRESH
            </span>
</div>
<div class="flex-1 flex flex-col justify-between min-w-0">
<div>
<div class="flex items-start justify-between gap-space-sm mb-space-xs">
<div>
<h3 class="font-headline-sm text-headline-sm text-on-surface leading-tight">Almond Brioche Swirl</h3>
<p class="font-body-sm text-body-sm text-on-surface-variant">Hand-laminated flaky pastry filled with organic almond paste</p>
</div>
<div class="text-right shrink-0">
<span class="font-headline-sm text-headline-sm text-primary font-bold">₹180</span>
<span class="block font-label-sticker text-label-sticker text-on-surface-variant">BAKERY ATELIER</span>
</div>
</div>
<!-- Customization Tags 
<div class="flex flex-wrap gap-1.5 my-space-sm">
<span class="px-space-sm py-0.5 rounded-full bg-surface-container text-on-surface font-label-md text-label-md">Serve Warm</span>
<span class="px-space-sm py-0.5 rounded-full bg-surface-container text-on-surface font-label-md text-label-md">Organic Flour</span>
<span class="px-space-sm py-0.5 rounded-full bg-surface-container text-on-surface font-label-md text-label-md">Frangipane Core</span>
</div>
</div>
<!-- Bottom Row: Stepper & Remove 
<div class="flex items-center justify-between pt-space-sm">
<div class="flex items-center gap-space-xs bg-surface-container-low px-space-xs py-space-xs rounded-full">
<button aria-label="Decrease quantity" class="w-8 h-8 rounded-full bg-surface-container-lowest text-on-surface hover:bg-primary-container hover:text-on-primary transition-colors flex items-center justify-center shadow-sm text-body-lg font-bold leading-none" type="button">-</button>
<span class="w-8 text-center font-headline-sm text-headline-sm text-on-surface">1</span>
<button aria-label="Increase quantity" class="w-8 h-8 rounded-full bg-surface-container-lowest text-on-surface hover:bg-primary-container hover:text-on-primary transition-colors flex items-center justify-center shadow-sm text-body-lg font-bold leading-none" type="button">+</button>
</div>
<button class="p-space-xs rounded-full text-on-surface-variant hover:text-error hover:bg-error-container/40 transition-colors flex items-center gap-1 font-label-md text-label-md" onclick="document.getElementById('cart-item-3').remove()" title="Remove item" type="button">
<span class="material-symbols-outlined text-[20px]">delete</span>
<span class="hidden sm:inline">Remove</span>
</button>
</div>
</div>
</div>-->
<!-- Promo Code Notification Banner -->
<div class="rounded-2xl bg-secondary-fixed/50 p-space-md flex flex-col sm:flex-row sm:items-center justify-between gap-space-sm shadow-sm">
<div class="flex items-center gap-space-sm">
<span class="material-symbols-outlined text-secondary text-[24px]">verified</span>
<div>
<p class="font-headline-sm text-headline-sm text-on-surface leading-tight">Promo Applied: <span class="font-bold text-primary">BLENDIQUECLUB</span></p>
<p class="font-body-sm text-body-sm text-on-surface-variant">₹50 off applied on your signature craft beverage selection.</p>
</div>
</div>
<span class="px-space-md py-space-xs rounded-full bg-secondary-container text-on-secondary-container font-label-sticker text-label-sticker uppercase self-start sm:self-center shadow-sm">
            SAVED ₹50
          </span>
</div>
<!-- Action / Continue Shopping Strip -->
<div class="flex flex-col sm:flex-row items-center justify-between gap-space-md pt-space-xs">
<a class="inline-flex items-center gap-space-xs text-primary font-label-lg text-label-lg hover:text-primary-container transition-colors group" data-path="menu" href="#">
<span class="material-symbols-outlined text-[18px] group-hover:-translate-x-1 transition-transform">arrow_back</span>
<span>Continue Shopping (Back to Menu)</span>
</a>
<!-- Empty Cart Preview Toggle for Design Review -->
<button class="px-space-md py-space-xs rounded-full bg-surface-container text-on-surface-variant hover:text-on-surface font-label-md text-label-md transition-colors flex items-center gap-space-xs" onclick="document.getElementById('empty-state-drawer').classList.toggle('hidden')" type="button">
<span class="material-symbols-outlined text-[16px]">visibility</span>
<span>Preview Empty Cart Experience</span>
</button>
</div>
<!-- Collapsible Empty Cart Preview Component -->
<div class="hidden rounded-2xl bg-surface-container-low p-space-xl text-center flex flex-col items-center justify-center gap-space-md shadow-inner transition-all" id="empty-state-drawer">
<div class="w-16 h-16 rounded-full bg-secondary-container flex items-center justify-center text-on-secondary-container shadow-sm">
<span class="material-symbols-outlined text-[32px]">shopping_bag</span>
</div>
<div class="max-w-md">
<h4 class="font-headline-sm text-headline-sm text-on-surface">Your cart is looking a little empty!</h4>
<p class="font-body-md text-body-md text-on-surface-variant mt-space-xs">
              Explore freshly roasted single-origin batches, artisanal lattes, and small-batch pastries freshly baked in our atelier.
            </p>
</div>
<a class="px-space-lg py-space-sm rounded-full bg-primary-container text-on-primary font-label-lg text-label-lg hover:shadow-md transition-all" data-path="menu" href="#">
            Explore Our Menu
          </a>
</div>
</div>
<!-- RIGHT COLUMN: Sticky Order Summary & Receipt (~35%) -->
<div class="lg:col-span-5 xl:col-span-4 flex flex-col gap-space-lg lg:sticky lg:top-24">
<!-- Ritual Receipt Card -->
<div class="rounded-3xl bg-surface-container-lowest p-space-xl shadow-md flex flex-col gap-space-lg">
<div class="flex items-center justify-between pb-space-sm">
<span class="font-headline-sm text-headline-sm text-primary uppercase tracking-tight">Order Summary</span>
<span class="px-space-xs py-space-xs bg-secondary-container text-on-secondary-container rounded-full font-label-sticker text-label-sticker uppercase">RITUAL RECEIPT</span>
</div>
<!-- Summary Breakdown -->
<div class="flex flex-col gap-space-sm font-body-md text-body-md">
<div class="flex items-center justify-between text-on-surface-variant">
<span>Subtotal (3 items)</span>
<span class="font-medium text-on-surface">₹790.00</span>
</div>
<div class="flex items-center justify-between text-on-surface-variant">
<span class="flex items-center gap-1">
                Customization &amp; Add-ons
                <span class="material-symbols-outlined text-[14px]" title="Oat Milk + Vanilla Caviar">info</span>
</span>
<span class="font-medium text-on-surface">₹70.00</span>
</div>
<div class="flex items-center justify-between text-on-surface-variant">
<span>Packaging &amp; Eco-Friendly Bag</span>
<span class="font-medium text-on-surface">₹15.00</span>
</div>
<div class="flex items-center justify-between text-on-surface-variant">
<span>Estimated Taxes (GST 5%)</span>
<span class="font-medium text-on-surface">₹43.75</span>
</div>
<div class="flex items-center justify-between text-secondary">
<span class="flex items-center gap-1 font-semibold">
<span class="material-symbols-outlined text-[16px]">local_offer</span>
                Club Discount ('BLENDIQUECLUB')
              </span>
<span class="font-bold">-₹50.00</span>
</div>
</div>
<!-- Divider -->
<div class="w-full h-px bg-surface-container-highest my-space-xs"></div>
<!-- Grand Payable Total -->
<div class="flex items-baseline justify-between">
<div>
<span class="font-headline-sm text-headline-sm text-on-surface block leading-tight">Grand Payable</span>
<span class="font-label-sticker text-label-sticker text-on-surface-variant uppercase">INCL. OF ALL APPLICABLE TAXES</span>
</div>
<div class="text-right">
<span class="font-display text-headline-lg text-primary tracking-tight">₹868.75</span>
</div>
</div>
<!-- Primary CTA Button -->
<% if ("success".equals(request.getParameter("status"))) { %>
    <div class="rounded-xl bg-green-100 text-green-800 p-4 font-medium">
        <span class="material-symbols-outlined align-middle">check_circle</span>
        Order Placed Successfully!
    </div>

<% } else if ("error".equals(request.getParameter("status"))) { %>
    <div class="rounded-xl bg-red-100 text-red-800 p-4 font-medium">
        <span class="material-symbols-outlined align-middle">error</span>
        Unable to place your order. Please try again.
    </div>
<% } %>
<form action="<%= request.getContextPath() %>/CheckoutServlet" method="POST">
    <button
        class="w-full py-space-md px-space-lg rounded-full bg-primary-container text-on-primary font-headline-sm text-headline-sm uppercase tracking-wide hover:shadow-lg hover:scale-[1.01] active:scale-[0.99] transition-all flex items-center justify-center gap-space-sm group"
        type="submit">

        <span>Proceed to Checkout</span>

        <span class="material-symbols-outlined text-[20px] group-hover:translate-x-1 transition-transform">
            arrow_forward
        </span>

    </button>
</form>
<!-- Reassurance Points -->
<div class="flex flex-col gap-space-xs pt-space-xs font-body-sm text-body-sm text-on-surface-variant">
<div class="flex items-center gap-space-xs">
<span class="material-symbols-outlined text-[18px] text-secondary">workspace_premium</span>
<span>100% Arabica Specialty Grade Beans</span>
</div>
<div class="flex items-center gap-space-xs">
<span class="material-symbols-outlined text-[18px] text-secondary">eco</span>
<span>Plastic-neutral compostable packaging</span>
</div>
<div class="flex items-center gap-space-xs">
<span class="material-symbols-outlined text-[18px] text-secondary">lock</span>
<span>Encrypted instant checkout &amp; UPI ready</span>
</div>
</div>
</div>
<!-- Sourcing Card -->
<div class="rounded-2xl bg-surface-container-low p-space-lg flex flex-col gap-space-xs shadow-sm">
<div class="flex items-center gap-space-xs text-primary">
<span class="material-symbols-outlined text-[20px]">auto_stories</span>
<span class="font-label-sticker text-label-sticker uppercase tracking-wider">SINGLE ORIGIN SOURCING • ARTISANAL BATCH</span>
</div>
<p class="font-body-sm text-body-sm text-on-surface-variant">
            Every roast is calibrated to order, preserving aromatics and peak flavor extraction within a strict 48-hour roasting window.
          </p>
</div>
</div>
</div>
</div>
</div></main><div id="shared-footer"></div>

<script src="../js/include-layout.js"></script>
</body></html>