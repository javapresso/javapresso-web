const menuList = document.querySelectorAll(".sidebar_item");

const menuHandler = e => {
  menuList.forEach(b => b.classList.remove("is-active"));
  e.target.classList.add("is-active");
};

menuList.forEach(btn => btn.addEventListener('click', menuHandler));