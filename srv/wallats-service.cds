using cap.schema as db from '../db/schema';

@path: '/wallats'
service WallatsService {
    @UI: {
        SelectionFields : [name],
        LineItem        : [{
            Value: name,
            Label: 'Nome'
        }],
        Facets          : [{
            $Type : 'UI.ReferenceFacet',
            Label : 'Detalhes da carteira',
            Target: '@UI.FieldGroup#Main'
        }],
        FieldGroup #Main: {Data: [{
            Value: name,
            Label: 'Nome'
        }]}
    }

    entity Wallats @(capabilities: {
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
    }) as projection on db.Wallats;

    annotate Wallats with @odata.draft.enabled;
}
