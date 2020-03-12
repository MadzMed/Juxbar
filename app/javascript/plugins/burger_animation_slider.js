
const anim = () => {
  const sidebarBox = document.querySelector('#box');
  const sidebarBtn = document.querySelector('#btn');
  const pageWrapper = document.querySelector('#page-wrapper');

  sidebarBtn.addEventListener('click', event => {
    sidebarBtn.classList.toggle('active');
        console.log()
    sidebarBox.classList.toggle('active');
  });
};

export { anim }
