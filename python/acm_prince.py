"""ACM avec la bibliotheque prince. Lancer depuis la racine : python python/acm_prince.py"""
import os
import pandas as pd
import matplotlib.pyplot as plt
import prince

os.makedirs("figures", exist_ok=True)

df = pd.read_csv("data/dataset_ACM.csv", encoding="utf-8").set_index("Annee")
df = df.astype("category")

mca = prince.MCA(n_components=2, n_iter=10, random_state=42)
mca = mca.fit(df)

rows = mca.row_coordinates(df)        # annees
cols = mca.column_coordinates(df)     # modalites
print(mca.eigenvalues_summary)

fig, ax = plt.subplots(figsize=(8, 7))
ax.scatter(rows[0], rows[1], c="blue")
for year, (x, y) in rows.iterrows():
    ax.annotate(str(year), (x, y), fontsize=8)
ax.axhline(0, color="grey", lw=.5); ax.axvline(0, color="grey", lw=.5)
ax.set(title="ACM : projection des annees", xlabel="Dimension 1", ylabel="Dimension 2")
fig.savefig("figures/acm_py_individus.png", dpi=150, bbox_inches="tight")

fig, ax = plt.subplots(figsize=(9, 7))
ax.scatter(cols[0], cols[1], c="tomato")
for name, (x, y) in cols.iterrows():
    ax.annotate(name, (x, y), fontsize=7)
ax.axhline(0, color="grey", lw=.5); ax.axvline(0, color="grey", lw=.5)
ax.set(title="ACM : projection des modalites", xlabel="Dimension 1", ylabel="Dimension 2")
fig.savefig("figures/acm_py_modalites.png", dpi=150, bbox_inches="tight")
