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

![Matriz de correlación](./presentacion/imgs/cor-sal.png)