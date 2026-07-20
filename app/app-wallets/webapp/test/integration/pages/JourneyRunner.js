sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/capfiance/wallet/appwallets/test/integration/pages/WalletsList.gen",
	"com/capfiance/wallet/appwallets/test/integration/pages/WalletsObjectPage.gen"
], function (JourneyRunner, WalletsListGenerated, WalletsObjectPageGenerated) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/capfiance/wallet/appwallets') + '/test/flpSandbox.html#comcapfiancewalletappwallets-tile',
        pages: {
			onTheWalletsListGenerated: WalletsListGenerated,
			onTheWalletsObjectPageGenerated: WalletsObjectPageGenerated
        },
        async: true
    });

    return runner;
});

