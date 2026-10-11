/* Publication search and theme filters. Vanilla JS, no dependencies. */
(function () {
  'use strict';

  // ---- Publication filters ----
  var list = document.getElementById('pub-list');
  if (!list) return;

  var search = document.getElementById('pub-search');
  var buttons = Array.prototype.slice.call(document.querySelectorAll('.filter'));
  var papers = Array.prototype.slice.call(list.querySelectorAll('.paper'));
  var groups = Array.prototype.slice.call(list.querySelectorAll('.year-group'));
  var count = document.getElementById('pub-count');
  var empty = document.getElementById('pub-empty');
  var theme = 'all';

  papers.forEach(function (p) { p.setAttribute('data-text', p.textContent.toLowerCase().replace(/\s+/g, ' ')); });

  function apply() {
    var q = (search.value || '').toLowerCase().trim().split(/\s+/).filter(Boolean);
    var shown = 0;
    papers.forEach(function (p) {
      var ok = (theme === 'all' || p.getAttribute('data-theme') === theme);
      if (ok) {
        var text = p.getAttribute('data-text');
        ok = q.every(function (t) { return text.indexOf(t) !== -1; });
      }
      p.hidden = !ok;
      if (ok) shown++;
    });
    groups.forEach(function (g) { g.hidden = !g.querySelector('.paper:not([hidden])'); });
    count.textContent = 'Showing ' + shown + ' of ' + papers.length + ' papers';
    empty.hidden = shown !== 0;
  }

  function setTheme(t, updateHash) {
    var exists = buttons.some(function (b) { return b.getAttribute('data-theme') === t; });
    theme = exists ? t : 'all';
    buttons.forEach(function (b) { b.setAttribute('aria-pressed', b.getAttribute('data-theme') === theme ? 'true' : 'false'); });
    if (updateHash && window.history && history.replaceState) {
      history.replaceState(null, '', theme === 'all' ? location.pathname + location.search : '#' + theme);
    }
    apply();
  }

  buttons.forEach(function (b) {
    b.addEventListener('click', function () { setTheme(b.getAttribute('data-theme'), true); });
  });
  search.addEventListener('input', apply);
  window.addEventListener('hashchange', function () { setTheme(location.hash.slice(1), false); });
  setTheme(location.hash.slice(1), false);
})();
