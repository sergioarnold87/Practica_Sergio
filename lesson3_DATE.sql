"""
Encuentre las ventas en términos de dólares totales para todos
los pedidos de cada uno year, ordenados de mayor a menor. ¿Observa alguna
tendencia en los totales de ventas anuales?
-----------------------------------------------------------------------------
Find the sales in terms of total dollars for all orders in each year, ordered
from greatest to least. Do you notice any trends in the yearly sales totals?
"""
SELECT DATE_PART('year', occurred_at) ord_year, SUM(total_amt_usd) total_spend
FROM orders
GROUP BY 1
ORDER BY 2 DESC;

"""
¿En qué mes Parch & Posey tuvo las mayores ventas en términos de dólares
 totales? ¿Están todos los meses representados de manera uniforme por el
 conjunto de datos?
Para que esto sea "justo", debemos eliminar las ventas de 2013 y 2017. Por
las mismas razones que se discutieron anteriormente.
-------------------------------------------------------------------------------
Which month did Parch & Posey have the greatest sales in terms of total
dollars? Are all months evenly represented by the dataset?

In order for this to be 'fair', we should remove the sales from 2013 and 2017.
For the same reasons as discussed above.
"""

SELECT DATE_PART('month', occurred_at) ord_month, SUM(total_amt_usd) total_spend
FROM orders
WHERE occurred_at BETWEEN '2014-01-01' AND '2017-01-01'
GROUP BY 1
ORDER BY 2 DESC;
