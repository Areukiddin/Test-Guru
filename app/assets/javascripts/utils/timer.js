class Timer {
  constructor(timeLeft) {
    this.min = Math.floor(timeLeft?.split(".")[0] / 60);
    this.sec = timeLeft?.split(".")[0] % 60;
    this.timerContainer = document.querySelector(".timer");
    this.timeString = document.createElement("p");
    this.timerContainer?.appendChild(this.timeString);
    this.nextBtn = document.getElementById("next-btn");
    if (this.min < 1) {
      this.timerContainer.style.color = "red";
    }
    const formatedMin = this.min < 10 ? "0" + this.min : this.min;
    const formatedSec = this.sec < 10 ? "0" + this.sec : this.sec;

    this.timeString.innerText = `${formatedMin}:${formatedSec}`;
  }

  start = () => {
    const tick = setInterval(() => {
      this.sec--;
      if (this.sec < 0 && this.min > 0) {
        this.min--;
        this.sec = 59;
      }

      if (this.min < 1) {
        this.timerContainer.style.color = "red";
      }

      if (this.sec < 0 && this.min === 0) {
        clearInterval(tick);
        this.nextBtn?.click();
      }

      const formatedMin = this.min < 10 ? "0" + this.min : this.min;
      const formatedSec = this.sec < 10 ? "0" + this.sec : this.sec;

      this.timeString.innerText = `${formatedMin}:${formatedSec}`;
    }, 1000);
  };
}
