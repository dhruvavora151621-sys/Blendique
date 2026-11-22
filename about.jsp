<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.blendique.model.CafeLocation" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <meta content="web_standard" name="shell-type"/>
        <link href="https://fonts.googleapis.com" rel="preconnect"/>
        <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
        <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&amp;family=Syne:wght@700;800&amp;display=swap" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<style>
    @layer base
    {html,body{margin:0;padding:0;}
     body
     {overscroll-behavior:none;}
     main>:first-child{margin-top:0!important;}
     main>:last-child{margin-bottom:0!important;}}
     ::-webkit-scrollbar{display:none;}
</style>
<script src="https://cdn.tailwindcss.com">
</script>
<script id="tailwind-config">tailwind.config={darkMode:"class",theme:{extend:{"colors":{"outline-variant":"#d8c1bf","on-secondary-container":"#3d657e","secondary":"#3a637b","on-error-container":"#93000a","secondary-container":"#b9e2ff","on-background":"#1b1b1d","on-secondary":"#ffffff","surface-container-high":"#eae7ea","primary-container":"#71352f","on-surface":"#1b1b1d","on-tertiary-fixed":"#0d1d25","inverse-primary":"#ffb4ab","surface-bright":"#fcf8fb","surface-container-lowest":"#ffffff","on-primary-fixed":"#390b08","on-surface-variant":"#534341","on-error":"#ffffff","surface-container":"#f0edef","primary-fixed-dim":"#ffb4ab","error":"#ba1a1a","error-container":"#ffdad6","surface-dim":"#dcd9dc","surface":"#fcf8fb","on-tertiary-fixed-variant":"#394952","inverse-on-surface":"#f3f0f2","surface-tint":"#8d4c45","primary-fixed":"#ffdad6","on-primary":"#ffffff","outline":"#867370","on-secondary-fixed-variant":"#204b62","on-tertiary-container":"#a7b8c2","on-primary-container":"#f3a096","on-primary-fixed-variant":"#71352f","secondary-fixed-dim":"#a3cce8","tertiary-container":"#394952","on-tertiary":"#ffffff","tertiary-fixed":"#d4e5f0","tertiary-fixed-dim":"#b8c9d4","surface-container-highest":"#e4e2e4","background":"#fcf8fb","primary":"#551f1b","tertiary":"#23333b","surface-variant":"#e4e2e4","surface-container-low":"#f6f3f5","on-secondary-fixed":"#001e2d","inverse-surface":"#303032","secondary-fixed":"#c5e7ff"},"borderRadius":{"DEFAULT":"1rem","lg":"2rem","xl":"3rem","full":"9999px"},"spacing":{"margin":"1.25rem","space-lg":"1.5rem","space-xl":"2.5rem","space-2xl":"4rem","gutter-desktop":"2rem","gutter":"1.5rem","margin-desktop":"3rem","space-sm":"0.5rem","space-xs":"0.25rem","space-md":"1rem"},"fontFamily":{"body-md":["Plus Jakarta Sans"],"body-sm":["Plus Jakarta Sans"],"display":["Syne"],"body-lg":["Plus Jakarta Sans"],"label-sticker":["Syne"],"headline-sm":["Syne"],"display-mobile":["Syne"],"headline-lg-mobile":["Syne"],"label-lg":["Plus Jakarta Sans"],"label-md":["Plus Jakarta Sans"],"headline-md":["Syne"],"headline-lg":["Syne"]},"fontSize":{"body-md":["1rem",{"lineHeight":"1.5rem","fontWeight":"400"}],"body-sm":["0.875rem",{"lineHeight":"1.35rem","fontWeight":"400"}],"display":["4.5rem",{"lineHeight":"4.75rem","letterSpacing":"-0.03em","fontWeight":"800"}],"body-lg":["1.125rem",{"lineHeight":"1.75rem","fontWeight":"400"}],"label-sticker":["0.75rem",{"lineHeight":"0.875rem","letterSpacing":"0.08em","fontWeight":"800"}],"headline-sm":["1.375rem",{"lineHeight":"1.75rem","fontWeight":"700"}],"display-mobile":["2.75rem",{"lineHeight":"3rem","letterSpacing":"-0.02em","fontWeight":"800"}],"headline-lg-mobile":["2rem",{"lineHeight":"2.25rem","letterSpacing":"-0.01em","fontWeight":"700"}],"label-lg":["0.875rem",{"lineHeight":"1.25rem","letterSpacing":"0.04em","fontWeight":"700"}],"label-md":["0.75rem",{"lineHeight":"1rem","letterSpacing":"0.06em","fontWeight":"700"}],"headline-md":["2rem",{"lineHeight":"2.35rem","letterSpacing":"-0.01em","fontWeight":"700"}],"headline-lg":["3rem",{"lineHeight":"3.25rem","letterSpacing":"-0.02em","fontWeight":"700"}]}}}};</script></head><body class="bg-background font-body-md text-on-surface antialiased"><header class="fixed top-0 w-full z-50 bg-surface/90 backdrop-blur-md shadow-[0_1px_8px_rgba(0,0,0,0.04)]"><div class="h-20 w-full px-margin-desktop flex items-center justify-between"><div class="flex items-center gap-space-sm"><a class="flex items-center gap-space-xs" data-path="home" href="#"><div class="px-space-md py-space-xs bg-primary-container text-on-primary rounded-full font-headline-sm text-headline-sm uppercase tracking-wider flex items-center gap-space-xs"><span class="material-symbols-outlined text-[20px] text-secondary-container">coffee</span><span>BLENDIQUE</span></div><div class="hidden sm:flex px-space-xs py-space-xs bg-secondary-container text-on-secondary-container rounded-full font-label-sticker text-label-sticker uppercase">Roasters • Atelier</div></a></div><nav class="hidden md:flex items-center gap-space-xs bg-surface-container-low px-space-xs py-space-xs rounded-full shadow-[0_1px_4px_rgba(0,0,0,0.02)]" data-active-classes="bg-primary-container text-on-primary font-bold"><a class="px-space-md py-space-xs rounded-full font-label-lg text-label-lg text-on-surface-variant hover:text-on-surface transition-all" data-path="home" href="#">Home</a><a class="px-space-md py-space-xs rounded-full font-label-lg text-label-lg text-on-surface-variant hover:text-on-surface transition-all" data-path="menu" href="#">Menu</a><a class="px-space-md py-space-xs rounded-full font-label-lg text-label-lg text-on-surface-variant hover:text-on-surface transition-all" data-path="customize" href="#">Customize</a><a aria-current="page" class="px-space-md py-space-xs rounded-full transition-all bg-primary-container text-on-primary font-bold" data-path="about-us" href="#">About Us</a></nav><div class="flex items-center gap-space-md"><a class="hidden sm:inline-flex items-center justify-center px-space-md py-space-xs rounded-full bg-secondary-container text-on-secondary-container font-label-lg text-label-lg hover:bg-secondary hover:text-on-secondary transition-all" data-path="login" href="#">Login / Register</a><button aria-label="Cart" class="relative p-space-xs rounded-full bg-surface-container text-on-surface hover:bg-surface-container-high transition-colors flex items-center justify-center" type="button"><span class="material-symbols-outlined text-[22px]">shopping_bag</span><span class="absolute -top-1 -right-1 w-5 h-5 rounded-full bg-primary-container text-on-primary font-label-sticker text-label-sticker flex items-center justify-center leading-none">3</span></button><div class="w-8 h-8 rounded-full bg-primary flex items-center justify-center"><span class="material-symbols-outlined text-on-primary text-[18px]">person</span></div></div></div></header><main class="w-full pt-20 bg-background"><div class="flex flex-col w-full">
<!-- TOP TICKER / BADGE BAR -->
<section class="w-full px-margin-desktop py-space-md">
<div class="max-w-7xl mx-auto flex flex-wrap items-center justify-between gap-space-sm bg-surface-container-low px-space-lg py-space-sm rounded-full shadow-[0_2px_8px_rgba(23,23,25,0.04)]">
<div class="flex items-center gap-space-sm">
<span class="inline-flex items-center gap-space-xs px-space-md py-space-xs rounded-full bg-secondary-container text-on-secondary-container font-label-sticker text-label-sticker uppercase tracking-widest">
<span class="material-symbols-outlined text-[16px]">verified</span>
          EST. 2026 • MUMBAI
        </span>
<span class="hidden sm:inline-flex items-center gap-space-xs font-label-md text-label-md text-on-surface-variant uppercase">
          South Indian Terroir meets European Cafe Saloon
        </span>
</div>
<div class="flex items-center gap-space-xs">
<span class="w-2.5 h-2.5 rounded-full bg-primary-container animate-pulse"></span>
<span class="font-label-sticker text-label-sticker uppercase tracking-wider text-primary font-bold">ROASTING FRESH DAILY</span>
</div>
</div>
</section>
<!-- HERO & MANIFESTO SECTION (Editorial Asymmetric 2-Column) -->
<section class="w-full px-margin-desktop py-space-xl">
<div class="max-w-7xl mx-auto grid grid-cols-1 lg:grid-cols-12 gap-gutter-desktop items-center">
<!-- Left Column: Typography & Manifesto -->
<div class="lg:col-span-7 flex flex-col gap-space-lg pr-0 lg:pr-space-lg">
<div class="inline-flex self-start items-center gap-space-xs px-space-md py-space-xs rounded-full bg-secondary-container text-on-secondary-container font-label-sticker text-label-sticker uppercase shadow-[2px_2px_0px_#171719]">
<span class="material-symbols-outlined text-[15px]">local_cafe</span>
          OUR MANIFESTO
        </div>
<h1 class="font-display text-display uppercase text-primary-container tracking-tight leading-[0.98]">
          Crafted with intention, poured with love.
        </h1>
<p class="font-body-lg text-body-lg text-on-surface-variant max-w-2xl leading-relaxed">
          We reject the cold rush of modern coffee. Blendique was born at the intersection of European cafe leisure and the rich, untamed highlands of South Indian single estates.
        </p>
<div class="flex flex-wrap items-center gap-space-md pt-space-xs">
<a class="inline-flex items-center gap-space-xs px-space-xl py-space-md rounded-full bg-primary-container text-on-primary font-label-lg text-label-lg shadow-[3px_3px_0px_#171719] hover:bg-primary transition-all" href="#story">
<span>Read The Chronicle</span>
<span class="material-symbols-outlined text-[18px]">south</span>
</a>
<div class="flex items-center gap-space-xs px-space-md py-space-sm rounded-full bg-surface-container text-on-surface font-label-md text-label-md">
<span class="material-symbols-outlined text-[18px] text-secondary">star</span>
<span>Micro-lot batches roasted thrice weekly</span>
</div>
</div>
</div>
<!-- Right Column: Visual Hero Card -->
<div class="lg:col-span-5 relative">
<div class="relative rounded-3xl bg-secondary-container/30 p-space-md shadow-[0_20px_40px_rgba(23,23,25,0.06)]">
<!-- Floating Badge -->
<div class="absolute -top-3 -right-2 z-10 px-space-md py-space-xs rounded-full bg-secondary-container text-on-secondary-container font-label-sticker text-label-sticker uppercase shadow-[2px_2px_0px_#171719] flex items-center gap-space-xs">
<span class="material-symbols-outlined text-[14px]">ac_unit</span>
            ARTISANAL • COLD &amp; HOT
          </div>
<div class="overflow-hidden rounded-2xl h-[420px] w-full relative">
<img class="w-full h-full object-cover" data-alt="Editorial close-up of an iced artisanal layered cafe latte in an authentic ribbed tumbler with a brass stirring spoon resting beside roasted coffee beans on a weathered oak European cafe table bathed in golden morning light with deep burgundy velvet accents and powder blue ceramic coasters" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBVYh7oIWR_DJjrbv9iGjaIljXpKZHtD0MT6OWCzdp2Rl45yFTnAXZWoZeDQDENQndYpYVU-4DqjtQflKf3o0YDEaQ_k-9zQxFpOC1XJimbmV0QXMW6lvg8jLvu0xOkt-cCJShSv-8HJRYs-N65iGJI6GSzlbbkPcpXOE-EbNlBl_MIzpq30JUjHKiQYJFw2qbbhsXOW-D3wo3FcwVIJxLQ9qPrFrNdNcddjjZCvWk"/>
<div class="absolute inset-0 bg-gradient-to-t from-primary/60 via-transparent to-transparent"></div>
<div class="absolute bottom-4 left-4 right-4 flex items-center justify-between text-on-primary">
<span class="font-label-sticker text-label-sticker uppercase bg-primary-container/90 px-space-sm py-space-xs rounded-full backdrop-blur-sm">Batch 084 • Signature Cold Drip</span>
<span class="font-headline-sm text-headline-sm tracking-wider">₹380</span>
</div>
</div>
</div>
</div>
</div>
</section>
<!-- THE BLENDIQUE STORY & STATS SECTION -->
<section class="w-full px-margin-desktop py-space-xl" id="story">
<div class="max-w-7xl mx-auto rounded-3xl bg-secondary-container/40 p-space-xl lg:p-space-2xl shadow-[0_12px_32px_rgba(58,99,123,0.08)]">
<div class="grid grid-cols-1 lg:grid-cols-12 gap-gutter-desktop items-center">
<!-- Story Text -->
<div class="lg:col-span-7 flex flex-col gap-space-md">
<div class="flex items-center gap-space-xs text-secondary font-label-sticker text-label-sticker uppercase">
<span class="material-symbols-outlined text-[20px]">menu_book</span>
<span>THE BLENDIQUE STORY</span>
</div>
<h2 class="font-headline-lg text-headline-lg uppercase text-tertiary tracking-tight">
            From Garage Cast-Iron to Roasting Sanctuary
          </h2>
<p class="font-body-lg text-body-lg text-on-surface-variant leading-relaxed">
            What began as an insatiable obsession in an apartment garage with a tiny cast-iron sample roaster has flourished into a sanctuary for coffee purists and curious wanderers alike. We blend reverence for historic European saloons with playful, graphic irreverence.
          </p>
<div class="flex items-center gap-space-sm pt-space-xs">
<span class="w-8 h-1 rounded-full bg-primary-container"></span>
<span class="font-label-md text-label-md text-on-surface font-semibold tracking-wider uppercase">Uncompromising purity in every shot</span>
</div>
</div>
<!-- Metrics Badges (Horizontal / Paired) -->
<div class="lg:col-span-5 flex flex-col sm:flex-row lg:flex-col gap-space-md justify-center">
<!-- Metric 1 -->
<div class="flex items-center gap-space-md p-space-md rounded-2xl bg-surface-container-lowest shadow-[3px_3px_0px_#171719]">
<div class="w-16 h-16 rounded-full bg-secondary-container flex items-center justify-center text-on-secondary-container font-headline-sm text-headline-sm shrink-0">
<span class="material-symbols-outlined text-[28px]">terrain</span>
</div>
<div class="flex flex-col">
<span class="font-display text-headline-lg text-primary-container leading-none">1,450m</span>
<span class="font-label-sticker text-label-sticker uppercase text-on-surface-variant tracking-wider mt-1">MEAN ESTATE ALTITUDE</span>
</div>
</div>
<!-- Metric 2 -->
<div class="flex items-center gap-space-md p-space-md rounded-2xl bg-surface-container-lowest shadow-[3px_3px_0px_#171719]">
<div class="w-16 h-16 rounded-full bg-primary-container flex items-center justify-center text-on-primary font-headline-sm text-headline-sm shrink-0">
<span class="material-symbols-outlined text-[28px]">nature</span>
</div>
<div class="flex flex-col">
<span class="font-display text-headline-lg text-secondary leading-none">100%</span>
<span class="font-label-sticker text-label-sticker uppercase text-on-surface-variant tracking-wider mt-1">SHADE-GROWN ARABICA</span>
</div>
</div>
</div>
</div>
</div>
</section>
<!-- OUR CORE PILLARS (01 / 02 / 03) -->
<section class="w-full px-margin-desktop py-space-xl">
<div class="max-w-7xl mx-auto flex flex-col gap-space-xl">
<!-- Section Header -->
<div class="flex flex-col sm:flex-row sm:items-end justify-between gap-space-md">
<div class="flex flex-col gap-space-xs">
<span class="font-label-sticker text-label-sticker uppercase text-secondary tracking-widest">PHILOSOPHY IN ACTION</span>
<h2 class="font-headline-lg text-headline-lg uppercase text-primary-container tracking-tight">Our Core Pillars</h2>
</div>
<span class="font-label-sticker text-label-sticker px-space-md py-space-xs rounded-full bg-surface-container text-on-surface-variant tracking-widest uppercase self-start sm:self-auto">
          01 / 02 / 03
        </span>
</div>
<!-- 3-Column Pillar Cards -->
<div class="grid grid-cols-1 md:grid-cols-3 gap-gutter-desktop">
<!-- Pillar 01 -->
<div class="flex flex-col justify-between p-space-lg rounded-3xl bg-surface-container-lowest shadow-[4px_4px_0px_#171719] hover:-translate-y-1 transition-transform">
<div class="flex flex-col gap-space-md">
<div class="flex items-center justify-between">
<div class="w-12 h-12 rounded-full bg-secondary-container text-on-secondary-container flex items-center justify-center">
<span class="material-symbols-outlined text-[24px]">workspace_premium</span>
</div>
<span class="px-space-sm py-space-xs rounded-full bg-secondary-container text-on-secondary-container font-label-sticker text-label-sticker uppercase">ETHICAL</span>
</div>
<span class="font-label-sticker text-label-sticker text-on-surface-variant">PILLAR 01</span>
<h3 class="font-headline-sm text-headline-sm uppercase text-on-surface">Direct Trade Coffee</h3>
<p class="font-body-md text-body-md text-on-surface-variant leading-relaxed">
              Ethically sourced from high-canopy, biodiverse shade estates in Coorg and Chikmagalur. We pay 45% above fair-market rates directly to our generational farmer partners.
            </p>
</div>
<div class="pt-space-lg flex items-center gap-space-xs text-primary font-label-sticker text-label-sticker uppercase">
<span>Verified Traceability</span>
<span class="material-symbols-outlined text-[16px]">arrow_forward</span>
</div>
</div>
<!-- Pillar 02 -->
<div class="flex flex-col justify-between p-space-lg rounded-3xl bg-surface-container-lowest shadow-[4px_4px_0px_#171719] hover:-translate-y-1 transition-transform">
<div class="flex flex-col gap-space-md">
<div class="flex items-center justify-between">
<div class="w-12 h-12 rounded-full bg-primary-container text-on-primary flex items-center justify-center">
<span class="material-symbols-outlined text-[24px]">local_fire_department</span>
</div>
<span class="px-space-sm py-space-xs rounded-full bg-primary-container text-on-primary font-label-sticker text-label-sticker uppercase">SMALL BATCH</span>
</div>
<span class="font-label-sticker text-label-sticker text-on-surface-variant">PILLAR 02</span>
<h3 class="font-headline-sm text-headline-sm uppercase text-on-surface">Precision Roasting</h3>
<p class="font-body-md text-body-md text-on-surface-variant leading-relaxed">
              Small batch drum roasting tailored to unpack distinct terroir. We emphasize notes of ripe stone fruit, dried figs, and warm roasted hazelnut without dark bitterness.
            </p>
</div>
<div class="pt-space-lg flex items-center gap-space-xs text-primary font-label-sticker text-label-sticker uppercase">
<span>Profile Logged Daily</span>
<span class="material-symbols-outlined text-[16px]">arrow_forward</span>
</div>
</div>
<!-- Pillar 03 -->
<div class="flex flex-col justify-between p-space-lg rounded-3xl bg-surface-container-lowest shadow-[4px_4px_0px_#171719] hover:-translate-y-1 transition-transform">
<div class="flex flex-col gap-space-md">
<div class="flex items-center justify-between">
<div class="w-12 h-12 rounded-full bg-secondary-container text-on-secondary-container flex items-center justify-center">
<span class="material-symbols-outlined text-[24px]">forum</span>
</div>
<span class="px-space-sm py-space-xs rounded-full bg-secondary-container text-on-secondary-container font-label-sticker text-label-sticker uppercase">SANCTUARY</span>
</div>
<span class="font-label-sticker text-label-sticker text-on-surface-variant">PILLAR 03</span>
<h3 class="font-headline-sm text-headline-sm uppercase text-on-surface">Community First</h3>
<p class="font-body-md text-body-md text-on-surface-variant leading-relaxed">
              Welcoming, naturally illuminated spaces designed for conversation, deep reading, vinyl spins, and deliberate pause. No hurried plastic counters.
            </p>
</div>
<div class="pt-space-lg flex items-center gap-space-xs text-primary font-label-sticker text-label-sticker uppercase">
<span>Slow Living Culture</span>
<span class="material-symbols-outlined text-[16px]">arrow_forward</span>
</div>
</div>
</div>
</div>
</section>

<!-- PHYSICAL SPACES / CAFÉ LOCATIONS -->
<section class="w-full px-margin-desktop py-space-xl">

<%
    List<CafeLocation> cafes =
        (List<CafeLocation>) request.getAttribute("cafes");
%>

<div class="max-w-7xl mx-auto flex flex-col gap-space-lg">

<div class="flex flex-col sm:flex-row sm:items-end justify-between gap-space-md">
<div class="flex flex-col gap-space-xs">
<div class="flex items-center gap-space-xs">
<span class="font-label-sticker text-label-sticker uppercase text-secondary tracking-widest">PHYSICAL SPACES</span>
<span class="px-space-xs py-space-xs rounded-full bg-secondary-container text-on-secondary-container font-label-sticker text-label-sticker uppercase"><%= cafes != null ? cafes.size() : 0 %> HUBS</span>
</div>
<h2 class="font-headline-lg text-headline-lg uppercase text-primary-container tracking-tight">Café Locations</h2>
</div>

<!-- Location Tabs -->
<div class="flex items-center gap-space-xs bg-surface-container p-1 rounded-full self-start sm:self-auto">

<% if (cafes != null && !cafes.isEmpty()) { %>

    <% for (int i = 0; i < cafes.size(); i++) { %>

        <button class="px-space-md py-space-xs rounded-full <%= i == 0 ? "bg-primary-container text-on-primary shadow-[2px_2px_0px_#171719]" : "text-on-surface-variant hover:text-on-surface" %> rounded-full font-label-md text-label-md uppercase"
                type="button">
            <%= cafes.get(i).getCafeName() %>
        </button>

    <% } %>

<% } %>

</div>
</div>

<!-- Detailed Location Card -->

<% if (cafes != null && !cafes.isEmpty()) { %>

    <% for (CafeLocation cafe : cafes) { %>

<div class="grid grid-cols-1 lg:grid-cols-12 rounded-3xl bg-surface-container-lowest overflow-hidden shadow-[4px_4px_0px_#171719]">

<!-- Location Image / Map View -->
<div class="lg:col-span-7 relative h-72 lg:h-auto min-h-[320px]">

<div class="w-full h-full bg-cover bg-center"
     data-location="<%= cafe.getArea() %>"
     style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuADrP-RVLO-LgJFXFNqmEP6-QIXuFZKMvds_4pmvp5r29Xg-S77pHt2zZBHLxcm_YFvTDn6dKbrgjip7uiRoZ9Mde5BX4stX7bYPalntDQscACLTMI4qtAktLvitD_3dO__hn3QxLxpOD3judi2F56Hc7k-7BvfKZlPDqXj1AWL_Jh6VRNhzVzisNn2pA4LEfwNw3yDRDcepDt3oYVSHbbeErU0rmDckLwTjtZNhkA')">
</div>

<div class="absolute top-4 left-4 px-space-md py-space-xs rounded-full bg-surface-container-lowest/90 backdrop-blur-sm text-on-surface font-label-sticker text-label-sticker uppercase tracking-wider shadow-[2px_2px_0px_#171719] flex items-center gap-space-xs">
<span class="material-symbols-outlined text-[16px] text-primary">pin_drop</span>
<%= cafe.getArea() %>
</div>

</div>

<!-- Location Info Panel -->
<div class="lg:col-span-5 p-space-lg lg:p-space-xl flex flex-col justify-between gap-space-lg">

<div class="flex flex-col gap-space-md">

<div class="flex items-center justify-between">
<h3 class="font-headline-md text-headline-md uppercase text-on-surface">
<%= cafe.getCafeName() %>
</h3>

<span class="px-space-sm py-space-xs rounded-full bg-secondary-container text-on-secondary-container font-label-sticker text-label-sticker uppercase">OPEN NOW</span>
</div>

<p class="font-body-md text-body-md text-on-surface-variant">
<%= cafe.getAddress() %>
</p>

<div class="flex flex-col gap-space-xs pt-space-xs">

<div class="flex items-center gap-space-xs text-on-surface font-label-md text-label-md">
<span class="material-symbols-outlined text-[18px] text-secondary">schedule</span>
<span><%= cafe.getOpeningHours() %></span>
</div>

<div class="flex items-center gap-space-xs text-on-surface font-label-md text-label-md">
<span class="material-symbols-outlined text-[18px] text-secondary">wifi</span>
<span>Pour-over bar &amp; High-speed Wi-Fi</span>
</div>

</div>
</div>

<div class="flex items-center gap-space-sm pt-space-md">

<a class="flex-1 inline-flex items-center justify-center gap-space-xs px-space-lg py-space-sm rounded-full bg-secondary-container text-on-secondary-container font-label-lg text-label-lg uppercase shadow-[2px_2px_0px_#171719] hover:bg-secondary hover:text-on-secondary transition-all"
   href="<%= cafe.getMapUrl() %>"
   target="_blank">

<span class="material-symbols-outlined text-[18px]">near_me</span>
<span>Get Directions</span>

</a>

<button aria-label="Share location" class="w-11 h-11 rounded-full bg-surface-container flex items-center justify-center text-on-surface hover:bg-surface-container-high transition-colors" type="button">
<span class="material-symbols-outlined text-[20px]">share</span>
</button>

</div>
</div>
</div>

    <% } %>

<% } else { %>

<p class="text-on-surface-variant">No café locations available currently.</p>

<% } %>

</div>
</section>

<!-- CALL TO ACTION BANNER (PULL UP A CHAIR) -->
<section class="w-full px-margin-desktop py-space-2xl">
<div class="max-w-7xl mx-auto rounded-3xl bg-tertiary text-on-tertiary p-space-xl lg:p-space-2xl shadow-[6px_6px_0px_#171719] text-center flex flex-col items-center gap-space-lg relative overflow-hidden">

<!-- Decorative Backdrop Element -->
<div class="absolute -right-16 -top-16 w-64 h-64 rounded-full bg-secondary/20 pointer-events-none blur-2xl"></div>
<div class="absolute -left-16 -bottom-16 w-64 h-64 rounded-full bg-primary-container/20 pointer-events-none blur-2xl"></div>

<!-- Icon Badge -->
<div class="w-16 h-16 rounded-full bg-secondary-container text-on-secondary-container flex items-center justify-center shadow-[3px_3px_0px_#171719]">
<span class="material-symbols-outlined text-[32px]">coffee</span>
</div>

<div class="flex flex-col gap-space-xs max-w-2xl">
<span class="font-label-sticker text-label-sticker uppercase text-secondary-fixed tracking-widest">PULL UP A CHAIR</span>
<h2 class="font-display text-display uppercase text-on-tertiary tracking-tight leading-none">Your Table Is Ready.</h2>
<p class="font-body-lg text-body-lg text-tertiary-fixed leading-relaxed mt-2">
Stop by for your morning single-origin fix, an afternoon nitro brew, or quiet evening conversation.
</p>
</div>

<div class="flex flex-col items-center gap-space-xs pt-space-xs">
<a class="inline-flex items-center gap-space-sm px-space-2xl py-space-md rounded-full bg-primary-container text-on-primary font-label-lg text-label-lg uppercase tracking-wider shadow-[3px_3px_0px_#171719] hover:bg-primary transition-all" href="#locations">
<span>FIND YOUR NEAREST TABLE</span>
<span class="material-symbols-outlined text-[20px]">east</span>
</a>
<span class="font-label-md text-label-md text-tertiary-fixed-dim mt-2">Walk-ins always embraced with warmth.</span>
</div>

</div>
</section>

</section>
</div></main>
        <footer class="w-full bg-primary-container text-on-primary">
            <div class="w-full px-margin-desktop py-space-2xl">
                <div class="grid grid-cols-1 md:grid-cols-12 gap-gutter-desktop mb-space-2xl">
                    <div class="md:col-span-5 flex flex-col gap-space-md">
                        <div class="flex items-center gap-space-xs">
                            <span class="font-display text-headline-lg uppercase text-on-primary tracking-tight">BLENDIQUE</span>
                            <span class="px-space-xs py-space-xs bg-secondary-container text-on-secondary-container font-label-sticker text-label-sticker rounded-full uppercase">EST. 2026</span>
                        </div>
                        <p class="font-body-md text-body-md text-primary-fixed max-w-md">Artisanal roastery and experimental tasting studio. Crafting sensory coffee broadsheets, single-origin micro-lots, and tailored bean chemistry for curious palates.</p>
                        <div class="flex items-center gap-space-xs pt-space-xs">
                            <span class="px-space-md py-space-xs rounded-full bg-tertiary-container text-tertiary-fixed font-label-sticker text-label-sticker uppercase">IG • @blendique</span>
                            <span class="px-space-md py-space-xs rounded-full bg-tertiary-container text-tertiary-fixed font-label-sticker text-label-sticker uppercase">X • @blendiquecoffee</span>
                            <span class="px-space-md py-space-xs rounded-full bg-tertiary-container text-tertiary-fixed font-label-sticker text-label-sticker uppercase">FB • @blendique_lab</span>
                        </div>
                    </div>
                    <div class="md:col-span-2 flex flex-col gap-space-md">
                        <span class="font-headline-sm text-headline-sm text-on-primary uppercase tracking-wider">Explore</span>
                        <ul class="flex flex-col gap-space-xs">
                            <li role="none"><a class="font-body-sm text-body-sm text-primary-fixed hover:text-on-primary transition-colors" data-path="home" href="#">Home</a></li>
                            <li role="none"><a class="font-body-sm text-body-sm text-primary-fixed hover:text-on-primary transition-colors" data-path="menu" href="#">Menu &amp; Batches</a></li>
                            <li role="none"><a class="font-body-sm text-body-sm text-primary-fixed hover:text-on-primary transition-colors" data-path="customize" href="#">Customize Blend</a></li>
                        </ul>
                    </div>
                    <div class="md:col-span-2 flex flex-col gap-space-md">
                        <span class="font-headline-sm text-headline-sm text-on-primary uppercase tracking-wider">Company</span>
                        <ul class="flex flex-col gap-space-xs">
                            <li role="none">
                                <a class="font-body-sm text-body-sm text-primary-fixed hover:text-on-primary transition-colors" data-path="about-us" href="#">About Us</a>
                            </li>
                            <li role="none">
                                <a class="font-body-sm text-body-sm text-primary-fixed hover:text-on-primary transition-colors" data-path="locations" href="#">Locations</a>
                            </li>
                            <li role="none">
                                <a class="font-body-sm text-body-sm text-primary-fixed hover:text-on-primary transition-colors" data-path="careers" href="#">Careers</a>
                            </li>
                        </ul>
                  </div>
                    <div class="md:col-span-3 flex flex-col gap-space-md">
                        <span class="font-headline-sm text-headline-sm text-on-primary uppercase tracking-wider">Say Hello</span>
                        <div class="flex flex-col gap-space-xs font-body-sm text-body-sm text-primary-fixed">
                            <p>concierge@blendique.coffee</p><p>9245267899</p><p>Mon–Sun • 07:00 – 20:00 IST</p>
                        </div>
                    </div>
                </div>
                <div class="pt-space-lg flex flex-col sm:flex-row items-center justify-between gap-space-md text-primary-fixed font-label-md text-label-md">
                    <p>© 2026 BLENDIQUE Atelier • Handcrafted Coffee Experiences. All rights reserved.</p>
                    <div class="flex items-center gap-space-md"><a class="hover:text-on-primary transition-colors" href="#">Privacy Policy</a>
                        <a class="hover:text-on-primary transition-colors" href="#">Terms of Service</a>
                        <a class="hover:text-on-primary transition-colors" href="#">Origin Transparency</a>
                    </div>
                </div>
            </div>
        </footer>
    </body></html>

