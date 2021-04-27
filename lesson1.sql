#escribir una consulta que muestra todos los datos en el occurred_at,
#account_idy channelcolumnas de la tabla web_events, y limita la salida a
#sólo las primeras 15 filas.

select occurred_at, account_id, channel
from web_events
limit 20;

#Escriba una consulta para devolver los 10 primeros pedidos en la tabla de
#pedidos . Incluir el id, occurred_aty total_amt_usd.

select id, occurred_at, total_amt_usd
from orders
limit 10;

#Escriba una consulta para devolver los 5 pedidos principales en términos de
#los más grandes total_amt_usd. Incluir el id, account_idy total_amt_usd.

select id, account_id, total_amt_usd
from orders
order by total_amt_usd desc
limit 5;

#Escriba una consulta para devolver los 20 pedidos más bajos en términos de
#los más pequeños total_amt_usd. Incluir el id, account_idy total_amt_usd.

select id, account_idy, total_amt_usd
from orders
order by total_amt_usd
limit 20;

#Escriba una consulta que muestre el ID del pedido, el ID de la cuenta y el
#monto total en dólares de todos los pedidos, ordenados primero por el ID de
#la cuenta (en orden ascendente) y luego por el monto total en dólares
#(en orden descendente).

select id, account_id, total_amt_usd
from orders
order by account_id, total_amt_usd desc;

Ahora escriba una consulta que muestre nuevamente el ID del pedido, el ID de la
cuenta y el monto total en dólares de cada pedido, pero esta vez ordenados
primero por el monto total en dólares (en orden descendente) y luego por el
ID de la cuenta (en orden ascendente). Compare los resultados de estas dos
consultas anteriores. ¿En qué se diferencian los resultados cuando cambia
la columna que ordena primero?

select id, account_id, total_amt_usd
from orders
order by total_amt_usd desc, account_id;


Extrae las primeras 5 filas y todas las columnas de la tabla de pedidos que
 tienen un monto en dólares gloss_amt_usd mayor o igual a 1000.
select *
from orders
where gloss_amt_usd >=1000
limit 5;


Extrae las primeras 10 filas y todas las columnas de la tabla de pedidos que
 tienen total_amt_usdmenos de 500.
 SELECT *
 FROM orders
 WHERE total_amt_usd < 500
 LIMIT 10;

 Filtre la tabla de cuentas para incluir la empresa name, website y el punto de
  contacto principal ( primary_poc) solo para la empresa Exxon Mobil en la
   tabla de cuentas .
select name, website, primary_poc
from accounts
where name = 'Exxon Mobil';

Ejemplo de operadores matemáticos
select id, (standard_amt_usd/total_amt_usd)*100 as std_percent, total_amt_usd
from orders
limit 10;

Cree una columna que divida el standard_amt_usdpor el standard_qty para
encontrar el precio unitario del papel estándar para cada pedido. Limite
los resultados a los primeros 10 pedidos e incluya los campos idy account_id.

select id, account_id, standard_amt_usd/standard_qty as unit_price
from orders
limit 10;

Escriba una consulta que encuentre el porcentaje de ingresos que proviene del
papel de póster para cada pedido. Deberá usar solo las columnas que
terminan con _usd. (Intente hacer esto sin usar la total columna). Muestre
también los campos id y account_id. NOTA: recibirá un error con la solución
correcta a esta pregunta. Esto ocurre porque al menos uno de los valores
en los datos crea una división por cero en su fórmula. Más adelante en el
curso, aprenderá a manejar este problema por completo. Por ahora, puede
limitar sus cálculos a los primeros 10 pedidos, como hicimos en la
pregunta # 1, y evitará ese conjunto de datos que causa el problema.

select id, account_id,
poster_amt_usd/(standard_amt_usd + gloss_amt_usd + poster_amt_usd) as post_per
from orders
limit 10;

Preguntas con el operador LIKE
Utilice la tabla de cuentas para encontrar

Todas las empresas cuyos nombres comienzan con 'C'.
select name
from accounts
where name like 'C%';


Todas las empresas cuyos nombres contienen la cadena "uno" en algún lugar
del nombre.
select name
from accounts
where name like '%one%';


Todas las empresas cuyos nombres terminan con 's'.
select name
from accounts
where name like '%s';

Usar la cuentas tabla para encontrar la cuenta name, primary_poc y
sales_rep_id para Walmart, Target, y Nordstrom.

select name, primary_poc, sales_rep_id
from accounts
where name in ('Walmart', 'Target', 'Nordstrom');

Utilice la tabla web_events para encontrar toda la información sobre las
personas que fueron contactadas a través del canal de organic o adwords.

select *
from web_events
where channel in ('organic', 'adwords');


Preguntas usando el operador NOT
Podemos extraer todas las filas que se excluyeron de las consultas en los
dos conceptos anteriores con nuestro nuevo operador.

Utilice la tabla de cuentas para encontrar el nombre de la cuenta, el poc
principal y la identificación del representante de ventas de todas las
tiendas, excepto Walmart, Target y Nordstrom.

select name, primary_poc, sales_rep_id
from accounts
where name not in ('Walmart', 'Target', 'Nordstrom');

Utilice la tabla web_events para encontrar toda la información sobre las
personas que fueron contactadas a través de cualquier método, excepto el
uso organico los adwords métodos.
Utilice la tabla de cuentas para encontrar:

select *
from web_events
where channel not in ('organic', 'adwords');

Todas las empresas cuyos nombres no comienzan con 'C'.

select name
from accounts
where name not like 'C%';

Todas las empresas cuyos nombres no contienen la cadena "uno" en algún
lugar del nombre.

select name
from accounts
where name not like '%one%';

Todas las empresas cuyos nombres no terminen con 's'.

select name
from accounts
where name not like '%s';

Escriba una consulta que devuelva todos los pedidos donde el standard_qt y es
superior a 1000, el poster_qt y  es 0 y el gloss_qtyes 0.
SELECT *
FROM orders
WHERE standard_qty > 1000 AND poster_qty = 0 AND gloss_qty = 0;

Utilizando la tabla de cuentas , busque todas las empresas cuyos nombres no
comiencen con 'C' y terminen con 's'.
SELECT name
FROM accounts
WHERE name NOT LIKE 'C%' AND name LIKE '%s';

Cuando usa el operador BETWEEN en SQL, ¿los resultados incluyen los valores
de sus puntos finales o no? Encuentre la respuesta a esta importante pregunta
escribiendo una consulta que muestre la fecha del pedido y los gloss_qty datos
para todos los pedidos donde gloss_qt y está entre 24 y 29. Luego, mire su
resultado para ver si el operador BETWEEN incluyó los valores de inicio y
finalización o no.
SELECT occurred_at, gloss_qty
FROM orders
WHERE gloss_qty BETWEEN 24 AND 29;


Utilice la tabla web_events para encontrar toda la información sobre las
personas que fueron contactadas a través de los canales organico adwords y
que iniciaron su cuenta en cualquier momento de 2016, ordenadas de la más
nueva a la más antigua.
SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords') AND occurred_at BETWEEN '2016-01-01' AND '2017-01-01'
ORDER BY occurred_at DESC;

Preguntas usando el operador OR
Busque una lista de ID de pedidos donde gloss_qtyo poster_qtysea ​​mayor
que 4000. Incluya solo el idcampo en la tabla resultante.
SELECT id
FROM orders
WHERE gloss_qty > 4000 OR poster_qty > 4000;

Escriba una consulta que devuelva una lista de pedidos donde el standard_qty es
cero y el gloss_qtyo poster_qtyes superior a 1000.
select *
from orders
where standard_qty = 0 and (gloss_qty > 1000 or poster_qty > 1000);

Busque todos los nombres de empresas que comienzan con una 'C' o 'W', y el
contacto principal contiene 'ana' o 'Ana', pero no contiene 'eana'.
SELECT *
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%')
AND ((primary_poc LIKE '%ana%' OR primary_poc LIKE '%Ana%')
AND primary_poc NOT LIKE '%eana%');



*********************JOINS*******************************

select orders.*
        accounts.*
    from demo.orders
    join demo.accounts
        on orders.account_id = account.id

select orders.*
from orders
join accounts

si queremos extraer solo el nombre de la cuenta y las fechas en las que esa
cuenta realizó un pedido, pero ninguna de las otras columnas, podemos hacerlo
con la siguiente consulta:

SELECT accounts.name, orders.occurred_at
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

Esta consulta solo extrae dos columnas, no toda la información de
 estas dos tablas. Alternativamente, el siguiente consulta tira de
 todas las columnas de tanto la cuentas y órdenes mesa.

 SELECT *
 FROM orders
 JOIN accounts
 ON orders.account_id = accounts.id;

 Y la primera consulta que ejecutó extrajo toda la información solo
  de la tabla de pedidos :


 SELECT orders.*
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

Intente extraer todos los datos de la tabla de cuentas y todos los datos de la
tabla de pedidos .

select orders.*, accounts.*
from accounts
join orders
on accounts.id = orders.account_id;


Intente extraer standard_qty , gloss_qty y poster_qty de la tabla de pedidos
, y el sitio web y primary_poc de la tabla de cuentas.

select  orders.standard_qty, orders.gloss_qty,
        orders.poster_qty,  accounts.website,
        accounts.primary_poc
from orders
join accounts
on orders.account_id = accounts.id

Proporcione una tabla para todos los web_events asociados con el
nombre de cuenta de Walmart. Debe haber tres columnas. Asegúrese de
incluir la primary_pochora del evento y la channelde cada evento. Además,
puede optar por agregar una cuarta columna para asegurarse de que solo
Walmartse eligieron los eventos.

SELECT r.name region, s.name rep, a.name account
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
ORDER BY a.name;


Proporcione una tabla que proporcione la región para cada sales_rep junto
con sus cuentas asociadas . Su tabla final debe incluir tres columnas: el
 nombre de la región , el nombre del representante de ventas y el nombre de
 la cuenta . Ordene las cuentas alfabéticamente (AZ) según el nombre de la
 cuenta.
SELECT r.name region, a.name account,
       o.total_amt_usd/(o.total + 0.01) unit_price
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id;

Proporcione el nombre de cada región para cada pedido , así como
 nombre de la cuenta y el precio unitario que pagaron (total_amt_usd / total)
 por el pedido. Su tabla final debe tener 3 columnas: nombre de la región ,
 nombre de la cuenta y precio unitario . Algunas cuentas tienen 0 para el
 total , por lo que dividí entre (total + 0.01) para asegurarme de no dividir
 por cero.

 SELECT r.name region, a.name account,
        o.total_amt_usd/(o.total + 0.01) unit_price
 FROM region r
 JOIN sales_reps s
 ON s.region_id = r.id
 JOIN accounts a
 ON a.sales_rep_id = s.id
 JOIN orders o
 ON o.account_id = a.id;1

 Proporcione una tabla que proporcione la región para cada sales_rep junto
 con sus cuentas asociadas . Esta vez solo para la Midwestregión. Su tabla
  final debe incluir tres columnas: el nombre de la región , el nombre del
  representante de ventas y el nombre de la cuenta . Ordene las cuentas
   alfabéticamente (AZ) según el nombre de la cuenta.
   SELECT r.name region, s.name rep, a.name account
   FROM sales_reps s
   JOIN region r
   ON s.region_id = r.id
   JOIN accounts a
   ON a.sales_rep_id = s.id
   WHERE r.name = 'Midwest'
   ORDER BY a.name;

 Proporcione una tabla que proporcione la región para cada sales_rep junto
  con sus cuentas asociadas . Esta vez solo para cuentas donde el representante
   de ventas tiene un nombre que comienza con Sy en la Midwestregión. Su tabla
   final debe incluir tres columnas: el nombre de la región , el nombre del
    representante de ventas y el nombre de la cuenta . Ordene las cuentas
     alfabéticamente (AZ) según el nombre de la cuenta.
     SELECT r.name region, s.name rep, a.name account
     FROM sales_reps s
     JOIN region r
     ON s.region_id = r.id
     JOIN accounts a
     ON a.sales_rep_id = s.id
     WHERE r.name = 'Midwest' AND s.name LIKE 'S%'
     ORDER BY a.name;


 Proporcione una tabla que proporcione la región para cada sales_rep junto con
 sus cuentas asociadas . Esta vez solo para cuentas donde el representante de
 ventas tiene un apellido que comienza con Ky en la Midwestregión. Su tabla
 final debe incluir tres columnas: el nombre de la región , el nombre del
 representante de ventas y el nombre de la cuenta . Ordene las cuentas
 alfabéticamente (AZ) según el nombre de la cuenta.

 SELECT r.name region, s.name rep, a.name account
 FROM sales_reps s
 JOIN region r
 ON s.region_id = r.id
 JOIN accounts a
 ON a.sales_rep_id = s.id
 WHERE r.name = 'Midwest' AND s.name LIKE '% K%'
 ORDER BY a.name;
 Proporcione el nombre de cada región para cada pedido , así como el nombre
  de la cuenta y el precio unitario que pagaron (total_amt_usd / total) por
  el pedido. Sin embargo, solo debe proporcionar los resultados si excede la
   cantidad estándar del pedido100 . Su tabla final debe tener 3 columnas:
   nombre de la región , nombre de la cuenta y precio unitario . Para evitar
    una división por error cero, agregar .01 al denominador aquí es útil
    total_amt_usd / (total + 0.01).

    SELECT r.name region, a.name account, o.total_amt_usd/(o.total + 0.01) unit_price
    FROM region r
    JOIN sales_reps s
    ON s.region_id = r.id
    JOIN accounts a
    ON a.sales_rep_id = s.id
    JOIN orders o
    ON o.account_id = a.id
    WHERE o.standard_qty > 100;

 Proporcione el nombre de cada región para cada pedido , así como el nombre de
  la cuenta y el precio unitario que pagaron (total_amt_usd / total) por el
   pedido. Sin embargo, solo debe proporcionar los resultados si la cantidad
    de pedido estándar excede 100y la cantidad de pedido de póster
    excede 50. Su tabla final debe tener 3 columnas: nombre de la región ,
     nombre de la cuenta y precio unitario . Ordene primero por el precio
      unitario más pequeño . Para evitar una división por error cero, es
       útil agregar .01 al denominador aquí (total_amt_usd / (total + 0.01).
       SELECT r.name region, a.name account, o.total_amt_usd/(o.total + 0.01) unit_price
       FROM region r
       JOIN sales_reps s
       ON s.region_id = r.id
       JOIN accounts a
       ON a.sales_rep_id = s.id
       JOIN orders o
       ON o.account_id = a.id
       WHERE o.standard_qty > 100 AND o.poster_qty > 50
       ORDER BY unit_price;


 Proporcione el nombre de cada región para cada pedido , así como el nombre
  de la cuenta y el precio unitario que pagaron (total_amt_usd / total) por
   el pedido. Sin embargo, solo debe proporcionar los resultados si la cantidad
   de pedido estándar excede 100y la cantidad de pedido de póster excede 50.
   Su tabla final debe tener 3 columnas: nombre de la región , nombre de la
    cuenta y precio unitario . Ordene primero por el precio unitario más
    grande . Para evitar una división por error cero, es útil agregar .01 al
    denominador aquí (total_amt_usd / (total + 0.01).

    SELECT r.name region, a.name account, o.total_amt_usd/(o.total + 0.01) unit_price
    FROM region r
    JOIN sales_reps s
    ON s.region_id = r.id
    JOIN accounts a
    ON a.sales_rep_id = s.id
    JOIN orders o
    ON o.account_id = a.id
    WHERE o.standard_qty > 100 AND o.poster_qty > 50
    ORDER BY unit_price DESC;

 ¿Cuáles son los diferentes canales utilizados por ID de cuenta 1001 ? Su mesa
  final debe tener solo 2 columnas: el nombre de la cuenta y los diferentes
  canales . Puede probar SELECT DISTINCT para limitar los resultados a solo
   los valores únicos.

   SELECT DISTINCT a.name, w.channel
   FROM accounts a
   JOIN web_events w
   ON a.id = w.account_id
   WHERE a.id = '1001';

 Encuentre todos los pedidos que ocurrieron en 2015. Su mesa final debe tene
 r 4 columnas: occ
 SELECT o.occurred_at, a.name, o.total, o.total_amt_usd
FROM accounts a
JOIN orders o
ON o.account_id = a.id
WHERE o.occurred_at BETWEEN '01-01-2015' AND '01-01-2016'
ORDER BY o.occurred_at DESC;

Pruebe su suerte para encontrar el número de filas en cada tabla.
A continuación, se muestra un ejemplo de cómo encontrar todas las filas
en la tabla de cuentas .
SELECT COUNT(*)
FROM accounts;

Pero podríamos haber elegido fácilmente una columna para colocarla en
la función de agregación:
Pero podríamos haber elegido fácilmente una columna para colocarla en la función de agregación:

SELECT COUNT(accounts.id)
FROM accounts;

Encuentre la cantidad total de papel poster_qty pedido en la tabla de pedidos .

Encuentre la cantidad total de papel standard_qty pedido en la tabla de pedidos .

Encuentre el monto total en dólares de las ventas utilizando total_amt_usd
en la tabla de pedidos .

Encuentre la cantidad total gastada en papel standard_amt_usd y gloss_amt_usd
 para cada pedido en la tabla de pedidos. Esto debería dar una cantidad en dólares para cada pedido en la tabla.

Encuentre el standard_amt_usd por unidad de papel standard_qty . Su solución
debe utilizar tanto una agregación como un operador matemático.
