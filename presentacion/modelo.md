# Modelo de Análisis Factorial

## Definición

Sean las variables observables tipificadas $(X_1,X_2,\dots,X_p)$ (media 0 y varianza 1). Entonces, el modelo es de análisis factorial es:

$$\left\{
    \begin{array}{rcl}
    \label{def:def1}
      X_1 & = & I_{11}+F_1+I_{12}F_2 + \dots + I_{1m}F_m + e_1 \\
      X_2 & = & I_{21}+F_1+I_{22}F_2 + \dots + I_{2m}F_m + e_2 \\
      ......................................................... \\
      X_p & = & I_{p1}+F_1+I_{p2}F_2 + \dots + I_{pm}F_m + e_p \\
    \end{array}
  \right.$$

donde  
- $I_{jh}$ es el peso del factor \textit{h} en la variable $X_j$  
- $F_1,F_2,\dots,F_p$ son factores comunes  
- $e_1,e_2,\dots e_p$ son factores únicos o específicos  

## Definición

En el modelo expuesto, cada una de las $p$ variables observables $(X_1,X_2,\dots,X_p)$ es una combinación lineal de $m$ factores comunes ($m < p$) y de un factor único ($e_p$).  

En otras palabras, todas las variables originales vienen influidas por todos los factores comunes, mientras que existe un factor único que es específico de cada variable.  

El sistema anterior genera la siguiente ecuación matricial:

$$
  \begin{bmatrix}
    X_1 \\
    X_2 \\
    \vdots \\
    X_p
  \end{bmatrix} =
  \begin{bmatrix}
    I_{11} & I_{12} & \dots & I_{1m} \\
    I_{21} & I_{22} & \dots & I_{2m} \\
    \vdots &  \vdots & \ddots & \vdots \\
    I_{p1} & I_{p2} & \dots & I_{pm}
  \end{bmatrix}
  \begin{bmatrix}
    F_1 \\
    F_2 \\
    \vdots \\
    F_m
  \end{bmatrix} +
  \begin{bmatrix}
    e_1 \\
    e_2 \\
    \vdots \\
    e_p
  \end{bmatrix}
$$

es decir, $x = Lf+e$.  

## Hipótesis sobre los factores comunes

- La esperanza de cada factor común es nula: $E[f] = 0 \hspace{0.5cm} \forall f$  
- La matriz de covarianzas de los factores comunes es la matriz identidad: $E[ff'] = I$  

En consecuencia, los factores comunes no están correlacionados, ya que todos los elementos fuera de la diagonal son nulos.

Así pues, los factores comunes son variables tipificadas de media 0 y varianza 1 y no tienen correlación entre sí.

## Hipótesis sobre los factores únicos

- La esperanza de cada uno de los factores únicos es nula: $E[e] = 0 $
- La matriz de covarianzas de los factores únicos es la matriz diagonal $\Omega$: $E[e e'] = \Omega$

Por tanto, las varianzas de los factores únicos pueden ser distintas, y además los factores únicos están correlacionados entre sí.

- La matriz de covarianzas entre los factores comunes y los factores únicos es la matriz nula: $E[f e'] = 0$

Para poder hacer inferencia en cada variable de forma que permita distinguir entre los factores comunes y el factor único es necesario postular que los factores comunes no tienen correlación con el factor único.  

## Propiedades del modelo

Dado que las variables $(X_1,X_2,\dots,X_p)$ son tipificadas, su matriz de covarianzas es igual a la matriz de correlación poblacional $R_p$:

$$ E[x x'] = R_p =
    \begin{bmatrix}
     1 & \rho_{12} & \dots & \rho_{1p} \\
     \rho_{21} & 1 & \dots & \rho_{2p} \\
     \vdots & \vdots & \ddots & \vdots \\
     \rho_{p1} & \rho_{p2} & \dots & 1
    \end{bmatrix}
$$

Como son variables tipificadas, la varianza de cada una de ellas es 1. La varianza total de las $p$ variables $X_i$ será $p$.

Considerando $x = Lf+e$, la matriz de correlación poblacional $R_p$ se puede descomponer de la siguiente forma:

## Propiedades del modelo

$$ R_p = E[x x'] = E[(Lf+e)(Lf+e)'] = E[(Lf+e)(f'L'+e')] = $$ $$ E[Lff'L'+Lfe'+ef'L'+ee'] = L E[f f']L' + LE[fe'] + E[ef']L' + E[ee'] =$$ $$LIL' + \Omega = LL' + \Omega  \Rightarrow R_p = LL' + \Omega$$
En la descomposicion, $LL'$ es la parte correspondiente a los factores comunes y $\Omega$ es la matriz de covarianzas de los factores únicos.  

Veámosla en más detalle:

$$\begin{bmatrix}
   1 & \rho_{12} & \dots & \rho_{1p} \\
   \rho_{21} & 1 & \dots & \rho_{2p} \\
   \vdots & \vdots & \ddots & \vdots \\
   \rho_{p1} & \rho_{p2} & \dots & 1
  \end{bmatrix} =$$ 

## Propiedades del modelo

$$=\begin{bmatrix}
    l_{11} & l_{12} & \dots & l_{1m} \\
    l_{21} & l_{22} & \dots & l_{2m} \\
    \vdots & \vdots & \ddots & \vdots \\
    l_{p1} & l_{p2} & \dots & l_{pm}
\end{bmatrix} \begin{bmatrix}
      l_{11} & l_{21} & \dots & l_{p1} \\
      l_{12} & l_{22} & \dots & l_{p2} \\
      \vdots & \vdots & \ddots & \vdots \\
      l_{1m} & l_{2m} & \dots & l_{pm}
\end{bmatrix}+\begin{bmatrix}
      \omega_1^2 & 0 & \dots & 0 \\
      0 & \omega_2^2 & \dots & 0 \\
      \vdots & \vdots & \ddots & \vdots \\
      0 & 0 & \dots & \omega_p^2
\end{bmatrix}$$

La varianza de $X_j$ se descompone: 

$$ \Rightarrow 1 = l_{j1}^2+l_{j2}^2+\dots+l_{jm}^2 + \omega_j^2$$

## Propiedades del modelo

$$\Rightarrow 1 = h_j^2+\omega_j^2$$

- \textbf{$h_j^2$}: Comunalidad (parte de la varianza debida a los factores comunes.
- \textbf{$\omega_j^2$}: Especificidad (parte de la varianza debida a los factores únicos):

**Coeficiente de correlación**: $\rho_{hj} = \sum_{k=1}^{m}l_{hk}l_{jk}$

# Métodos para la extracción de factores

## Método del factor principal

El método del factor principal obtiene el primer factor maximizando la varianza explicada por él, que es 
$$ V_1=\sum_{k=1}^p l_{k1}^2$$
sujeta a las restricciones $r_{hj}=\sum_{k=1}^{m}l_{hk}l_{jk}$

Si definimos $\lambda_{1}=\sum_{h=1}^p l_{h1}^2$, se demuestra que $\lambda_1$ es el mayor valor propio de la matriz de correlaciones
$LL'$ y $(l_{11},l_{21},\dots,l_{p1})'$ es su vector propio asociado.
$$\Rightarrow l_{i1}=\alpha_{i1}	\sqrt{\lambda_1}$$
siendo $(\alpha_{11},\dots,\alpha_{p1}) de módulo unidad$.

## Método del factor principal

Del mismo modo, se define $l_{i2}=\alpha_{i2} \sqrt{\lambda_2}$. El proceso se sigue repitiendo hasta obtener los pesos de todos los factores, esto es, la matriz factorial.  
El método del factor principal puede explicarse por la diagonalización de la matriz $LL'$, que tomará la forma:
$$LL'=TD_{\lambda}T'$$
con $T$ matriz cuyas $k$ columnas son los vectores propios de módulo unidad de $LL'$ y $D_{\lambda} = diag(\lambda_1,\dots,\lambda_k)$
$$\Rightarrow L = TD_{\lambda}^{1/2}$$

## Método Alpha

Este método determina la matriz factorial especificando un número **$k$** de factores comunes y formando la matriz **T** de dimensión $p\times k$ con nlos autovectores unitarios correspondientes a los k primeros vectores propios de la matriz $H^{-1}LL'H^{-1}$, donde $H^2$ es la matriz de comunalidades. La matriz factorial es:
$$L=HTD_{\lambda}^{1/2}$$

## Método de la máxima verosimilitud

Método preferido por estadísticos. Asumiendo normalidad en los datos se define una distancia $F$, entre la matriz de covarianzas observada y los valores predichos de esta matriz por el modelo del análisis factorial.

$$F = \log |LL'+ \Omega| + traza(S |LL'+\Omega|^{-1})-\log |S| - p$$
con S matriz de covarianzas muestrales.

Las estimaciones de los pesos factoriales se obtienen minimizando esta función, es decir, *maximizar la función de verosimilitud del modelo k factorial asumiendo normalidad*

# Rotación de los factores

## Rotación de factores

En análisis factorial no existe una solución única para determinar la matriz de pesos, de hecho, se puede multiplicar por una matriz ortogonal $M$ de orden $k\times k$ de modo que 

$$ x = Lf + e = (LM)(M'f)+e$$

Este modelo tiene como factores $f^* = M'f$ y como matriz de pesos $LM$. En este caso, la matriz de covarianzas de las variables originales es
$$ R_p = (LM)(LM)'+\Omega$$

Es trascendente el uso de una matriz ortogonal para conseguir una *estructura simple*. Cuando se consiguee, las variables observadas se encuentran en grupos mutuamente excluyentes de modo que los pesos son altos en unos pocos factores y bajos en el resto.

## Tipos de rotaciones

- Ortogonales: los pesos representan las correlaciones entre los factores y las variable.
	- Rotación varimax
	- Rotación cuartimax
- Oblícuas.
	- Rotación oblimín