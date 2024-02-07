using { com.saibharath.electronicstore as db } from '../db/schema';

//services and projections
service StoreS {

    entity Store as projection on db.Store;

}
//create button
annotate StoreS.Store with @odata.draft.enabled ;
 


//validations

annotate StoreS.Store with {
   pincode     @assert.format: '^[1-9]\d{2}( ?\d{3})?$';
}


//annotations for Business partner
annotate StoreS.Store with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value: store_id
        },
         {
            $Type : 'UI.DataField',
            Value: name
        },
         {
            $Type : 'UI.DataField',
            Value: address1
        },
         {
            $Type : 'UI.DataField',
            Value: address2
        },
         {
            $Type : 'UI.DataField',
            Value: city
        },
         {
            $Type : 'UI.DataField',
            Value: pincode
        },
        
    ],
    UI.FieldGroup #StoreInformation : {
        Data:[
        {
            $Type : 'UI.DataField',
            Value: store_id
        },
         {
            $Type : 'UI.DataField',
            Value: name
        },
         {
            $Type : 'UI.DataField',
            Value: address1
        },
         {
            $Type : 'UI.DataField',
            Value: address2
        },
         {
            $Type : 'UI.DataField',
            Value: city
        },
         {
            $Type : 'UI.DataField',
            Value: pincode
        },
         
         
        ]
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'BusinessP',
            Label: 'Store Information',
            Target: '@UI.FieldGroup#StoreInformation',
        }
    ],
      
);
