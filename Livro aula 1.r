library(tidyverse)

ggplot2::ggplot()

ggplot2::mpg

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = class, y = drv)) +
  geom_abline(intercept = 0, slope = 1, color = "red")

library(dplyr)
mpg %>%
  mutate(
    potencia = ifelse(displ <=4.5, "Sim","Não")
  )%>%
  filter(!is.na(displ)) %>%
  ggplot() +
  geom_point(mapping = aes(x = displ, y = cty), color = "red") +
  labs(x = "Potencia", y = "motor", color = "É potente?")

mpg %>%
  filter(manufacturer == "Audi") %>%
  group_by (year) %>%
  summarise(potencia = mean(displ, na.rm = TRUE)) %>%
  ggplot() +
  geom_line(aes(x = year, y = potencia))

mpg %>%
  filter(year > 2000) %>%
ggplot() +
  geom_bar(aes(x = displ), color = "black", fill = "light blue")

mpg %>%
  count(manufacturer)%>%
  filter(!is.na(manufacturer))%>%
 # dplyr::top_n(3,n) %>%
  ggplot() +
  geom_bar(
    aes(x = manufacturer, y = n),
    stat = "identity",
    color = "red",
    fill = "pink"
  )
mtcars

mpg %>%
  filter(manufacturer %in% c("modelo", "ano")) %>%
  ggplot() +
  geom_point(aes(x = model, y = year)) +
  facet_wrap(.~manufacturer, nrow = 2)

  #qplot(displ, hwy, data=mpg)+facet_wrap(~manufacturer) 
  #qplot(displ, hwy, data=mpg)+facet_wrap(~model)

mpg %>%
  filter(manufacturer %in% c("modelo", "ano")) %>%
  ggplot() +
  geom_point(aes(x = model, y = year)) +
  facet_wrap(~manufacturer, ncol = 2)