const heartLike = () => {
  if (document.getElementById("heart")) {

    if (document.getElementById("heart")) {
      document.getElementById("heart").addEventListener("click", (e) => {
        e.target.style.color = e.target.style.color === 'rgb(186, 27, 29)' ? '' : 'rgb(186, 27, 29)';
      });
    }
  }
}

export { heartLike }
