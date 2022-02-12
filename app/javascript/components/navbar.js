// const animNavbar = () => {
//   const mon_avatar = document.querySelector('.avatar-listen');
//   mon_avatar.addEventListener('click', toggleClassPopUp );
// }

// function toggleClassPopUp() {
//   const menu = document.querySelector('.my-navbar-collapse');
//   menu.classList.toggle("scale-1");
// }

// export { animNavbar };

const animNavbar = () => {
  const mon_avatar = document.querySelector('.me-logo');
  mon_avatar.addEventListener('click', toggleClassPopUp );
  console.log(mon_avatar)
}

function toggleClassPopUp() {
  const menu = document.querySelector('.mon_menu');
  menu.classList.toggle("scale-1");
}

export { animNavbar };
