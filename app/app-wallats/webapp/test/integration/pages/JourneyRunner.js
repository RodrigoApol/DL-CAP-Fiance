sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/capfiance/wallat/appwallats/test/integration/pages/WallatsList.gen",
	"com/capfiance/wallat/appwallats/test/integration/pages/WallatsObjectPage.gen"
], function (JourneyRunner, WallatsListGenerated, WallatsObjectPageGenerated) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/capfiance/wallat/appwallats') + '/test/flpSandbox.html#comcapfiancewallatappwallats-tile',
        pages: {
			onTheWallatsListGenerated: WallatsListGenerated,
			onTheWallatsObjectPageGenerated: WallatsObjectPageGenerated
        },
        async: true
    });

    return runner;
});

