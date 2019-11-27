const heartLike = () => {
  document.querySelectorAll(".fa-heart").forEach((element) => {
    element.addEventListener("click", (e) => {
      e.target.classList.toggle("far");
      e.target.classList.toggle("fas");
      e.target.style.color = e.target.style.color === 'red' ? '' : 'red';
    });
  });
}

export { heartLike }
