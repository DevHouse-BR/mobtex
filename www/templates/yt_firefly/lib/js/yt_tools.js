/**
 * YtTools
 * requires mootools version 1.1
 *
 * @version 1.0.13 (13.08.2007)
 * @author yootheme.com
 * @copyright Copyright (C) 2007 YOOtheme Ltd. & Co. KG. All rights reserved.
 */ 
var YtTools = {
		
	start: function() {
		
		/* Match height of div tags */
		YtTools.setDivHeight();

		/* Color settings */
		var page = $('page');
		var currentColor = '#ff4b00'; /* default */	
		if (page.hasClass('green'))  currentColor = '#8CDC00';
		if (page.hasClass('pink'))   currentColor = '#dc6eff';
		if (page.hasClass('yellow')) currentColor = '#ffff64';
		if (page.hasClass('blue'))   currentColor = '#78c8ff';

		/* Accordion menu */
		var accordionFx = new YtAccordionMenu('li.toggler', 'ul.accordion', { accordion: 'slide' });

		/* Main menu */
		var menuEnter = { 'margin-top': 0, 'padding-bottom': 15, 'background-color': '#000000' };
		var menuLeave = { 'margin-top': 5, 'padding-bottom': 0, 'background-color': '#1E1E1E' };
		
		if (YtSettings.color == 'white') {
			$extend(menuEnter, { 'background-color': '#ffffff' });
			$extend(menuLeave, { 'background-color': '#E6E6E6' });
		}

		var menuFx = new YtMorph('#menu li', menuEnter, menuLeave,
			{ transition: Fx.Transitions.expoOut, duration: 300 }); 

		/* Sub menu level2 */
		var submenuEnter = { 'background-color': currentColor };
		var submenuLeave = { 'background-color': '#000000' };

		if (YtSettings.layout == 'right') {
			$extend(submenuEnter, { 'margin-right': 0 });
			$extend(submenuLeave, { 'margin-right': 10 });
		} else {
			$extend(submenuEnter, { 'margin-left': 0 });
			$extend(submenuLeave, { 'margin-left': 10 });
		}

		if (YtSettings.color == 'white') $extend(submenuLeave, { 'background-color': '#ffffff' });
		
		var submenuFx1 = new YtMorph('#submenu .level2, #othermenu .level1', submenuEnter, submenuLeave,
			{ transition: Fx.Transitions.expoOut, duration: 300 },
			{ transition: Fx.Transitions.sineIn, duration: 500 });
		
		/* Sub menu level3 */
		var submenuLeave2 = $merge(submenuLeave, { 'background-color': '#141414' });

		if (YtSettings.color == 'white') $extend(submenuLeave2, { 'background-color': '#f0f0f0' });
		
		var submenuFx2 = new YtMorph('#submenu .level3, #othermenu .level2', submenuEnter, submenuLeave2,
			{ transition: Fx.Transitions.expoOut, duration: 300 },
			{ transition: Fx.Transitions.sineIn, duration: 500 });
		
		/* Module Morphing */
		var moduleEnter = currentColor;
		var moduleLeave = '#1E1E1E';
		if (YtSettings.color == 'white') moduleLeave = '#E6E6E6';
		
		var moduleFx = new YtMorph('#top div.moduletable, #bottom div.moduletable', 
			{ 'border-top-color': moduleEnter, 'border-right-color': moduleEnter,
			  'border-bottom-color': moduleEnter, 'border-left-color': moduleEnter },
			{ 'border-top-color': moduleLeave, 'border-right-color': moduleLeave,
			  'border-bottom-color': moduleLeave, 'border-left-color': moduleLeave },
			{ transition: Fx.Transitions.expoOut, duration: 400 },
			{ transition: Fx.Transitions.sineIn, duration: 500 }); 
		
		/* Top panel */
		var toppanelFx = new YtSlidePanel($E('#toppanel'), $E('#toppanel-wrapper'),
			YtSettings.heightToppanel, { transition: Fx.Transitions.expoOut, duration: 500 });
		toppanelFx.addTriggerEvent('#toppanel-container .trigger');
		toppanelFx.addTriggerEvent('#toppanel .close');

		/* Style switcher */
		var switcherFx = new YtStyleSwitcher($ES('.wrapper'), { 
			widthDefault: YtSettings.widthDefault,
			widthThinPx: YtSettings.widthThinPx,
			widthWidePx: YtSettings.widthWidePx,
			widthFluidPx: YtSettings.widthFluidPx,
			afterSwitch: YtTools.setDivHeight,
			transition: Fx.Transitions.expoOut,
			duration: 500
		});		

		/* Lightbox */
		if (YtSettings.lightbox) {

			/* Lightbox behavior */
			YtBase.setupLightbox();		

			/* Lightbox/Slimbox */
			Lightbox.init();
		}
		
		/* Spotlight */
		var spotlightFx = new YtSpotlight('div.spotlight, span.spotlight');

	},

	/* Include addons */
	include: function(library) {
		$ES('script').each(function(s, i){
			var src = s.getProperty('src');
			if (src && src.match(/yt_tools\.js(\?.*)?$/)) {
				var path = src.replace(/yt_tools\.js(\?.*)?$/,'') + 'addons/';
				document.write('<script language="javascript" src="' + path + library + '" type="text/javascript"></script>');		
			}
		});
	},

	/* Match height of div tags */
	setDivHeight: function() {
		YtBase.matchDivHeight('div.topbox div', 10, 40);
		YtBase.matchDivHeight('div.bottombox div', 10, 40);
		YtBase.matchDivHeight('div.maintopbox div', 0);
		YtBase.matchDivHeight('div.mainbottombox div', 0);
		YtBase.matchDivHeight('div.contenttopbox div', 0);
		YtBase.matchDivHeight('div.contentbottombox div', 0);
	}

};

/* Include addons */
YtTools.include('base.js');
YtTools.include('morph.js');
YtTools.include('accordionmenu.js');
YtTools.include('slidepanel.js');
YtTools.include('styleswitcher.js');
YtTools.include('spotlight.js');

/* Add functions on window load */
window.addEvent('load', YtTools.start);
