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
