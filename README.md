# Unit-Lindley

This repository is related to the unit-Lindley (UL) distribution, which has many interesting properties, such as having only one parameter, from which we develop the unit-Lindley chart for both classical and applied symbolic data representation. If X is a random variable with UL density distribution, $X \sim UL (\theta)$, then it is defined as,

$$f( x | \theta ) = \frac{\theta^2}{1+\theta} (1-x)^{-3} exp(−\frac{\theta x}{1 - x}), \ \ \ \ 0 < x < 1$$.

The quantile function, $Q( p| \theta ) = F^{−1} ( p | \theta )$, as

$$Q( p | \theta ) = \frac{1 + \theta + W_{−1} ((1 + \theta )( p − 1 ) exp[−(1 + \theta)])}{1 + W_{−1} ((1 + \theta )( p − 1 ) exp[−(1 + \theta )])}, \ \ \ \ for \ \ 0 \leq p \leq 1$$,

where $W_{−1}$ denotes the negative branch of the Lambert W function.

As an example, the `Bivariate_Control_Plot.R` file illustrates the estimation of the univariate UL in the Max-Min daily period for the Humidity in Copiapó city (Atacama/Chile). Published by Fonseca, A.; Ferreira, P.H.; Nascimento, D.C.; Fiaccone, R.; Ulloa-Correa, C.; García-Piña, A.; Louzada, F. (2021) Water Particles Monitoring in the Atacama Desert: SPC Approach Based on Proportional Data. Axioms, 10, p.154. https://doi.org/10.3390/axioms10030154

Our data acquisition came from a weather station located at the University of Atacama in Copiapó, Chile (in the top left-hand picture). In panel A, the digital elevation model for part of the Copiapó watershed is presented. Statistics of the cloud occurrence over the Atacama region (panels B and C), shaded from high probability of cloud occurrence in dark-red to low probability of cloud occurrence in beige. The bottom left-hand map represents Terra MODIS (panel B), and Aqua MODIS (panel C) is in the bottom center map. The transaction of the dark-red area, which occurs mainly during the dawn and morning and is most associated with the Camanchaca increasing the humidity of the Chilean third region coast up to the beginning of the highlands, turns into the low scale of humidity right in the afternoons, represented by the full red map. Two bays are to be noticeable: in Copiapó and Huasco, as convergence points. 
<img width="2417" height="1248" alt="Image" src="https://github.com/user-attachments/assets/e7e7d5f6-90ae-42a6-8f6b-5acef2261393" />

Humidity variation, collected per hour, from Copiapó (Chile) in the last five years. Panel A presents the histogram of the time series (TS), and panel B shows the dynamic of this series in light blue. Also, the solid line represents the TS average using a LOESS (an acronym for “Locally Estimated Scatterplot Smoothing”) smoothing method.
![Image](https://github.com/user-attachments/assets/3006d28b-9f2c-4ba8-9e2c-88d0ff129433)

SDA bivariate control chart for the daily humidity in Phase II monitoring (records from 2021). Through the 3D plot, the z-axis represents the maximum upper bound and the y-axis the minimum lower bound from the daily humidity (aggregated per periods), adopting a certain tolerance level (α=0.15 or 15%), whereas the x-axis is related to the time observation points (as dots). The estimated control limits are represented as a shaded box, observed out-of-control points are highlighted as red points and their projections placed in the control chart projections. Thus, the TS projection on the bottom (x- and y-axes) is the control chart related to the minimum daily humidity, and the TS projection on the background (x- and z-axes) is the control chart of the maximum daily humidity.
![Image](https://github.com/user-attachments/assets/e84e8194-7aaa-4453-ba9a-d323b152980e)

Special thanks to Oilson Alberto Gonzatto Junior for helping develop the last figure.
