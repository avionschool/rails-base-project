const margLeft = () => {
    console.log("tae")
  
    dashboard = document.querySelector(".dashboard");
  
    if (dashboard.classList === "margin-left-none") {
      dashboard.classList.remove("margin-left-none");
      dashboard.classList.add("margin-left");
    } else {
      dashboard.classList.remove("margin-left")
      dashboard.classList.add("margin-left-none");
    }
  }