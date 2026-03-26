
// Función para el menú desplegable en modo móvil
const menuToggle = document.getElementById('menuToggle');
const links = document.querySelector('.links');
const sesionStar = document.querySelector('.sesion_star');

menuToggle.addEventListener('click', function() {
    // Alternar clases
    links.classList.toggle('activo');
    sesionStar.classList.toggle('activo');
    menuToggle.classList.toggle('activo');
});

// Cerrar menú al hacer clic en un enlace
document.querySelectorAll('.links a, .sesion_star a').forEach(link => {
    link.addEventListener('click', function() {
        links.classList.remove('activo');
        sesionStar.classList.remove('activo');
        menuToggle.classList.remove('activo');
    });
});
