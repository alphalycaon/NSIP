// Define the tour!
var tour = {
	id: "hello-hopscotch",
	steps: [
		{
			target: "usuarioActual",
			title: "Usuario actual",
			content: "Aqui se muestra el usuario actual con el que se está usando el sistema.",
			placement: 'right',
			yOffset: -80
		},
		{
			target: "btnBusqueda",
			title: "Búsqueda",
			content: "Búsqueda de contenido en la aplicación.",
			placement: "bottom",
			zindex: 999,
			xOffset: -8
		},
		{
			target: 'make-small-nav',
			title: "Expandir/Contraer",
			content: "Haz Click en el botón para Expandír o Contraer la barra lateral.",
			placement: "bottom",
			zindex: 999,
			xOffset: -8
		},
		{
			target: "profileUsuario",
			title: "Configuraciones del usuario",
			content: "Aquí se muestran las configuraciones del usuario actual.",
			placement: 'left',
			zindex: 999
		},
		{
			target: "config-tool-options",
			title: "Colores del tema",
			content: "Aquí se pueden configurar los colores del tema.",
			zindex: 999,
			placement: 'left',
			fixedElement: true,
			xOffset: -55
		},
		{
			target: 'sidebar-nav',
			title: "Menús del usuario actual",
			content: "Todos los menús del usuario actual.",
			placement: 'right'
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