class PasswordUtil {
  constructor(passwordId, confirmationId) {
    this.password = document.getElementById(passwordId);
    this.passwordConfirmation = document.getElementById(confirmationId);
  }

  toggleConfirmation = () => {
    const checkCircle = document.querySelector(".octicon-check-circle");
    const xCircle = document.querySelector(".octicon-x-circle");

    this.passwordConfirmation?.addEventListener("input", (e) => {
      if (e.target.value.length) {
        if (e.target.value !== this.password.value) {
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
  };
}
