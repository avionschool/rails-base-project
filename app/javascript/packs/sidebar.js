window.onload = function() {
    const sideMenu = document.querySelector(".aside");
    const menuBtn = document.querySelector("#menu-btn");
    const closeBtn = document.querySelector("#close-btn");

    // Theme Toggler
    const sideBarColor = document.querySelectorAll(".admin-container aside div");
    const asideBG = document.querySelector(".admin-container aside");
    const sideBarSVG = document.querySelectorAll(".admin-container aside div a svg");
    const sideBarText = document.querySelectorAll(".admin-container aside div a h3");
    const sideBarActive = document.querySelectorAll(".admin-container aside div .active");
    const sideBarBefore = document.querySelectorAll(".admin-container aside div .active");

    const mainH1 = document.querySelectorAll("main h1");
    const mainH2 = document.querySelectorAll("main h2");
    const mainH3 = document.querySelectorAll("main h3");

    const smallText = document.querySelectorAll("small");
    
    const topClose = document.querySelector(".admin-container .aside div div svg");
    const topA = document.querySelector(".top .logo a h2");
    const topBG = document.querySelector(".right .top");
    const topSVG = document.querySelector(".right .top button svg");

    const div = document.querySelectorAll(".insights div");

    const adminContainer = document.querySelector(".admin-container");
    const adminH1 = document.querySelector(".admin-container h1");

    const date = document.querySelector('.date');
    const dateH1 = document.querySelector('.date h1');

    const rightTop = document.querySelector(".right .top div .info p");
    const rightSun = document.querySelector(".right .top div .sun")
    const rightMoon = document.querySelector(".right .top div .moon")
    const rightProf = document.querySelector(".right .top .profile .profile-photo svg");
    const rightSeach = document.querySelector(".right .search h2");

    const recTrans = document.querySelector(".recent-transactions .updates");
    const recTransText = document.querySelector(".recent-transactions .updates h2");
    const recUpdatesText = document.querySelectorAll(".recent-transactions .updates .update .profile-photo svg");
    const recMessageText = document.querySelectorAll(".recent-transactions .updates .update .message p");

    const searchBG = document.querySelector(".search .search-item");
    const searchIcon = document.querySelector(".search .search-item .icon svg");

    // Traders List
    const tradersTable = document.querySelector("table");
    const tradersTH = document.querySelectorAll("table thead tr th");
    const tradersTD = document.querySelectorAll("table tbody tr td");
    const tradersViewBtn = document.querySelectorAll("table tbody tr td .table-link-to-view-btn");
    const tradersHR = document.querySelectorAll("table tbody tr td hr");

    const themeToggler = document.querySelector(".theme-toggler");

    menuBtn.addEventListener("click", () => {
        console.log('menu button clicked');
        sideMenu.setAttribute('style', 'display: block !important');
    })

    closeBtn.addEventListener("click", () => {
        console.log('close button clicked');
        sideMenu.setAttribute('style', 'display: none !important');
    })

    themeToggler.addEventListener("click", () => {
        console.log('theme toggle button clicked');

        document.body.classList.toggle('body-dark');

        adminContainer.classList.toggle('admin-container-dark');
        adminH1.classList.toggle('admin-container-h1');

        date.classList.toggle('dark-bg');
        dateH1.classList.toggle('date-text');

        topClose.classList.toggle('top-close');
        topA.classList.toggle('light-text');
        topBG.classList.toggle('top-dark');
        topSVG.classList.toggle('top-text');

        asideBG.classList.toggle('aside-bg');

        sideBarColor.forEach((sColor) => {
            sColor.classList.toggle('sideMenu-dark');
        })

        sideBarSVG.forEach((sVColor) => {
            sVColor.classList.toggle('sB-svg-light');
        })

        sideBarText.forEach((sTColor) => {
            sTColor.classList.toggle('sideMenu-text-light');
        })

        sideBarActive.forEach((sBColor) => {
            sBColor.classList.toggle('sB-Active');
        })

        sideBarBefore.forEach((sBFColor) => {
            sBFColor.classList.toggle('sB-Before');
        })

        mainH1.forEach((mH1) => {
            mH1.classList.toggle('light-text');
        })

        mainH2.forEach((mH2) => {
            mH2.classList.toggle('light-text');
        })

        mainH3.forEach((mH3) => {
            mH3.classList.toggle('light-text');
        })

        div.forEach((divElement) => {
            divElement.classList.toggle('card-dark');
        })

        smallText.forEach((smText) => {
            smText.classList.toggle('light-text');
        })

        rightTop.classList.toggle('rightTop-p');
        rightSun.classList.toggle('active');
        rightMoon.classList.toggle('active');
        rightMoon.classList.toggle('right-sun-light');
        rightProf.classList.toggle('right-prof-light');
        rightSeach.classList.toggle('rightSearch-h2');

        recTrans.classList.toggle('rec-trans-dark');
        recTransText.classList.toggle('rec-text-light');

        recUpdatesText.forEach((recU) => {
            recU.classList.toggle('rec-updates-light');
        })

        recMessageText.forEach((recM) => {
            recM.classList.toggle('rec-text-light');
        })

        searchBG.classList.toggle('card-dark');
        searchIcon.classList.toggle('search-light');

        tradersTable.classList.toggle('card-dark');

        tradersTH.forEach((trTH) => {
            trTH.classList.toggle('light-text');
        })

        tradersTD.forEach((trTD) => {
            trTD.classList.toggle('light-text');
        })

        tradersViewBtn.forEach((tVBTN) => {
            tVBTN.classList.toggle("view-Btn");
        })

        tradersHR.forEach((tHR) => {
            tHR.classList.toggle("t-hr-dark");
        })

    })
}
