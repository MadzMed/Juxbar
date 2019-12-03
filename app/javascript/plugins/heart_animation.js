const heartLike = () => {
  if (document.querySelectorAll(".fa-heart")) {
    document.getElementById("heart").addEventListener("click", (e) => {
      e.target.style.color = e.target.style.color === 'red' ? '' : 'red';
    });
    document.querySelectorAll(".fa-heart").forEach((element) => {
      element.addEventListener("click", (e) => {
        if (e.target.id !== "heart") {
          e.target.classList.toggle("far");
          e.target.classList.toggle("fas");
          e.target.style.color = e.target.style.color === 'red' ? '' : 'red';
        }
      });
    });
  }
}

export { heartLike }
