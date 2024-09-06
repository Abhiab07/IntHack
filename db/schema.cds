namespace com.abhi.results;

using { managed, cuid } from '@sap/cds/common';

entity Result : managed, cuid {
    key ID : UUID;
    
    @title: 'Name'
    name : String(10);
    
    @title: 'RollNo'
    roll : String(40);
    
    @title: 'Email'
    email : String(40);
    
    @title: 'Marks'
    marks : String(10);
    
    @title: 'Percentage'
    per : String(10);

    @title: 'Aadhar'
    @Core.MediaType: mediaType
    aadharContent : LargeBinary; // Field to store the Aadhar file content
    
    mediaType : String;  // MIME type of the uploaded Aadhar file
    
    @Core.ContentDisposition.Filename
    aadharFileName : String;  // Original file name for the uploaded Aadhar

    aadharSize : Integer;  // Size of the Aadhar file in bytes
}
