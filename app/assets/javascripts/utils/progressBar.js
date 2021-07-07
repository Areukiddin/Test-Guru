class ProgressBar {
  static fillBarHandler = () => {
    const progressBar = document.querySelector(".custom-progress-bar");
    const block = progressBar.children[0];
    const progressRate = progressBar.dataset.progressBar;

    block.style.width = `${500 * progressRate - 2}px`;
  };
}
