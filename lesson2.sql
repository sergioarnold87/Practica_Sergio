Encuentre la cantidad total de papel poster_qty pedido en la tabla de pedidos .

SELECT SUM(poster_qty) AS total_poster_sales
FROM orders;
Encuentre la cantidad total de papel standard_qty pedido en la tabla de pedidos .

SELECT SUM(standard_qty) AS total_standard_sales
FROM orders;
Encuentre el monto total en dólares de las ventas utilizando total_amt_usd en la tabla de pedidos .

SELECT SUM(total_amt_usd) AS total_dollar_sales
FROM orders;
Encuentre el monto total de cada pedido individual que se gastó en papel estándar y brillante en la tabla de pedidos. Esto debería dar una cantidad en dólares para cada pedido en la tabla.

Tenga en cuenta que esta solución no utilizó un agregado .

SELECT standard_amt_usd + gloss_amt_usd AS total_standard_gloss
FROM orders;
Aunque el precio / cantidad_estándar varía de un pedido a otro. Me gustaría tener esta relación en todas las ventas realizadas en la tabla de pedidos .

Tenga en cuenta que esta solución utilizó tanto un agregado como nuestros operadores matemáticos

SELECT SUM(standard_amt_usd)/SUM(standard_qty) AS standard_price_per_unit
FROM orders;


****************************

Preguntas: MIN, MAX y AVERAGE
Utilice el entorno SQL a continuación para ayudar a responder las siguientes preguntas. Ya sea que se quede atascado o simplemente quiera
 verificar sus soluciones, mis respuestas se pueden encontrar en la parte superior del siguiente concepto.

¿Cuándo se realizó el primer pedido? Solo necesitas devolver la fecha.

select min(occurred_at)
from orders;


Intente realizar la misma consulta que en la pregunta 1 sin usar una función de agregación.

select occurred_at
from orders
order by occurred_at
limit 1;


¿Cuándo ocurrió el web_event más reciente (último) ?

select max(occurred_at)
from web_events;

Intente realizar el resultado de la consulta anterior sin utilizar una función de agregación.

select occurred_at
from web_events
order by occurred_at desc
limit 1;

Encuentre el monto promedio ( PROMEDIO ) gastado por pedido en cada tipo de papel, así como el monto promedio de cada tipo de papel
comprado por pedido. Su respuesta final debe tener 6 valores, uno para cada tipo de papel para el número promedio de ventas, así como el monto promedio.

SELECT AVG(standard_qty) mean_standard, AVG(gloss_qty) mean_gloss,
           AVG(poster_qty) mean_poster, AVG(standard_amt_usd) mean_standard_usd,
           AVG(gloss_amt_usd) mean_gloss_usd, AVG(poster_amt_usd) mean_poster_usd
FROM orders;


A través del video, es posible que le interese cómo calcular la MEDIANA. Aunque esto es más avanzado de lo que hemos cubierto hasta ahora,
intente encontrar: ¿cuál es el MEDIANO total_usd gastado en todos los pedidos ?

SELECT *
FROM (SELECT total_amt_usd
      FROM orders
      ORDER BY total_amt_usd
      LIMIT 3457) AS Table1
ORDER BY total_amt_usd DESC
LIMIT 2;

***********************************************************************************
Preguntas: GROUP BY

Utilice el entorno SQL a continuación para ayudar a responder las siguientes preguntas. Ya sea que se quede atascado o simplemente quiera verificar
sus soluciones, mis respuestas se pueden encontrar en la parte superior del siguiente concepto.
Una parte que puede ser difícil de reconocer es cuándo podría ser más fácil usar un agregado o una de las otras funcionalidades de SQL. Pruebe algunas
de las siguientes opciones para ver si puede diferenciarse y encontrar la solución más sencilla.

¿Qué cuenta (por nombre) realizó el primer pedido? Su solución debe tener el nombre de la cuenta y la fecha del pedido.

select a.name, o.occurred_at
from accounts a
join orders o
on a.id = o.account_id
order by occurred_at
limit 1;


Encuentre las ventas totales en usd para cada cuenta. Debe incluir dos columnas: las ventas totales de los pedidos de cada empresa en usd y
el nombre de la empresa .

select a.name, sum(total_amt_usd) total_sales
from orders o
join accounts a
on a.id = o.account_id
group by a.name;

¿A través de qué canal se produjo el web_event más reciente (último) , qué cuenta se asoció con este web_event ? Su consulta debe devolver
solo tres valores: la fecha , el canal y el nombre de la cuenta .

select w.occurred_at, w.channel, a.name
from web_events w
join accounts a
on w.account_id = a.id
order by w.occurred_at desc
limit 1;


Encuentre el número total de veces que se utilizó cada tipo de canal de web_events . Su tabla final debe tener dos columnas: el canal y la
cantidad de veces que se utilizó el canal.

select w.channel, count(*)
from web_events w
group by w.channel

¿Quién fue el contacto principal asociado con el primer web_event ?

select a.primary_poc
from web_events w
join accounts a
on a.id = w.account_id
order by w.occurred_at
limit 1;


¿Cuál fue el pedido más pequeño realizado por cada cuenta en términos de usd totales ? Proporcione solo dos columnas: el nombre de la cuenta y
el total de usd . Ordene desde las cantidades en dólares más pequeñas hasta las más grandes.

select a.name, min(total_amt_usd) smallest_order
from accounts a
join orders o
on a.id = o.account_id
group by a.name
order by smallest_order;

Encuentre el número de representantes de ventas en cada región. Su tabla final debe tener dos columnas: la región y el número de ventas_reps.
Ordene desde la menor cantidad de repeticiones hasta la mayoría de las repeticiones.

select r.name. count(*) num_reps
from region r
join sales_reps s
on r.id = s.region_id
group by r.name
order by num_reps;

Para cada cuenta, determine la cantidad promedio de cada tipo de papel que compraron en sus pedidos. Su resultado debe tener cuatro columnas:
una para el nombre de la cuenta y otra para el promedio gastado en cada uno de los tipos de papel.

SELECT a.name, AVG(o.standard_qty) avg_stand, AVG(o.gloss_qty) avg_gloss, AVG(o.poster_qty) avg_post
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name;

Para cada cuenta, determine la cantidad promedio gastada por pedido en cada tipo de papel. Su resultado debe tener cuatro columnas: una para el nombre
de la cuenta y otra para el monto promedio gastado en cada tipo de papel.

SELECT a.name, AVG(o.standard_amt_usd) avg_stand, AVG(o.gloss_amt_usd) avg_gloss, AVG(o.poster_amt_usd) avg_post
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name;

Determine la cantidad de veces que se usó un canal en particular en la tabla web_events para cada representante de ventas . Su tabla final debe tener
 tres columnas: el nombre del representante de ventas , el canal y la cantidad de ocurrencias. Ordene primero su tabla con el mayor número de ocurrencias.

SELECT s.name, w.channel, COUNT(*) num_events
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.name, w.channel
ORDER BY num_events DESC;
Determine la cantidad de veces que se usó un canal en particular en la tabla web_events para cada región . Su tabla final debe tener tres columnas: el
nombre de la región , el canal y el número de ocurrencias. Ordene primero su tabla con el mayor número de ocurrencias.

SELECT r.name, w.channel, COUNT(*) num_events
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
JOIN sales_reps s
ON s.id = a.sales_rep_id
JOIN region r
ON r.id = s.region_id
GROUP BY r.name, w.channel
ORDER BY num_events DESC;

DISTINCT siempre se usa en sentencias SELECT y proporciona filas únicas para todas las columnas escritas en la sentencia SELECT . Por lo tanto, solo usa
DISTINCT una vez en cualquier instrucción SELECT en particular .

Podrías escribir:

SELECT DISTINCT column1, column2, column3
FROM table1;

que devolvería las filas únicas (o DISTINCT ) en las tres columnas.

Se podría no escribir:

SELECT DISTINCT column1, DISTINCT column2, DISTINCT column3
FROM table1;

Puede pensar en DISTINCT de la misma manera que podría pensar en la declaración "único".

DISTINCT - Consejo de experto
Vale la pena señalar que el uso de DISTINCT , particularmente en agregaciones, puede ralentizar bastante sus consultas.

Utilice DISTINCT para probar si hay cuentas asociadas con más de una región.

Las dos consultas siguientes tienen el mismo número de filas resultantes (351), por lo que sabemos que cada cuenta está asociada
 con una sola región. Si cada cuenta estaba asociada con más de una región, la primera consulta debería haber devuelto más filas que la segunda consulta.

SELECT a.id as "account id", r.id as "region id",
a.name as "account name", r.name as "region name"
FROM accounts a
JOIN sales_reps s
ON s.id = a.sales_rep_id
JOIN region r
ON r.id = s.region_id;

y

SELECT DISTINCT id, name
FROM accounts;
¿Ha trabajado algún representante de ventas en más de una cuenta?

De hecho, todos los representantes de ventas han trabajado en más de una cuenta. El menor número de cuentas en las que trabaja un representante de
ventas es 3. Hay 50 representantes de ventas y todos tienen más de una cuenta. El uso de DISTINCT en la segunda consulta asegura que todos los
representantes de ventas se tengan en cuenta en la primera consulta.

SELECT s.id, s.name, COUNT(*) num_accounts
FROM accounts a
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.id, s.name
ORDER BY num_accounts;
y

SELECT DISTINCT id, name
FROM sales_reps;

¿Cuántos de los representantes de ventas tienen más de 5 cuentas que administran?

SELECT s.id, s.name, COUNT(*) num_accounts
FROM accounts a
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.id, s.name
HAVING COUNT(*) > 5
ORDER BY num_accounts;
y técnicamente, podemos obtener esto usando una SUBQUERY como se muestra a continuación. Esta misma lógica se puede utilizar para las otras consultas, pero no se mostrará.

SELECT COUNT(*) num_reps_above5
FROM(SELECT s.id, s.name, COUNT(*) num_accounts
     FROM accounts a
     JOIN sales_reps s
     ON s.id = a.sales_rep_id
     GROUP BY s.id, s.name
     HAVING COUNT(*) > 5
     ORDER BY num_accounts) AS Table1;
¿Cuántas cuentas tienen más de 20 pedidos?


SELECT a.id, a.name, COUNT(*) num_orders
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING COUNT(*) > 20
ORDER BY num_orders;
¿Qué cuenta tiene más pedidos?

SELECT a.id, a.name, COUNT(*) num_orders
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY num_orders DESC
LIMIT 1;
¿Cuántas cuentas gastaron más de 30,000 usd en total en todos los pedidos?

SELECT a.id, a.name, SUM(o.total_amt_usd) total_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING SUM(o.total_amt_usd) > 30000
ORDER BY total_spent;
¿Cuántas cuentas gastaron menos de 1,000 usd en total en todos los pedidos?

SELECT a.id, a.name, SUM(o.total_amt_usd) total_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING SUM(o.total_amt_usd) < 1000
ORDER BY total_spent;

¿Qué cuenta ha gastado más con nosotros?

SELECT a.id, a.name, SUM(o.total_amt_usd) total_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY total_spent DESC
LIMIT 1;

¿Qué cuenta ha gastado menos con nosotros?

SELECT a.id, a.name, SUM(o.total_amt_usd) total_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY total_spent
LIMIT 1;

¿Qué cuentas se utilizaron facebookcomo canal para contactar con los clientes más de 6 veces?

SELECT a.id, a.name, w.channel, COUNT(*) use_of_channel
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
GROUP BY a.id, a.name, w.channel
HAVING COUNT(*) > 6 AND w.channel = 'facebook'
ORDER BY use_of_channel;

¿Qué cuenta se utilizó facebookmás como canal ?

SELECT a.id, a.name, w.channel, COUNT(*) use_of_channel
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
WHERE w.channel = 'facebook'
GROUP BY a.id, a.name, w.channel
ORDER BY use_of_channel DESC
LIMIT 1;

Nota: Esta consulta anterior solo funciona si no hay vínculos para la cuenta que más usó Facebook. Es una buena práctica usar
primero un número de límite mayor, como 3 o 5, para ver si hay empates antes de usar el LÍMITE 1.

¿Qué canal fue utilizado con más frecuencia por la mayoría de las cuentas?

SELECT a.id, a.name, w.channel, COUNT(*) use_of_channel
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
GROUP BY a.id, a.name, w.channel
ORDER BY use_of_channel DESC
LIMIT 10;

Todos los 10 principales lo son direct.
