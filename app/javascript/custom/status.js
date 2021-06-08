statusupdate = () => {
document.querySelectorAll("#status").forEach(element => {
  element.addEventListener("click", (event) => {
    // console.log(event);
    // console.log(event.currentTarget);
    // console.log(changestatus);
    const card = event.currentTarget;
    const pills = card.querySelector("#change-status");
    // console.log(pills);
    pills.classList.toggle("d-inline-block");
  });
});
}

// statusupdate = () => {
//   changestatus.classList.toggle("d-inline-block");
// };
