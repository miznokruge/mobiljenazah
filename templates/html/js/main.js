(function($, window, document, undefined) {
     'use strict';

    // init cubeportfolio
    $('#grid-container').cubeportfolio({
        filters: '#filters-container',
        defaultFilter: '*',
        animationType: 'quicksand',
        gapHorizontal: 70,
        gapVertical: 35,
        gridAdjustment: 'responsive',
        mediaQueries: [{
            width: 800,
            cols: 3
        }, {
            width: 500,
            cols: 2
        }, {
            width: 320,
            cols: 1
        }],
        caption: 'moveRight',
        displayType: 'bottomToTop',
        displayTypeSpeed: 400,
    });
	
	
	// init cubeportfolio
    $('#grid-container2').cubeportfolio({
        filters: '#filters-container',
        defaultFilter: '*',
        animationType: 'quicksand',
        gapHorizontal: 70,
        gapVertical: 35,
        gridAdjustment: 'responsive',
        mediaQueries: [{
            width: 800,
            cols: 2
        }, {
            width: 500,
            cols: 2
        }, {
            width: 320,
            cols: 1
        }],
        caption: 'moveRight',
        displayType: 'bottomToTop',
        displayTypeSpeed: 400,
    });
	
	
	// init cubeportfolio
    $('#grid-container4').cubeportfolio({
        filters: '#filters-container',
        defaultFilter: '*',
        animationType: 'quicksand',
        gapHorizontal: 70,
        gapVertical: 35,
        gridAdjustment: 'responsive',
        mediaQueries: [{
            width: 800,
            cols: 4
        }, {
            width: 500,
            cols: 2
        }, {
            width: 320,
            cols: 1
        }],
        caption: 'moveRight',
        displayType: 'bottomToTop',
        displayTypeSpeed: 400,
    });

})(jQuery, window, document);
