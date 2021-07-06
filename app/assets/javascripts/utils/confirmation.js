document.addEventListener("turbolinks:load", () => {
  const password = document.getElementById("user_password");
  const passwordConfirmation = document.getElementById(
    "user_password_confirmation"
  );

  const checkCircle = document.querySelector(".octicon-check-circle");
  const xCircle = document.querySelector(".octicon-x-circle");

  passwordConfirmation?.addEventListener("input", (e) => {
    if (e.target.value.length) {
      if (e.target.value !== password.value) {
        xCircle.classList.remove("hide");
        checkCircle.classList.add("hide");
      } else {
        xCircle.classList.add("hide");
        checkCircle.classList.remove("hide");
      }
    } else {
      xCircle.classList.add("hide");
      checkCircle.classList.add("hide");
    }
  });
});
