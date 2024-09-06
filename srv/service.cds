using { com.abhi.results as db } from '../db/schema';

service Marks {
    entity Result as projection on db.Result;

    action uploadData(jsonData: String);
}

annotate Marks.Result with @odata.draft.enabled;

annotate Marks.Result with @(

    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : name
        },
        {
            $Type : 'UI.DataField',
            Value : roll
        },
        {
            $Type : 'UI.DataField',
            Value : email
        },
        {
            $Type : 'UI.DataField',
            Value : marks
        },
        {
            $Type : 'UI.DataField',
            Value : per
        },
        {
            $Type : 'UI.DataField',
            Value : aadharFileName,  // Display the Aadhar file name in the line item
            Label : 'Aadhar File'
        }
    ]
);

annotate Marks.Result with @(

    UI.FieldGroup #StudentInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : name
            },
            {
                $Type : 'UI.DataField',
                Value : roll
            },
            {
                $Type : 'UI.DataField',
                Value : email
            },
            {
                $Type : 'UI.DataField',
                Value : marks  
            },
            {
                $Type : 'UI.DataField',
                Value : per
            },
            {
                $Type : 'UI.DataField',
                Value : aadharFileName,  // Include Aadhar file name in the student information group
                Label : 'Aadhar File'
            },
            {
                $Type : 'UI.DataField',
                Value : aadharContent,  // Include the aadhar content field for upload
                Label : 'Upload Aadhar',
                Upload: {
                    PropertyForFileName: 'aadharFileName',
                    PropertyForMediaType: 'mediaType',
                    PropertyForFileSize: 'aadharSize'
                }
            }
        ]
    },
    
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'StudentInfoFacet',
            Label : 'Student Information',
            Target : '@UI.FieldGroup#StudentInformation'
        }
    ]
);
