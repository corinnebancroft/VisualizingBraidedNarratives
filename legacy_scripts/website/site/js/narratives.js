if(document.querySelector('#viz')){
	document.querySelector('#viz').addEventListener('load', function(){
		// Will get called after embed element was loaded
		svgPanZoom(document.querySelector('#viz'), {
			zoomEnabled: true,
			controlIconsEnabled: true,
			fit: true,
			center: true
		});
	});
}
