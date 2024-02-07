const cds = require('@sap/cds');

module.exports = cds.service.impl(async function () {
    const { BusinessPartner, States } = this.entities;

    

    this.before('CREATE', BusinessPartner, async (req) => {
        const { businesspartner_number, is_gstn_reg, gstin_number } = req.data;

        if (is_gstn_reg && !gstin_number) {
          
            req.error({
                code: 'MISSING_GSTIN_NUMBER',
                message: 'GSTIN number is mandatory when is_gstn_reg is true',
                target: 'gstin_number',
            });
        }

        // Check if the businesspartner_number already exists
        const query = SELECT.from(BusinessPartner).where({ businesspartner_number: businesspartner_number });
        const result = await cds.run(query);

        if (result.length > 0) {
          console.log("hi")
            req.error({
              
                code: 'DUPLICATE_BUSINESS_PARTNER',
                message: 'Business partner with the same number already exists',
                target: 'businesspartner_number',
            });
        }
    });

    
});