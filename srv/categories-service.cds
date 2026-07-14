using {cap.schema as db} from '../db/schema';

@path: '/categories'
service CategoriesService {
    @UI: {
        SelectionFields : [name],
        LineItem        : [
            {
                Value: name,
                Label: 'Nome'
            },
            {
                Value: icon,
                Label: 'Ícone'
            }
        ],
        Facets          : [{
            $Type : 'UI.ReferenceFacet',
            Label : 'Detalhes da Categoria',
            Target: '@UI.FieldGroup#Main'
        }],
        FieldGroup #Main: {Data: [
            {
                Value: name,
                Label: 'Nome'
            },
            {
                Value: icon,
                Label: 'Ícone'
            },
        ]}
    }

    entity Categories @(capabilities: {
        InsertRestrictions: {
            $Type: 'cds.capabilities.InsertRestrictionsType',
            Insertable
        },
        UpdateRestrictions: {
            $Type: 'cds.capabilities.UpdateRestrictionsType',
            Updatable
        },
        DeleteRestrictions: {
            $Type: 'cds.capabilities.DeleteRestrictionsType',
            Deletable
        }
    }) as projection on db.Categories;

    annotate Categories with @odata.draft.enabled;
}
