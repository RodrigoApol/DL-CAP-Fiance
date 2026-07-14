using cap.schema as db from '../db/schema';

@path: '/movements-types'
service MovementsTypesService {
    @UI: {
        SelectionFields : [description],
        LineItem        : [{
            Value: description,
            Label: 'Descrição'
        }],
        Facets          : [{
            $Type : 'UI.ReferenceFacet',
            Label : 'Detalhes do Tipo de Movimento',
            Target: '@UI.FieldGroup#Main'
        }],
        FieldGroup #Main: {Data: [{
            Value: description,
            Label: 'Descrição'
        }]}
    }

    // Capabilities implicitas
    entity MovementType as projection on db.MovementType;

    annotate MovementType with @odata.draft.enabled;
}
