sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/capfiance/category/appcategories/test/integration/pages/CategoriesList.gen",
	"com/capfiance/category/appcategories/test/integration/pages/CategoriesObjectPage.gen"
], function (JourneyRunner, CategoriesListGenerated, CategoriesObjectPageGenerated) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/capfiance/category/appcategories') + '/test/flpSandbox.html#comcapfiancecategoryappcategor-tile',
        pages: {
			onTheCategoriesListGenerated: CategoriesListGenerated,
			onTheCategoriesObjectPageGenerated: CategoriesObjectPageGenerated
        },
        async: true
    });

    return runner;
});

