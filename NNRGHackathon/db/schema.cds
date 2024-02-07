namespace com.saibharath.electronicstore;
using { cuid,managed } from '@sap/cds/common';

@assert.unique:{
   businesspartner_number  :[ businesspartner_number]
}


entity BusinessPartner : cuid,managed {
    @title : 'Business Partner Number'
    businesspartner_number : String(10);
    @title : 'Name'
    name : String(10) @mandatory;
    @title : 'Address 1'
    address1 : String(20) @mandatory;
    @title : 'Address 2'
    address2 : String(20) @mandatory;
     @title : 'City'
    city : String(20) @mandatory;
      @title:'State'
    state:Association to States;
    @title : 'PIN Code'
    pincode : String(20) @mandatory;
    @title : 'Do you Registerd for GSTN '
    is_gstn_reg : Boolean default false;
    @title : 'GSTIN Number'
    gstin_number : String(20);
     @title : ' Are you a vendor'
    Is_vendor: Boolean default false;
     @title : 'Are you a customer'
    Is_customer: Boolean default false;
    
}


@cds.persistence.skip
entity States {
    @title:'code'
    key code: String(3);
    @title:'description'
    description:String(10);
    
}

//store
entity Store : cuid,managed {
   @title : 'Store ID'
    store_id : String(10);
    @title : 'Name'
    name : String(10) @mandatory;
    @title : 'Address 1'
    address1 : String(20) @mandatory;
    @title : 'Address 2'
    address2 : String(20) @mandatory;
    @title : 'PIN Code'
    pincode : String(20) @mandatory;
  
}