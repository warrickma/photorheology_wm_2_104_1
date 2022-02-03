library(ggplot2)
library(reshape2)
library(svglite)
WM_2_104 = read.csv("photorheology.csv")
colnames(WM_2_104) = c("Storage", "Loss", "Time")
WM_2_104$Storage = as.numeric(as.character(WM_2_104$Storage))
WM_2_104$Loss = as.numeric(as.character(WM_2_104$Loss))
WM_2_104$Time = as.numeric(as.character(WM_2_104$Time))
WM_2_104 = melt(WM_2_104, id.vars = c("Time"))
ggplot(WM_2_104, aes(x = Time, y = value, color = variable)) +
  geom_line(size=1) +
  labs(x = "Time (s)", y = "Modulus (MPa)") +
  scale_color_manual(values = c("#B31B1B", "#222222"),
                     name = "Modulus",
                     breaks = c("Storage", "Loss"),
                     labels = c("G'", "G''")) +
  theme_classic() +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", color = "black", size = 26), 
        axis.text.x = element_text(size=10, face = "bold", color = "black"), 
        axis.text.y = element_text(size=10, face = "bold", color = "black"),
        legend.text = element_text(size = 10, face = "bold", color = "black"),
        legend.title = element_blank(),
        axis.title = element_text(size=10, color = "black", face = "bold"),
        legend.position = c(0.8, 0.4)) +
  scale_y_continuous(limits=c(0,0.5))+
  annotate("rect", xmin = 10, xmax = Inf, ymin = -Inf, ymax = Inf, fill = "#590098", alpha = 0.2)
ggsave("thiols.svg", width = 50, height = 50, units = "mm")
