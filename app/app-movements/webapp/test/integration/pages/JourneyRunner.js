sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/capfiance/movement/appmovements/test/integration/pages/MovementsList.gen",
	"com/capfiance/movement/appmovements/test/integration/pages/MovementsObjectPage.gen"
], function (JourneyRunner, MovementsListGenerated, MovementsObjectPageGenerated) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/capfiance/movement/appmovements') + '/test/flpSandbox.html#comcapfiancemovementappmovemen-tile',
        pages: {
			onTheMovementsListGenerated: MovementsListGenerated,
			onTheMovementsObjectPageGenerated: MovementsObjectPageGenerated
        },
        async: true
    });

    return runner;
});

