# Microbiome analysis lectures

## PCA and PCoA

Editable Quarto / Reveal.js lecture with executable R, equations, speaker notes,
and a synthetic ten-community, six-taxon demonstration. The first draft assumes familiarity
with community abundance tables and introduces the required linear algebra.

```sh
quarto preview lectures/01-pca-pcoa/slides.qmd
quarto render lectures/01-pca-pcoa/slides.qmd
```

From the project root, use the commands above. Open `_output/lectures/01-pca-pcoa/slides.html` in a browser to present. Press **S** for speaker view,
**F** for fullscreen, and **O** for an overview. Speaker view can depend on browser
permissions and connectivity for an embedded presentation. MathJax may require
network access on first load. Use preview while rehearsing.

R chunks run during rendering. They do not provide a live R console in the slides.
The analysis uses base R. Rendering requires Quarto, knitr and rmarkdown.
`R/setup.R` holds the teaching data and helpers. `shared/theme.scss` at the project root controls appearance.

The worked calculation uses `svd()` and `eigen()` directly, including both
SVD and covariance eigendecomposition routes to PCA, without `prcomp()`
or `cmdscale()`. All samples and matrix columns appear in the worked outputs.
Separate slides explain each operation and show its full result. Reconstruction
checks run during rendering. `dist()` is used only to verify recovered geometry.

The synthetic example represents stool samples from ten different infants at
three months of age. This is a cross-sectional example, not a time series. Abundances
are percentages within six selected taxa, not whole-microbiome estimates.
B. longum and B. breve are mutually exclusive by construction. Exact abundances
and exclusion are teaching assumptions, not empirical estimates or universal rules.

The ecological comparison focuses on Euclidean distance and Bray-Curtis.
It explains abundance overlap, squared versus absolute changes, and the role
of sample normalization. A separate thought experiment redistributes the same
amount of relative abundance across different numbers of taxa.
