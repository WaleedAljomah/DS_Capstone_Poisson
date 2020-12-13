# Shinyapp to illustrate Poisson distribuation

Shiny app to use Poisson distribution to calculate probability of events in a specific time 

The Poisson distribution may be useful to model events such as

- The number of patients arriving in an emergency room between 10 and 11 pm
- The number of calls in a call center in one shift

Poisson distribution formula :

<a href="https://www.codecogs.com/eqnedit.php?latex=\LARGE&space;P(k)=e^{-\lambda}\frac{\lambda^{k}}{k!}" target="_blank"><img src="https://latex.codecogs.com/svg.latex?\LARGE&space;P(k)=e^{-\lambda}\frac{\lambda^{k}}{k!}" title="\LARGE P(k)=e^{-\lambda}\frac{\lambda^{k}}{k!}" /></a>

if 
- (λ) lambda rate parameter (one event(1)/time in between events * time period)
- (k) new events that happen in the same time period of interest 

then the formula can be 

<a href="https://www.codecogs.com/eqnedit.php?latex=\fn_cm&space;\LARGE&space;Probability(events)=&space;e^{-\frac{1}{in&space;between}*period}*\frac{\frac{1}{in&space;between}*period^{events}}{events!}" target="_blank"><img src="https://latex.codecogs.com/svg.latex?\fn_cm&space;\LARGE&space;Probability(events)=&space;e^{-\frac{1}{in&space;between}*period}*\frac{\frac{1}{in&space;between}*period^{events}}{events!}" title="\LARGE Probability(events)= e^{-\frac{1}{in between}*period}*\frac{\frac{1}{in between}*period^{events}}{events!}" /></a> 



In this shiny app,
you can show the distribution based on 2 parameters (Use the sliders to change the value)

- Usual time between Events  
- time period of interest 

the plot is showing a histogram of the events describe by density and a linear cumulative probability model 

you can show the probability of an event based on pre-seted parameters (time in between events, time period)
and the value of an event of interest (Use the sliders to change the value)

- new Events








