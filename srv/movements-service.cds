using cap.schema as db from '../db/schema';

@path: '/movements'
service MovementsService {
    @UI: {
        SelectionFields : [name],
        LineItem        : [
            {
                Value: name,
                Label: 'Nome'
            },
            {
                Value      : amount,
                Criticality: {$value: criticality},
                Label      : 'Valor'
            },
            {
                Value: date,
                Label: 'Data da Movimentação'
            },
            {
                Value: type_name,
                Label: 'Tipo de Movimento'
            },
            {
                Value: wallat_name,
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
            Label : 'Detalhes da Movimentação',
            Target: '@UI.FieldGroup#Main'
        }],
        FieldGroup #Main: {Data: [
            {Value: name},
            {Value: amount},
            {Value: date},
            {Value: type_ID},
            {Value: wallat_ID},
            {Value: category_ID},
            {Value: note}
        ]}
    }

    entity MovementType as projection on db.MovementType;

    entity Wallats      as projection on db.Wallats;
    entity Categories   as projection on db.Categories;

    entity Movements    as
        projection on db.Movements {
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
                Label         : 'Carteiras',
                CollectionPath: 'Wallats',
                Parameters    : [
                    {
                        $Type            : 'Common.ValueListParameterInOut',
                        LocalDataProperty: 'wallat_ID',
                        ValueListProperty: 'ID'
                    },
                    {
                        $Type            : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty: 'name'
                    }
                ]
            }
            @Common.TextArrangement: #TextOnly
            @Common.Text           : wallat_name
            wallat,
            wallat.name                           as wallat_name,
            @Common.ValueList      : {
                Label         : 'Categorias',
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
            category.icon || ' ' || category.name as category_name : String(80),
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
