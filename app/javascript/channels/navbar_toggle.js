
const navbarToggle = () => {
  const chk = document.getElementById('checkbox');

  chk.addEventListener('change', () => {
    if (window.location.pathname == "/gift_requests"){
      window.location.href = '/dashboard'
      // window.location.reload(false).href
    }
    else {
      window.location.href = "/gift_requests";

    }
  });
}

export {navbarToggle};

