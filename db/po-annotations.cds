using teched.PurchaseOrder as PO from './data-model';

using {
    cuid
} from '@sap/cds/common';

annotate cuid with {
    ID @(
        title : '{i18n>po_id}',
        UI.HiddenFilter,
        Core.Computed
    );
}

annotate PO.Headers with @(
    UI: {
        SelectionFields  : [
            ID
        ],
        LineItem  : [
            {Value:ID},
            {Value:partner},
            {Value:lifecycleStatus},
            {Value:approvalStatus},
            {Value:confirmStatus},
            {Value:orderingStatus},
            {Value:invoicingStatus},
        ],
    },    
    title       : '{i18n>poService}',
    description : '{i18n>poService}'
) {
    ID              @(
        title       : '{i18n>po_id}',
        description : '{i18n>po_id}',
    );

    items           @(
        title       : '{i18n>po_items}',
        description : '{i18n>po_items}'
    );

    partner         @(
        title            : '{i18n>partner_id}',
        description      : '{i18n>partner_id}'
    );

    lifecycleStatus @(
        title               : '{i18n>lifecycle}',
        description         : '{i18n>lifecycle}',
        Common.FieldControl : #ReadOnly
    );

    approvalStatus  @(
        title               : '{i18n>approval}',
        description         : '{i18n>approval}',
        Common.FieldControl : #ReadOnly
    );

    confirmStatus   @(
        title               : '{i18n>confirmation}',
        description         : '{i18n>confirmation}',
        Common.FieldControl : #ReadOnly
    );

    orderingStatus  @(
        title               : '{i18n>ordering}',
        description         : '{i18n>ordering}',
        Common.FieldControl : #ReadOnly
    );

    invoicingStatus @(
        title               : '{i18n>invoicing}',
        description         : '{i18n>invoicing}',
        Common.FieldControl : #ReadOnly
    );
};

annotate PO.Items with @(
    UI: {
        SelectionFields  : [
            ID
        ],
        LineItem  : [
            {Value:ID},
            {Value:product},
            {Value:deliveryDate},
        ],
    },    
) {
    ID           @(
        title       : '{i18n>internal_id}',
        description : '{i18n>internal_id}'
    );
    product      @(
        title               : '{i18n>product}',
        description         : '{i18n>product}',
        Common.FieldControl : #Mandatory,
        Search.defaultSearchElement
    );

    deliveryDate @(
        title       : '{i18n>deliveryDate}',
        description : '{i18n>deliveryDate}',
    );
};

