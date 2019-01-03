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
