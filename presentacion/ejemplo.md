# Aplicación de análisis factorial

## Análisis factorial en R: Paquetes

- psych: Librería de propósito general para teoría de la psicometría y psicología experimental. Sus funciones son fundamentalmente para análisis multivariante usando análisis factorial, PCA o clustering.
- FactoMineR: Librería especializada en análisis exploratorio de datos. Es especialmente potente para PCA con variables cuantitativas y análisis factorial múltiple cuando las variables están estructuradas en grupos.
- robustfa: Solución orientada a objetos para análisis factorial robusto

## Aplicación sobre un dataset: Forest Fire

![Tabla resumen del dataset](./presentacion/imgs/tabla.png)

- FFMC: Fine Fuel Moisture Code (humedad sobre la superficie del terreno y los restos)
- DMC: Duff Moisture Code (índice de humedad entre las capas orgánicas del suelo)
- DC: Drought Code (humedad de las capas orgánicas profundas)
- ISI: Initial Spread Index  (índice de propagación inicial)

## Aplicación sobre un dataset: Forest Fire


Veamos qué variables son relevantes con el test Kaiser-Meyer-Olkin del paquete psych

![KMO](./presentacion/imgs/kmo.png)

![Resultados KMO](./presentacion/imgs/kmo-r.png)

## Aplicación sobre un dataset: Forest Fire

MSA es la medida para la exclusión de variables. Si MSA < 0.5, la variable debería ser eliminada. Si MSA > 0.6, es adecuada y si MSA > 0.8 es muy adecuada para análisis factorial. Elimino las innecesarias y calculo la matriz de correlación con cor()

![Eliminación y correlación](./presentacion/imgs/cor.png)

## Aplicación sobre un dataset: Forest Fire 

![Matriz de correlación](./presentacion/imgs/cor-sal.png)

## Aplicación sobre un dataset: Forest Fire 

Aplico Análisis Factorial sobre los datos con la función fa(). En principio, con tres factores (gracias al criterio de de Kaiser aplicado sobre una representación que relaciona valores propios y la varianza explicada acumulada).

![Análisis Factorial con 3 factores](./presentacion/imgs/fa1.png)

## Aplicación sobre un dataset: Forest Fire 

![Código para la especificación de variables](./presentacion/imgs/g1.png)

## Aplicación sobre un dataset: Forest Fire 

![Carga de los factores](./presentacion/imgs/loading.png)

## Aplicación sobre un dataset: Forest Fire

- DC, DMC, temp y wind definen el factor 1
- X,Y el factor 2
- ISI y FFMC el factor 3

# Bibliografía 

## Referencias

- http://estadistica.net/
- Härdle, Hlávka: *Multivariate Statistics*
- Material del profesor Juan Miguel Marín Diazaraque, UC3M
- R-CRAN
