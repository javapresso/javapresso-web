const parentCategories = document.getElementById("parent-category");
const childCategories = document.getElementById("child-category");

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

        const hiddenInput = document.createElement("input");
        hiddenInput.type = "hidden";
        hiddenInput.name = "selectedCategory";
        hiddenInput.id = "selectedCategory";
        childCategories.appendChild(hiddenInput);
      })
      .catch(err => {
        console.error("하위 메뉴 로딩 실패:", err);
        childCategories.textContent = "하위 메뉴를 불러오는데 실패했습니다.";
      });
  }
};

const childHandler = event => {
  console.log("event.target", event.target);
  console.log("event.tagName", event.target.tagName);
  if (event.target.tagName === "BUTTON") {
    const childOptions = [...childCategories.children];

    childOptions.forEach(btn => {
      if (event.target === btn) {
        event.target.classList.add("pink");
      } else {
        btn.classList.remove("pink");
      }
    });

    const hiddenInput = document.getElementById("selectedCategory");
    console.log("hiddenInput", hiddenInput);
    console.log(
      "event.target.getAttribute",
      event.target.getAttribute("data-id")
    );

    if (hiddenInput) {
      console.log("eventTargetInfo", event.target);
      hiddenInput.value = event.target.getAttribute("data-id");
    }

    console.log("선택된 카테고리:", event.target.textContent.trim());
    console.log("선택된 ID:", event.target.getAttribute("data-id"));
  }
};

parentCategories.addEventListener("click", parentHandler);
childCategories.addEventListener("click", childHandler);

const insertForm = document.getElementById("menuInsertForm");
const insertFormHandler = e => {
  e.preventDefault();

  const formData = new FormData(e.target);

  let message = "";

  formData.forEach((value, key) => {
    if (MENU_INPUT_NAME[key]) {
      message += `${MENU_INPUT_NAME[key]}: ${value}<br>`;
    }
  });

  message += "입력하신 정보로 메뉴를 등록 할까요?";

  const buttons = [
    { name: "등록 하기", action: "submitForm" },
    { name: "취소 하기", action: "closeModal" },
  ];

  showModal(message, buttons);
};

insertForm.addEventListener("submit", insertFormHandler);

const MENU_INPUT_NAME = {
  "child-category": "메뉴 분류",
  menu_name: "메뉴 이름",
  menu_price: "메뉴 가격",
  description: "메뉴 설명",
  iceable: "얼음 가능여부",
};

const uploadBtn = document.getElementById("upload-button");
const fileInput = document.getElementById("fileInput");
const imgPreview = document.querySelector(".default_image");

uploadBtn.addEventListener("click", () => {
  fileInput.click();
});

fileInput.addEventListener("change", () => {
  const file = fileInput.files[0];
  if (file) {
    const reader = new FileReader();
    reader.onload = e => {
      imgPreview.src = e.target.result;
    };
    reader.readAsDataURL(file);
  }
});

window.deleteImage = () => {
  imgPreview.src = "/public/images/Image.png";
  fileInput.value = null;
};
