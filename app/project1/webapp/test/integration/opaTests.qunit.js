sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'project1/test/integration/FirstJourney',
		'project1/test/integration/pages/ResultList',
		'project1/test/integration/pages/ResultObjectPage'
    ],
    function(JourneyRunner, opaJourney, ResultList, ResultObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('project1') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheResultList: ResultList,
					onTheResultObjectPage: ResultObjectPage
                }
            },
            opaJourney.run
        );
    }
);