// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context(".", true, /_channel\.js$/);
channels.keys().forEach(channels);

document.addEventListener("DOMContentLoaded", () => {
  const passwordField = document.getElementById("user_password");
  const passwordConfirmationField = document.getElementById(
    "user_password_confirmation"
  );

  passwordConfirmationField.addEventListener("input", (e) => {
    if (e.target.value !== passwordField?.value) {
      passwordConfirmationField.classList.add("wrong");
    }

    if (e.target.value === passwordField?.value) {
      passwordConfirmationField.classList.remove("wrong");
    }
  });
});
