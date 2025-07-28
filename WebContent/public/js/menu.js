const parentCategories = document.querySelector('[name="parent-category"]');
const childCategories = document.querySelector('[name="child-category"]');

const parentHandler = event => {
  if (event.target.tagName === "BUTTON") {
    const childOptions = [...parentCategories.children];

    childOptions.forEach(btn => {
      if (btn === event.target) {
        event.target.classList.add("pink");
      } else {
        btn.classList.remove("pink");
      }
    });

    const parentId = event.target.dataset.id;

    axios
      .get(`/api/menu/subcategories`, { params: { parentId: parentId } })
      .then(res => {
        const subcategories = res.data;
        console.log("subcategories", subcategories);
        childCategories.innerHTML = "";

        if (subcategories.length === 0) {
          childCategories.textContent = "선택된 하위 메뉴가 없습니다.";
          return;
        }

        subcategories.forEach(subCategory => {
          const btn = document.createElement("button");
          btn.type = "button";
          btn.className = "option";
          btn.dataset.id = subCategory;
          btn.textContent = subCategory;
          childCategories.appendChild(btn);
        });
      })
      .catch(err => {
        console.error("하위 메뉴 로딩 실패:", err);
        childCategories.textContent = "하위 메뉴를 불러오는데 실패했습니다.";
      });
  }
};

const childHandler = event => {
  if (event.target.tagName === "BUTTON") {
    const childOptions = [...childCategories.children];

    childOptions.forEach(btn => {
      if (event.target === btn) {
        event.target.classList.add("pink");
      } else {
        btn.classList.remove("pink");
      }
    });
  }
};

parentCategories.addEventListener("click", parentHandler);
childCategories.addEventListener("click", childHandler);
