// Define the tour!
var tour = {
	id: "hello-hopscotch",
	steps: [
		{
			target: "email-navigation",
			title: "Usuario actual",
			content: "Aqui se muestra el usuario actual con el que se está usando el sistema.",
			placement: 'right',
			yOffset: -10
		},
		{
			target: "email-content",
			title: "Denuncias asignadas",
			content: "Denuncias asignadas al usuario actual.",
			placement: 'right',
			xOffset: -650
		},
		{
			target: "btnGenerar",
			title: "Botón Generar Denuncia/Querella",
			content: "Botón que sirve para generar denuncias o querellas.",
			placement: 'right',
			yOffset: -10
		}
	],
	showPrevButton: true
},

/* ========== */
/* TOUR SETUP */
/* ========== */
addClickListener = function(el, fn) {
  if (el.addEventListener) {
    el.addEventListener('click', fn, false);
  }
  else {
    el.attachEvent('onclick', fn);
  }
},

init = function() {
  var startBtnId = 'startTourBtn',
      calloutId = 'startTourCallout',
      mgr = hopscotch.getCalloutManager(),
      state = hopscotch.getState();

  if (state && state.indexOf('hello-hopscotch:') === 0) {
    // Already started the tour at some point!
    hopscotch.startTour(tour);
  }

  addClickListener(document.getElementById(startBtnId), function() {
    if (!hopscotch.isActive) {
      mgr.removeAllCallouts();
      hopscotch.startTour(tour);
    }
  });
};

init();