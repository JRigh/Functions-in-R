# Stirling’s formula in R ———————-

stirling = function(n) {
  
  sqrt(2 * pi * n) * (n^n) * exp(-n)
  
}

# comparison
approximation = stirling(15)
exact = factorial(15)
approximation # 1.300431e+12
exact # 1.307674e+12

# plot
exact = factorial(seq(1,4, by = 0.01))
stirlings = stirling(seq(1,4, by = 0.01))
index = seq(1,4, by = 0.01)
dataset = tibble(index, exact, stirlings)

dataset_long <- melt(dataset, id.vars = "index")  # library(rehsape2)
head(dataset_long)  

ggplot(dataset_long, aes(x = index, y = value, col = variable)) +
  geom_line() + 
  geom_point(size = 0.6) +
  labs(title = 'Exact factorial vs Stirling approximation',
       subtitle = 'exact(orange) vs stirling (green)',
       y="", x="") +
  theme(axis.text=element_text(size=8),
        axis.title=element_text(size=8),
        plot.subtitle=element_text(size=9, face="italic", color="darkred"),
        panel.background = element_rect(fill = "white", colour = "grey50"),
        panel.grid.major = element_line(colour = "grey90"))

#----
# end
#----




