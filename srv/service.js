const cds = require('@sap/cds');

module.exports = cds.service.impl(async function() {
    const { Result } = this.entities;

    this.on('CREATE', 'Result', async (req) => {
        const { aadharContent, mediaType, aadharFileName } = req.data;

        // Calculate the size of the file
        const aadharSize = aadharContent ? aadharContent.length : 0;

        const result = await INSERT.into(Result).entries({
            ...req.data,
            aadharContent,
            mediaType,
            aadharFileName,
            aadharSize
        });

        return result;
    });

    this.before('CREATE', 'Result', req => {
        console.log('Create called');
        console.log(JSON.stringify(req.data));
    });

    this.before('READ', 'Result', req => {
        // Check content-type
        console.log('content-type: ', req.headers['content-type']);
    });
});
