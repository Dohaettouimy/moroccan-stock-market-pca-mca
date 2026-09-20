# Relations entre indicateurs macroéconomiques et marché boursier marocain (ACP & ACM)

Projet de **Statistiques et Analyse de données** — Master Mathématiques et Ingénierie Numérique (MIN-TN),
Faculté des Sciences de Rabat, Université Mohammed V — 2025-2026.

**Auteures :** Fatima Mellouk, Nour El Hoda El Bssir, Doha Et-Touimy
**Encadrant :** Pr. Baraka Achraf Chakir

## Objectif

Étudier, sur la période **2002-2025** (données annuelles), les liens entre des indicateurs macroéconomiques
(PIB, inflation, taux d'intérêt, chômage, masse monétaire, taux de change, consommation des ménages)
et la performance du **MASI** (Moroccan All Shares Index), à l'aide de deux méthodes factorielles :

- **ACP** (Analyse en Composantes Principales) sur les variables quantitatives ;
- **ACM** (Analyse des Correspondances Multiples) sur les variables discrétisées en terciles.

## Structure du dépôt

```
├── data/
│   ├── dataset_ACP.csv        # variables quantitatives (ACP)
│   ├── dataset_ACM.csv        # variables catégorielles (ACM)
│   ├── base_annuelle.csv      # base complète (avec population rurale/urbaine)
│   └── raw/                   # données originales avec sources
├── R/
│   ├── 01_acp.R               # ACP (FactoMineR, factoextra)
│   └── 02_acm.R               # ACM (FactoMineR, factoextra)
├── python/
│   ├── acm_prince.py          # ACM (prince)
│   └── requirements.txt
├── figures/                   # graphiques générés
└── report/
    ├── rapport.pdf
    └── rapport.docx
```

## Reproduire les résultats

Depuis la racine du dépôt :

```bash
# R
Rscript R/01_acp.R
Rscript R/02_acm.R

# Python
pip install -r python/requirements.txt
python python/acm_prince.py
```

## Variables

| Variable | Description |
|---|---|
| `MASI_rendement_annuel_%` | Rendement annuel du MASI |
| `PIB_croissance_annuelle_%` | Croissance annuelle du PIB réel |
| `Inflation_annuelle_%` | Inflation (prix à la consommation) |
| `Taux_interet_moyen_%` | Taux d'intérêt moyen |
| `Taux_chomage_%` | Taux de chômage |
| `Masse_monetaire_var_annuelle_%` | Variation annuelle de la masse monétaire |
| `Taux_change_var_annuelle_%` | Variation annuelle du taux de change |
| `Depenses_conso_menages_var_annuelle_%` | Variation annuelle de la consommation des ménages |

Sources : voir `data/raw/`.

## Licence

À définir (ex. MIT pour le code, CC-BY pour le rapport).
