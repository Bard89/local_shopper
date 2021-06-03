const changestatus = document.getElementById("change-status");

// document.querySelectorAll("#status").forEach(element => {
//   element.addEventListener("click", (event) => {
//     console.log(event);
//     console.log(event.currentTarget);
//     // console.log(changestatus);
//     changestatus.classList.toggle("d-inline-block");
//   });
// });

statusupdate = () => {
  changestatus.classList.toggle("d-inline-block");
};