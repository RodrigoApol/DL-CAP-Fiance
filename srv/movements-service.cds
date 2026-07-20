using cap.schema from '../db/schema';

@path: '/movements'
service MovementsService {

    entity MovementType as projection on schema.MovementType;
    entity Wallets      as projection on schema.Wallets;
    entity Categories   as projection on schema.Categories;

    @UI: {
        SelectionFields : [name],
        LineItem        : [
            {Value: name},
            {
                Value      : amount,
                Criticality: criticality
            },
            {
                Value: date,
                Label: 'Data'
            },
            {
                Value: type_name,
                Label: 'Tipo'
            },
            {
                Value: wallet_name,
                Label: 'Carteira'
            },
            {
                Value: category_name,
                Label: 'Categoria'
            },
            {
                Value: note,
                Label: 'Anotação'
            }
        ],
        Facets          : [{
            $Type : 'UI.ReferenceFacet',
            Label : 'Detalhes',
            Target: '@UI.FieldGroup#Main'
        }],
        FieldGroup #Main: {Data: [
            {Value: name},
            {Value: amount},
            {Value: date},
            {Value: type_ID},
            {Value: wallet_ID},
            {Value: category_ID},
            {Value: note}
        ]}
    }
    entity Movements @(Capabilities: {
        InsertRestrictions: {
            $Type: 'Capabilities.InsertRestrictionsType',
            Insertable
        },
        UpdateRestrictions: {
            $Type: 'Capabilities.UpdateRestrictionsType',
            Updatable
        },
        DeleteRestrictions: {
            $Type: 'Capabilities.DeleteRestrictionsType',
            Deletable
        },
    })                  as
        projection on schema.Movements {
            ID,
            name,
            amount,
            date,
            @Common.ValueList      : {
                Label         : 'Tipo de Movimento',
                CollectionPath: 'MovementType',
                Parameters    : [
                    {
                        $Type            : 'Common.ValueListParameterInOut',
                        LocalDataProperty: 'type_ID',
                        ValueListProperty: 'ID'
                    },
                    {
                        $Type            : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty: 'description'
                    }
                ]
            }
            @Common.TextArrangement: #TextOnly
            @Common.Text           : type_name
            type,
            type.description                      as type_name,
            @Common.ValueList      : {
                Label         : 'Carteira',
                CollectionPath: 'Wallets',
                Parameters    : [
                    {
                        $Type            : 'Common.ValueListParameterInOut',
                        LocalDataProperty: 'wallet_ID',
                        ValueListProperty: 'ID'
                    },
                    {
                        $Type            : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty: 'name'
                    }
                ]
            }
            @Common.TextArrangement: #TextOnly
            @Common.Text           : wallet_name
            wallet,
            wallet.name                           as wallet_name,
            @Common.ValueList      : {
                Label         : 'Categoria',
                CollectionPath: 'Categories',
                Parameters    : [
                    {
                        $Type            : 'Common.ValueListParameterInOut',
                        LocalDataProperty: 'category_ID',
                        ValueListProperty: 'ID'
                    },
                    {
                        $Type            : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty: 'name'
                    },
                    {
                        $Type            : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty: 'icon'
                    }
                ]
            }
            @Common.TextArrangement: #TextOnly
            @Common.Text           : category_name
            category,
            category.icon || ' ' || category.name as category_name : String(50),
            case
                when type.description = 'RECEITA'
                     then 1
                when type.description = 'DESPESA'
                     then 2
                else 0
            end                                   as criticality   : Integer,
            note
        };

    annotate Movements with @odata.draft.enabled;
}
