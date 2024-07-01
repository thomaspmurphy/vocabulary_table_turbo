// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";

Turbo.setConfirmMethod((message, element) => {
  element.setAttribute("disabled", "true");

  let description = element.dataset.turboConfirmDescription || "";

  const dialog = document.getElementById("turbo-confirm");

  dialog.querySelector("[data-behavior='title']").textContent = message;
  dialog.querySelector("[data-behavior='description']").innerHTML = description;
  dialog.showModal();

  return new Promise((resolve) => {
    dialog.addEventListener(
      "close",
      () => {
        resolve(dialog.returnValue == "confirm");
        element.removeAttribute("disabled");
      },
      { once: true },
    );
  });
});
