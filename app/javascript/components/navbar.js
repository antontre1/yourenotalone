const animNavbar = () => {
  const mon_avatar = document.querySelector('.avatar-listen');
  console.log(mon_avatar);
  mon_avatar.addEventListener('click', toggleClassPopUp );
}

function toggleClassPopUp() {
  const menu = document.querySelector('.my-navbar-collapse');
  menu.classList.toggle("scale-1")
  console.log(menu);
}

export { animNavbar };
