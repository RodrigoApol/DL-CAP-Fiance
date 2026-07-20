namespace cap.schema;

using {
    cuid,
    managed
} from '@sap/cds/common';

entity Wallets : cuid, managed {
    @title: 'Nome'
    name : String(50);
}

entity Categories : cuid, managed {
    @title: 'Nome'
    name  : String(50);

    @title: 'Ícone'
    icon  : String(30);

    @title: 'Cor'
    color : String(10);
}

entity Movements : cuid, managed {
    @title: 'Nome'
    name     : String(50);

    @title: 'Valor'
    amount   : Decimal(10, 2);

    @title: 'Data'
    date     : Date;

    // Associações
    @title: 'Tipo de Movimento'
    type     : Association to MovementType;

    @title: 'Carteira'
    wallet   : Association to Wallets;

    @title: 'Categoria'
    category : Association to Categories;

    @title: 'Anotação'
    note     : String(100);
}

entity MovementType : cuid, managed {
    @title: 'Descrição'
    description : String(50);
}
