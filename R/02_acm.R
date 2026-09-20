# ACM - Analyse des Correspondances Multiples (FactoMineR / factoextra)
# Lancer depuis la racine du projet : Rscript R/02_acm.R
pkgs <- c("FactoMineR", "factoextra", "ggplot2")
for (p in pkgs) if (!requireNamespace(p, quietly = TRUE)) install.packages(p)
library(FactoMineR); library(factoextra); library(ggplot2)

dir.create("figures", showWarnings = FALSE)

data <- read.csv("data/dataset_ACM.csv", sep = ",", stringsAsFactors = FALSE, encoding = "UTF-8")
rownames(data) <- data$Annee
data$Annee <- NULL                       # l'annee identifie l'individu, ce n'est pas une variable active
data[] <- lapply(data, as.factor)

res.mca <- MCA(data, graph = FALSE)

eig <- get_eigenvalue(res.mca)
print(eig)
write.csv(eig, "figures/acm_valeurs_propres.csv")

ggsave("figures/acm_eboulis.png", fviz_screeplot(res.mca, addlabels = TRUE, ylim = c(0, 50)),
       width = 7, height = 5, dpi = 150)
ggsave("figures/acm_individus.png", fviz_mca_ind(res.mca, repel = TRUE), width = 7, height = 6, dpi = 150)
ggsave("figures/acm_modalites.png", fviz_mca_var(res.mca, repel = TRUE, col.var = "tomato"),
       width = 7, height = 6, dpi = 150)
