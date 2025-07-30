const modalButtonHandler = btn => {
  if (btn.action === "submitForm") {
	  let formId = btn.formid;
	  const form = document.getElementById(formId);
	  if (form) form.submit();
  } else if (btn.action === "closeModal") {
    const modal = document.getElementById("modal");
    modal.style.display = "block";
  } else {
    window.location.href = btn.action;
  }
};

const showModal = (message, buttons) => {
	console.log("전달받은 메세지", message);
  const modal = document.getElementById("modal");
  const modalBack = document.getElementById("modal-backdrop");
  const modalContent = document.getElementById("modal_content");

  modalContent.innerHTML = message;

  const btnContainer = modal.querySelector(".modal_button_wrapper");
  btnContainer.innerHTML = "";
  buttons.forEach(btn => {
    const button = document.createElement("button");
    button.textContent = btn.name;
    button.classList.add("modal_button");
    if (btn.action === "submitForm") button.classList.add("pink");
    button.onclick = () => modalButtonHandler(btn);
    btnContainer.appendChild(button);
  });

  const button = document.createElement("button");
  button.textContent = "닫기";
  button.classList.add("modal_button");
  button.onclick = () => hideModal();
  btnContainer.appendChild(button);

  modal.style.display = "block";
  modalBack.style.display = "block";
};

const hideModal = () => {
  const modal = document.getElementById("modal");
  const modalBack = document.getElementById("modal-backdrop");
  const btnContainer = modal.querySelector(".modal_button_wrapper");
  btnContainer.innerHTML = "";
  console.log("hideModal click");
  modal.style.display = "none";
  modalBack.style.display = "none";
};
