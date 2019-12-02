
const anim = () => {
  const sidebarBox = document.querySelector('#box');
  const sidebarBtn = document.querySelector('#btn');
  const pageWrapper = document.querySelector('#page-wrapper');

  sidebarBtn.addEventListener('click', event => {
    sidebarBtn.classList.toggle('active');
        console.log()
    sidebarBox.classList.toggle('active');
  });

   // pageWrapper.addEventListener('click', event => {

   //  if (sidebarBox.classList.contains('active')) {
   //      sidebarBtn.classList.remove('active');
   //      sidebarBox.classList.remove('active');
   //  }
  // });
  // window.addEventListener('keydown', event => {

  //   if (sidebarBox.classList.contains('active') && event.keyCode === 27) {
  //       sidebarBtn.classList.remove('active');
  //       sidebarBox.classList.remove('active');
  //   }
  // });
};








export { anim }
