use company;

-- використання некластиризованого індексу дозволяє пришвидшити пошук по колонці, пошук в якій використовується через WHERE (для полів посада та сімейний_стан)
CREATE INDEX зарплати
ON зарплати(посада);

ALTER TABLE зарплати
DROP INDEX зарплати;

EXPLAIN SELECT т.імя, т.телефон, о.дата_народження, з.посада FROM телефони AS т
JOIN особиста_інформація AS о
ON т.id = о.id
JOIN зарплати AS з
ON т.id = з.id
WHERE посада = 'менеджер';

CREATE INDEX особиста_інформація
ON особиста_інформація(сімейний_стан);

ALTER TABLE особиста_інформація
DROP INDEX особиста_інформація;

EXPLAIN SELECT телефони.імя, телефони.телефон, особиста_інформація.дата_народження, особиста_інформація.сімейний_стан FROM телефони
JOIN особиста_інформація
ON телефони.id = особиста_інформація.id
WHERE сімейний_стан = 'незаміжня';