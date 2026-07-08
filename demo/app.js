const navItems = document.querySelectorAll('.nav-item');
const panels = document.querySelectorAll('.panel');
const toast = document.querySelector('#toast');
let toastTimer = null;

function showPanel(target) {
  panels.forEach(panel => panel.classList.toggle('active', panel.id === target));
  navItems.forEach(item => item.classList.toggle('active', item.dataset.target === target));
}

function showToast(message) {
  toast.textContent = message;
  toast.classList.add('show');
  clearTimeout(toastTimer);
  toastTimer = setTimeout(() => toast.classList.remove('show'), 1800);
}

document.addEventListener('click', event => {
  const switcher = event.target.closest('[data-target]');
  if (switcher) {
    showPanel(switcher.dataset.target);
  }

  const toastButton = event.target.closest('[data-toast]');
  if (toastButton) {
    showToast(toastButton.dataset.toast);
  }
});

showPanel('home');
