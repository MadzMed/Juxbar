const heartLike = () => {
  if (document.querySelectorAll(".fa-heart")) {
    if (document.getElementById("heart")) {
      document.getElementById("heart").addEventListener("click", (e) => {
        e.target.style.color = e.target.style.color === 'red' ? '' : 'red';
      });
    } else {
      document.querySelectorAll(".fa-heart").forEach((element) => {
        element.addEventListener("click", (e) => {
          if (e.target.id !== "heart") {
            e.target.classList.toggle("far");
            e.target.classList.toggle("fas");
            e.target.style.color = e.target.style.color === 'rgb(186, 27, 29)' ? '#262525' : 'rgb(186, 27, 29)';
          }
        });
      });
    }
  }
}

export { heartLike }
