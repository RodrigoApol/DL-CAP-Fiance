sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/capfiance/movements/types/appmovementstypes/test/integration/pages/MovementTypeList.gen",
	"com/capfiance/movements/types/appmovementstypes/test/integration/pages/MovementTypeObjectPage.gen"
], function (JourneyRunner, MovementTypeListGenerated, MovementTypeObjectPageGenerated) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/capfiance/movements/types/appmovementstypes') + '/test/flpSandbox.html#comcapfiancemovementstypesappm-tile',
        pages: {
			onTheMovementTypeListGenerated: MovementTypeListGenerated,
			onTheMovementTypeObjectPageGenerated: MovementTypeObjectPageGenerated
        },
        async: true
    });

    return runner;
});

