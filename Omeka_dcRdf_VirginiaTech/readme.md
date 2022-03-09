# Introduction
Omeka Classic 2.7 was used as the temporary digital library. Among all of the available output for Omeka, the output type `dc-rdf` works best for transformation with XSL.

The XSL will transform the bulk XML to meet the [Digital Virginias metadata requirements](https://docs.google.com/document/d/1r2r9FtD4paZy8f2y2XGCC6kgE-XjsPy6lcJCWnQVRy0/edit#) and split each record into individual XML files. 

*Questions or feedback? Contact Wen Nie Ng at <wenng@vt.edu>*

## Using this XSL with Omeka Classic:
1. Log in as admin on Omeka site
2. On the admin interface, choose the desired collection
3. Output the whole collection in `dc-rdf` format (bulk metadata XML) in Google Chrome
4. On the document page, exclude the first line: 
> This XML file does not appear to have any style information associated with it. The document tree is shown below.
5. Copy and paste the remaining text to a text editor or XML editor, save it as XML file
6. Transform the bulk XML with the XSL

## Note: 

This XSL might not work for users if specific configurations weren't set up properly on Omeka instance. The Omeka plugins will affect the logical construct for the thumbnail URI that is needed for the XML. 

Review the [Omeka settings and complications](https://ngwennie.wordpress.com/platforms/omeka/)

*Questions or feedback? Contact Wen Nie Ng at <wenng@vt.edu>*