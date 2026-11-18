// Hobby-Imkerei Sonneborn – kleine Helfer. Keine Cookies, kein Tracking.
(function () {
  var root = document.documentElement;
  root.classList.remove('no-js');

  document.addEventListener('DOMContentLoaded', function () {
    // Mobiles Menü
    var knopf = document.querySelector('.menueknopf');
    var navi = document.getElementById('navi');
    if (knopf && navi) {
      knopf.addEventListener('click', function () {
        var offen = navi.classList.toggle('offen');
        knopf.setAttribute('aria-expanded', String(offen));
      });
    }

    // Menüleiste wird beim Scrollen dunkel
    var leiste = document.querySelector('.navileiste');
    if (leiste) {
      var pruefen = function () { leiste.classList.toggle('fest', window.scrollY > 120); };
      window.addEventListener('scroll', pruefen, { passive: true });
      pruefen();
    }

    // Großansicht für Bilder
    var kasten = document.querySelector('.leuchtkasten');
    if (kasten && typeof kasten.showModal === 'function') {
      var bild = kasten.querySelector('img');
      var text = kasten.querySelector('p');
      document.querySelectorAll('a[data-gross]').forEach(function (a) {
        a.addEventListener('click', function (e) {
          e.preventDefault();
          var klein = a.querySelector('img');
          bild.src = a.href;
          bild.alt = klein ? klein.alt : '';
          text.textContent = a.getAttribute('data-gross') || '';
          kasten.showModal();
        });
      });
      kasten.querySelector('button').addEventListener('click', function () { kasten.close(); });
      kasten.addEventListener('click', function (e) { if (e.target === kasten) kasten.close(); });
    }
  });
})();
