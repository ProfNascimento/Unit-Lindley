# Unit-Lindley

This repository is related to the unit-Lindley (UL) distribution, which has many interesting properties, such as having only one parameter, from which we develop the unit-Lindley chart for both classical and applied symbolic data representation. If X is a random variable with UL density distribution, $X \sim UL (\theta)$, then it is defined as,

$$f( x | \theta ) = \frac{\theta^2}{1+\theta} (1-x)^{-3} exp(−\frac{\theta x}{1 - x}), \ \ \ \ 0 < x < 1$$.

The quantile function, $Q( p| \theta ) = F^{−1} ( p | \theta )$, as

$$Q( p | \theta ) = \frac{1 + \theta + W_{−1} ((1 + \theta )( p − 1 ) exp{−(1 + \theta)})}{1 + W_{−1} ((1 + \theta )( p − 1 ) exp{−(1 + \theta )})}, \ \ \ \ for \ \ 0 \leq p \leq 1$$,

where $W_{−1}$ denotes the negative branch of the Lambert W function.

As an example, the `Bivariate_Control_Plot.R` file illustrates the estimation of the univariate UL in the Max-Min daily period for the Humidity in Copiapó city (Atacama/Chile). Published by Fonseca, A.; Ferreira, P.H.; Nascimento, D.C.; Fiaccone, R.; Ulloa-Correa, C.; García-Piña, A.; Louzada, F. (2021) Water Particles Monitoring in the Atacama Desert: SPC Approach Based on Proportional Data. Axioms, 10, p.154. https://doi.org/10.3390/axioms10030154
