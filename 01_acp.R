# ACP - Analyse en Composantes Principales (FactoMineR / factoextra)
# Lancer depuis la racine du projet : Rscript R/01_acp.R
pkgs <- c("FactoMineR", "factoextra", "ggplot2")
for (p in pkgs) if (!requireNamespace(p, quietly = TRUE)) install.packages(p)
library(FactoMineR); library(factoextra); library(ggplot2)

dir.create("figures", showWarnings = FALSE)

data <- read.csv("data/dataset_ACP.csv", sep = ",", header = TRUE, check.names = FALSE)

# Variables quantitatives uniquement (on retire l'annee, qui n'est pas un indicateur)
data_num <- data[, setdiff(names(data), "Annee")]
data_num <- data_num[, sapply(data_num, is.numeric)]

# NB : des valeurs manquent (ex. masse monetaire 2025) -> imputees par la moyenne
res.pca <- PCA(data_num, scale.unit = TRUE, ncp = ncol(data_num), graph = FALSE)

eig <- get_eigenvalue(res.pca)
print(eig)
write.csv(eig, "figures/acp_valeurs_propres.csv")

var <- get_pca_var(res.pca)
print(round(var$contrib, 2))
print(round(var$cos2, 3))

ggsave("figures/acp_eboulis.png", fviz_eig(res.pca, addlabels = TRUE), width = 7, height = 5, dpi = 150)
ggsave("figures/acp_cercle_correlations.png",
       fviz_pca_var(res.pca, col.var = "contrib",
                    gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"), repel = TRUE),
       width = 7, height = 7, dpi = 150)
