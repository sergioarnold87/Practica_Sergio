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

Escriba una consulta que muestre el ID del pedido, el ID de la cuenta y el
monto total en dólares de todos los pedidos, ordenados primero por el ID de
la cuenta (en orden ascendente) y luego por el monto total en dólares
(en orden descendente).



Ahora escriba una consulta que muestre nuevamente el ID del pedido, el ID de la
cuenta y el monto total en dólares de cada pedido, pero esta vez ordenados
primero por el monto total en dólares (en orden descendente) y luego por el
ID de la cuenta (en orden ascendente). Compare los resultados de estas dos
consultas anteriores. ¿En qué se diferencian los resultados cuando cambia
la columna que ordena primero?
